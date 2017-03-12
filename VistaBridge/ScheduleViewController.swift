//
//  ScheduleViewController.swift
//  VistaBridge
//
//  Created by 齐晴 on 16/9/6.
//  Copyright © 2016年 GaryQi. All rights reserved.
//

import UIKit

class ScheduleViewController: UIViewController,UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout{
    
    @IBOutlet weak var choosenView: UICollectionView!
    @IBOutlet weak var scheduleView: UICollectionView!
    //cell的高度
    let cellHeight = 105
    
    //dateLabel
    let dateLabelHeight : CGFloat = 14
    //distance
    let distanceBetweenDateLabelAndSceneInfoView : CGFloat = 5
    let distanceBetweenSceneInfoViews : CGFloat = 10
    
    //两个collectionView的Tag
    let TAG_SCHEDULE_COLLECTIONVIEW = 101
    let TAG_CHOOSEN_COLLECTIONVIEW = 102
    
    //关于因该显示的日期的基本信息
    var (year,month) = (2016,7)
    var (countOfDaysInMonth , theWeekDayOfFirstDay) = (0,0)
    var numbersOfCellBeforeTheFirstDay = -1
    
    //CellIdentifier
    let Identifier_ScheduleCell = "ScheduleCell"
    let Identifier_sceneInfoView = "SceneInfoView"
    
    //可编辑状态
    var isEditible : Bool = true
    var anySceneBeTaped : Bool = false
    
    //
    var width : CGFloat = UIScreen.main.bounds.width/7
    
    //计算高度用的辅助参数
    var countDays = 0
    
    //存放每个cell的高度
    var heightOfCells : [Int :CGFloat] = [-1:0]
    var heightOfSceneInfos : [Int :[CGFloat]] = [-1:[]]
    var heightOfRows : [CGFloat] = []
    
    //存放被选中的sceneInfoView
    var (beingTapedDate ,beingTapedSceneInfoView) : (String?, ScheduleSceneInfoView?)
    
    //存放被选中的choosenScene的场次号
    var beingSelectedSceneNo : Int?
    
    //存放核心数据的数组
    var dic_sceneInfoViews : [Int:[ScheduleSceneInfoView]?]?
    var cellViews : [UIView] = []
    var toBeChoosen_sceneInfoViews : [ScheduleSceneInfoView] = []
    
    //变换图标的UIImageView
    var loadImageView : UIImageView?
    let imageSize : CGFloat = 40
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NotificationCenter.default.addObserver(self, selector: #selector(ScheduleViewController.receivedRotation(_:)), name: NSNotification.Name.UIApplicationDidChangeStatusBarFrame, object: nil)
        
        self.tabBarController?.navigationController?.supportedInterfaceOrientations
        
        self.navigationItem.leftBarButtonItem = self.tabBarController?.navigationItem.leftBarButtonItem
        
        prepareAllThings()
        initToBeChoosen_sceneInfoViews()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let item0 = UIBarButtonItem(title: "<", style: .plain, target: self, action: #selector(ScheduleViewController.beforeMonth))
        let item1 = UIBarButtonItem(title: ">", style: .plain, target: self, action: #selector(ScheduleViewController.nextMonth))
        self.tabBarController?.navigationItem.rightBarButtonItems = [item1,item0]
        
        initToBeChoosen_sceneInfoViews()
        choosenView.reloadData()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        //checkForActorsInfo&ScreenplayInfo
        prepareAllThings()
        scheduleView.reloadData()
        checkWrongSchedules()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        //        self.tabBarController?.navigationItem.rightBarButtonItems = []
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        if collectionView.tag == TAG_SCHEDULE_COLLECTIONVIEW {
            return 1
        }
        
        if collectionView.tag == TAG_CHOOSEN_COLLECTIONVIEW {
            return 1
        }
        
        print("ScheduleViewController_numberOfSectionsInCollectionView_error")
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView.tag == TAG_SCHEDULE_COLLECTIONVIEW {
            return countOfDaysInMonth + theWeekDayOfFirstDay - 1    //还要算上第1天前面的几个格子
        }
        
        if collectionView.tag == TAG_CHOOSEN_COLLECTIONVIEW {
            
            return ToBeChoosenScenesNo.count + 1
        }
        
        print("ScheduleViewController_numberOfItemsInSection_error")
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if collectionView.tag == TAG_SCHEDULE_COLLECTIONVIEW {
            let view = cellViews[indexPath.row]
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Identifier_ScheduleCell, for: indexPath) as! ScheduleCell
            
            for view in cell.contentView.subviews {
                view.removeFromSuperview()
            }
            
            cell.contentView.addSubview(view)
            return cell
        }
        
        if collectionView.tag == TAG_CHOOSEN_COLLECTIONVIEW {
            
            
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Identifier_ScheduleCell, for: indexPath) as! ScheduleCell
            
            for view in cell.contentView.subviews {
                view.removeFromSuperview()
            }
            
            cell.contentView.backgroundColor = UIColor.clear
            
            if indexPath.row == 0 {
                let image = UIImage(named: "plus")
                let imageView = UIImageView.init(image: image)
                imageView.frame = frameOfImageView(bounds: cell.contentView.bounds)
                
                cell.contentView.addSubview(imageView)
                loadImageView = imageView
                let tapGesture = UITapGestureRecognizer(target: self, action: #selector(self.unloadSceneButtonTapped(_:)))
                cell.contentView.addGestureRecognizer(tapGesture)
                
                cell.layer.borderColor = UIColor.darkGray.cgColor
                cell.layer.borderWidth = 1.0
                
                return cell
            }
            
            let sceneInfoView = toBeChoosen_sceneInfoViews[indexPath.row-1]
            
            sceneInfoView.frame.size.width = width
            sceneInfoView.synopsisLabel.frame.size.width = width
            sceneInfoView.synopsisLabel.frame.size.height = 40
            print(toBeChoosen_sceneInfoViews.count)
            //            print("RRRRRRRRRR\(sceneInfoView.synopsisLabel.text)")
            sceneInfoView.height = 120
            sceneInfoView.width = width
            sceneInfoView.frame.size.height = 120
            sceneInfoView.layer.borderWidth = 1.0
            sceneInfoView.layer.borderColor = UIColor(red: 70/255, green: 78/255, blue: 80/255, alpha: 1).cgColor
            cell.contentView.addSubview(sceneInfoView)
            
            return cell
        }
        
        //不会发生的
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Identifier_ScheduleCell, for: indexPath) as! ScheduleCell
        cell.contentView.backgroundColor = UIColor.yellow
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView.tag == TAG_SCHEDULE_COLLECTIONVIEW {
            let height = heightOfRows[(indexPath.row)/7]
            return CGSize(width: width, height: height)
        }
        
        return CGSize(width: width, height: 120)
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func searchDate(_ month:Int,date:Int)->DateInfo? {
        //找到该日的dateInfo Struct
        for member in DATE_INFOS {
            
            if member.day == date && member.month == month {
                return member
            }
        }
        
        return nil
    }
    
    func searchScenes(_ dateInfo:DateInfo) -> [SceneInfo]?{
        
        if dateInfo.scenes == nil {
            print("ScheduleView_searchScenes_scenes is nil!")
            return nil
        }
        
        var scenes : [SceneInfo] = []
        
        for member in SCENE_INFOS {
            for sceneNo in dateInfo.scenes! {
                if member.sceneNo.number == sceneNo {
                    //找到了该日拍摄的某场次
                    scenes.append(member)
                }
            }
        }
        
        return scenes
    }
    
    fileprivate func prepareSceneInfoViewsForMonth(_ month:Int) -> [Int:[ScheduleSceneInfoView]?] {
        //数据统一获取并创建好SceneInfoView,然后就可以利用这些去创建Cell的高度
        
        var dic_sceneInfoViews : [Int:[ScheduleSceneInfoView]?] = [-1:nil]  //初始化赋值 -1:nil 是为了1号之前的几天准备的
        
        for day in 0...countOfDaysInMonth {
            let date = day + 1  //此时要为哪天的Cell创建SceneInfoView
            
            var sub_sceneInfoViews:[ScheduleSceneInfoView] = []
            var heightOfSceneInfoViews : [CGFloat] = []
            
            let dateInfo = searchDate(month,date: date)
            if (dateInfo == nil) {
                print("ScheduleView_prepareSceneInfoViewsForMonth_Couldn't find the date!")
                continue
            }
            let sceneInfos = searchScenes(dateInfo!)    //得到了该日所有的场次信息
            if sceneInfos == nil {
                print("ScheduleView_prepareSceneInfoViewsForMonth_Couldn't find the scenes!")
                continue
            }
            
            //找到了该日期的场次信息后，创建相应的SceneInfoView
            for sceneInfo in sceneInfos! {
                //创建sceneInfoView
                let sceneInfoView = ScheduleSceneInfoView()
                sceneInfoView.width = width
                let sceneInfoViewHeight = sceneInfoView.prepareView(sceneInfo)
                sub_sceneInfoViews.append(sceneInfoView)
                heightOfSceneInfoViews.append(sceneInfoViewHeight)
            }
            //每日的所有sceneInfoView
            dic_sceneInfoViews[date] = sub_sceneInfoViews
            //每日的所有sceneInfoView的height
            heightOfSceneInfos.updateValue(heightOfSceneInfoViews, forKey: date)
        }
        
        return dic_sceneInfoViews
        
    }
    
    
    
    //计算Cell代表的是哪一天
    fileprivate func calculateTheDateFromIndexPath(_ index:Int) -> Int {
        if numbersOfCellBeforeTheFirstDay == -1 {
            //初始化1号前面有几个格子，theWeekDayOfFirstDay代表1是周日，7是周六.
            numbersOfCellBeforeTheFirstDay = theWeekDayOfFirstDay-1
        }
        if index < numbersOfCellBeforeTheFirstDay {
            //这就是1号前的那几天
            return -1
        }else{
            return index - numbersOfCellBeforeTheFirstDay + 1
        }
    }
    
    override var shouldAutorotate : Bool {
        return true
    }
    
    func receivedRotation(_ notification : Notification) {
        
        for c in self.view.subviews {
            if c.tag == TAG_SCHEDULE_COLLECTIONVIEW {
                let d = c as! UICollectionView
                d.reloadData()
            }
        }
    }
    
    func beforeMonth(){
        if month > 1 {
            month -= 1
        } else {
            month = 12
            year -= 1
        }
        
        (countOfDaysInMonth,theWeekDayOfFirstDay) = DateClass.getCountOfDaysInMonth(year: year, month: month)
        
        for c in self.view.subviews {
            if c.tag == TAG_SCHEDULE_COLLECTIONVIEW {
                let d = c as! UICollectionView
                dic_sceneInfoViews = nil
                numbersOfCellBeforeTheFirstDay = -1
                d.reloadData()
            }
        }
    }
    
    func nextMonth(){
        if month < 12 {
            month += 1
        } else {
            month = 1
            year += 1
        }
        
        (countOfDaysInMonth,theWeekDayOfFirstDay) = DateClass.getCountOfDaysInMonth(year: year, month: month)
        print("countOfDaysInMonth:\(countOfDaysInMonth),theWeekDayOfFirstDay:\(theWeekDayOfFirstDay)")
        for c in self.view.subviews {
            if c.tag == TAG_SCHEDULE_COLLECTIONVIEW {
                let d = c as! UICollectionView
                dic_sceneInfoViews = nil
                numbersOfCellBeforeTheFirstDay = -1
                d.reloadData()
            }
        }
    }
    
    fileprivate func searchSceneInfoBySceneNo(_ sceneNo:Int) -> SceneInfo?{
        for sceneInfo in SCENE_INFOS {
            if sceneInfo.sceneNo.number == sceneNo {
                return sceneInfo
            }
        }
        
        return nil
    }
    
    fileprivate func initToBeChoosen_sceneInfoViews() {
        
        if toBeChoosen_sceneInfoViews != nil {
            toBeChoosen_sceneInfoViews.removeAll()
        }
        
        //根据ToBeChoosenScenesNo创建SceneInfoView
        for sceneNo in ToBeChoosenScenesNo {
            
            let sceneInfo = searchSceneInfoBySceneNo(sceneNo)
            
            print("initToBeChoosen_sceneInfoViews:\(sceneNo)")
            
            if sceneInfo != nil {
                let sceneInfoView = ScheduleSceneInfoView()
                sceneInfoView.isToBeChoosen = true
                sceneInfoView.prepareView(sceneInfo!)
                sceneInfoView.tag = sceneNo
                let tapGesture = UITapGestureRecognizer(target: self, action: #selector(self.choosenAvailableSceneTapped(_:)))
                sceneInfoView.addGestureRecognizer(tapGesture)
                
                toBeChoosen_sceneInfoViews.append(sceneInfoView)
            }
            
        }
    }
    
    fileprivate func prepareAllThings() {
        //这是准备工作的总函数
        
        //首先获得本月一共有多少天，第一天是周几
        (countOfDaysInMonth,theWeekDayOfFirstDay) = DateClass.getCountOfDaysInMonth(year: year, month: month)
        //1号前面有几个格子，theWeekDayOfFirstDay代表1是周日，7是周六.
        numbersOfCellBeforeTheFirstDay = theWeekDayOfFirstDay-1
        
        //准备好所有的sceneInfoViews，结构[该月几号：该号所有场次的数组]。以及得到所有sceneInfoViews的height
        if dic_sceneInfoViews != nil {
            dic_sceneInfoViews?.removeAll()
        }
        dic_sceneInfoViews = prepareSceneInfoViewsForMonth(month)
        
        //准备好所有的高度，结果存于heightOfCells
        calculateHeightForOneCell()
        
        //计算每行高度，结果存于heightOfRows
        calculateHeightForRows()
        
        //准备每个Cell的父View
        prepareCells()
    }
    
    //准备好所有的Cells，结果存于cellViews
    func prepareCells() {
        
        if cellViews.count > 0 {
            cellViews.removeAll()
        }
        
        let count = countOfDaysInMonth + numbersOfCellBeforeTheFirstDay
        
        for index in 1...count {
            
            let date = calculateTheDateFromIndexPath(index-1) //计算该cell是几号，非当月cell，值为-1
            
            let heightForRow = heightOfRows[(index-1)/7]
            
            let frame = CGRect(origin: CGPoint.zero, size: CGSize(width: width, height: heightForRow))
            let superView = UIView(frame: frame)
            superView.layer.borderWidth = 1.0
            superView.layer.borderColor = UIColor(red: 70/255, green: 78/255, blue: 80/255, alpha: 1).cgColor
            
            if date == -1 {
                cellViews.append(superView)
                continue
            }
            
            let sceneInfoViews = dic_sceneInfoViews![date]
            
            
            //准备工作完成，向superView中逐个添加View
            var y :CGFloat = 0
            
            let dateLabel = UILabel(frame: CGRect(origin: CGPoint(x: 4, y: 4), size: CGSize(width: width - 4, height: dateLabelHeight)))
            dateLabel.text = "\(date)日"
            dateLabel.font = UIFont(name: "PingFangTC-Medium", size: 14)
            dateLabel.textColor = UIColor(red: 70/255, green: 78/255, blue: 80/255, alpha: 1)
            dateLabel.tag = 4401
            
            y = y + dateLabelHeight + distanceBetweenDateLabelAndSceneInfoView
            
            superView.addSubview(dateLabel)
            superView.tag = date
            
            for sceneInfoView in sceneInfoViews!! {
                sceneInfoView.frame = CGRect(origin: CGPoint(x: 0, y: y), size: CGSize(width: sceneInfoView.width, height: sceneInfoView.height))
                y = y + sceneInfoView.height + distanceBetweenSceneInfoViews
                superView.addSubview(sceneInfoView)
            }
            
            
            
            let tapGesture = UITapGestureRecognizer(target: self, action: #selector(self.sceneTaped(_:)))
            superView.addGestureRecognizer(tapGesture)
            cellViews.append(superView)
        }
        
        
        
        
    }
    
    //计算一个Cell的高度
    fileprivate func calculateHeightForOneCell(){
        heightOfCells.removeAll()
        
        var heightForOneCell : CGFloat = 0
        
        for date in 1...countOfDaysInMonth {
            let heightsOfSceneInfosForTheDate = heightOfSceneInfos[date]
            //            print("heightsOfSceneInfosForTheDate\(heightsOfSceneInfosForTheDate)")
            for height in heightsOfSceneInfosForTheDate! {
                heightForOneCell += height
            }
            //加上场次信息之间的间隔
            heightForOneCell += distanceBetweenSceneInfoViews*(CGFloat(heightsOfSceneInfosForTheDate!.count) - 1)
            //加上DateLabel的相关高度
            heightForOneCell += distanceBetweenDateLabelAndSceneInfoView + dateLabelHeight
            
            heightOfCells.updateValue(heightForOneCell, forKey: date)
            heightForOneCell = 0
        }
        
        //        print(heightOfCells)
    }
    
    //计算每行的高度
    fileprivate func calculateHeightForRows() {
        
        var num = numbersOfCellBeforeTheFirstDay
        var stillHavingCellsBeforeTheFirstDay = true
        
        var heightsToConsiderate : [CGFloat] = []
        var index = 1
        
        while index < countOfDaysInMonth+1 {
            
            for count in 0...6 {
                
                if stillHavingCellsBeforeTheFirstDay {
                    heightsToConsiderate.append(0)
                    num -= 1
                    if num == 0 {
                        stillHavingCellsBeforeTheFirstDay = false
                    }
                    continue
                }
                
                if index < heightOfCells.count-1 {
                    heightsToConsiderate.append(heightOfCells[index]!)
                    index += 1
                } else {
                    heightsToConsiderate.append(0)
                    index += 1
                }
                
                if count == 6 {
                    //heightsToConsiderate.count = 7, 计算谁最大
                    var heightForRow :CGFloat = 0
                    
                    for height in heightsToConsiderate {
                        if height > heightForRow {
                            heightForRow = height
                        }
                    }
                    
                    heightOfRows.append(heightForRow)
                    heightsToConsiderate.removeAll()
                }
            }
        }
        
        //        print(heightOfRows)
    }
    
    //检查演员排期问题
    func checkWrongSchedules(){
        if initWrongSchedules == 0 {
            createWrongSchedules()
        }
        
        
        
        //遍历演员排期错误数组
        for wrongSchedule in wrongSchedules {
            //得到VBDate形式的日期
            let date = getDateByString(dateString : wrongSchedule.date)
            
            if date.month != month {
                //如果不是这个月份就跳过
                continue
            }
            
            //计算是哪一个cell,得到其indexPath.row
            let row = date.day + numbersOfCellBeforeTheFirstDay - 1
            let indexPath = IndexPath.init(row: row, section: 0)
            //边框变红
            //因为UICollectionView是根据Cell即将出现在屏幕上时才创建的，所以不能通过 cellAtIndexpath找到Cell
            let targetView = cellViews[indexPath.row]
            targetView.layer.borderColor = UIColor.red.cgColor
            //找到场次信息，演员button变红
            for sub in targetView.subviews{
                
                if sub.tag == 4401 {
                    continue
                }
                
                if (sub as! ScheduleSceneInfoView).sceneInfo?.sceneNo.number == wrongSchedule.scene {
                    for button in (sub as! ScheduleSceneInfoView).charactersButtons {
                        if button.titleLabel?.text == getCharacterByCastID(castID: wrongSchedule.castID).acronym {
                            button.backgroundColor = UIColor.red
                        }
                    }
                }
            }
            
        }
        
        
        
    }
    
    func checkScreenplayInfos(){
        
    }
    
    func getDateByString(dateString : String) -> VBDate{
        
        let index1 = dateString.index(dateString.startIndex, offsetBy: 1)
        let s1 = dateString.substring(to: index1)
        let index2 = dateString.index(dateString.startIndex, offsetBy: 2)
        let s2 = dateString.substring(from: index2)
        
        return VBDate(month: (s1 as NSString).integerValue, day: (s2 as NSString).integerValue)
    }
    
    //UICollectionView Delegate
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if isEditible {
            if collectionView.tag == TAG_SCHEDULE_COLLECTIONVIEW {
                print("1")
                
                //日期
                let day = calculateTheDateFromIndexPath(indexPath.row)
                
            }
        }
    }
    
    func sceneTaped(_ gesture: UITapGestureRecognizer) {
        let tapedView = gesture.view   //superView
        anySceneBeTaped = true
        let location = gesture.location(in: tapedView)
        var y = location.y
        var i = 0
        for v in (tapedView?.subviews)! {
            if i == 0 {
                y -= dateLabelHeight
            }
            
            if i == 1 {
                y -= v.frame.size.height + distanceBetweenDateLabelAndSceneInfoView
            }
            
            if i > 1 {
                y -= v.frame.size.height + distanceBetweenSceneInfoViews
            }
            
            if y < 0 {
                if i > 0 {
                    beingTapedDate = (tapedView?.subviews[0] as! UILabel).text
                    if beingTapedSceneInfoView != nil {
                    beingTapedSceneInfoView!.layer.borderWidth = 0.0
                    }
                    beingTapedSceneInfoView = v as! ScheduleSceneInfoView
                    
                    v.layer.borderColor = COLORS[1].cgColor
                    v.layer.borderWidth = 2.0
                    
                    //change image about download/upload/plus cell
                    loadImageView?.image = UIImage(named: "download")
                    
                    break
                } else {
                    break
                }
            }
            i += 1
        }
    }
    
    func unloadSceneButtonTapped(_ gesture: UITapGestureRecognizer) {
        //        print("有场次要被卸载！\(beingTapedDate):\(beingTapedSceneInfoView)")
        var ary : [DateInfo] = DATE_INFOS
        if beingTapedDate != nil {
        let targetDay = (beingTapedDate! as NSString).integerValue
        let targetSceneNo = beingTapedSceneInfoView?.sceneInfo?.sceneNo
        
        //删除档期数组该日这一场戏
        for i in 0...ary.count-1 {
            var d = ary[i]
            if d.day == targetDay {
                for j in 0...d.scenes!.count-1{
                    if targetSceneNo?.number == d.scenes![j] {
                        d.scenes!.remove(at: j)
                        ary[i] = d
                        break
                    }
                }
            }
        }
        
        
        //添加该场次进入
        
        ToBeChoosenScenesNo.append(targetSceneNo!.number)
        //检查是否需要删除[演员排期错误]数组中的该场次
        //        let dateString = "\(month)月\(beingTapedSceneInfoView))"
        //        for d in date
        //        wrongSchedules
        
        DATE_INFOS = ary
        prepareAllThings()
        
        createWrongSchedules()
        scheduleView.reloadData()
        initToBeChoosen_sceneInfoViews()
        choosenView.reloadData()
        checkWrongSchedules()
            
            beingTapedDate = nil
        }
    }
    
    func choosenAvailableSceneTapped(_ gesture: UITapGestureRecognizer) {
        beingSelectedSceneNo = gesture.view!.tag
        
        loadImageView?.image = UIImage(named: "upload")
        
        for v in cellViews {
            let tapGesture = UITapGestureRecognizer(target: self, action: #selector(self.dateCellTouched(_:)))
            v.addGestureRecognizer(tapGesture)
        }
            
        
    }
    
    
    func dateCellTouched(_ gesture: UITapGestureRecognizer) {
        //将场次号放入该日期的期表信息数组
        for i in 0...DATE_INFOS.count {
            if DATE_INFOS[i].month == month && DATE_INFOS[i].day == gesture.view!.tag {
                DATE_INFOS[i].scenes?.append(beingSelectedSceneNo!)
                for j in 0...ToBeChoosenScenesNo.count {
                    if ToBeChoosenScenesNo[j] == beingSelectedSceneNo {
                        ToBeChoosenScenesNo.remove(at: j)
                        break
                    }
                }
                break
            }
        }
        
        beingSelectedSceneNo = -1
        
        prepareAllThings()
        createWrongSchedules()
        scheduleView.reloadData()
        initToBeChoosen_sceneInfoViews()
        choosenView.reloadData()
        checkWrongSchedules()
    }
    
    //计算 上传/下载 图片的位置和大小
    private func frameOfImageView(bounds : CGRect) -> CGRect {
        let point = CGPoint(x: (bounds.size.width - imageSize)/2, y: (bounds.size.height - imageSize)/2)
        let size = CGSize(width: imageSize, height: imageSize)
        return CGRect(origin: point, size: size)
    }
}
