
//
//  ContinuitySheetOfSceneViewControllers.swift
//  VistaBridge
//
//  Created by 齐晴 on 16/9/20.
//  Copyright © 2016年 GaryQi. All rights reserved.
//

import UIKit

class ContinuitySheetOfSceneViewController: UIViewController, UITableViewDataSource , UITableViewDelegate{

    
    @IBOutlet weak var tableView: UITableView!
    
    let Identifier_ContinuitySheetCell = "ContinuitySheetCell"
    let Identifier_ContinuitySheetDateCell = "ContinuitySheetDateCell"
    let Identifier_HeaderView = "ContinuitySheet_HeaderView"
    let NotificationName_DateNumberChange = "SceneInfoViewController_SceneNumberChanged"
    
    var recordings : [String : [ContinuitySheetRecording]]?
    var keys : [String]?
    var positionOfDateLabelCell : [Int] = [0]
    
    var sceneNo : Int? {
        didSet {
            //每当sceneNo重新设置了新的值，就更新tableView中的数据
            print(sceneNo)
            recordings = searchContinuitySheetRecordingsBySceneNo(sceneNo!)
            keys = [String](recordings!.keys)
            tableView.reloadData()
            
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        let item0 = UIBarButtonItem(image:UIImage(named: "info"), style: .plain, target: self, action: #selector(CommonInfosOfSceneViewController.segueToCommonInfos))
        
        let item1 = UIBarButtonItem(image:UIImage(named: "slate"), style: .plain, target: self, action: #selector(CommonInfosOfSceneViewController.segueToContinuitySheet))
        let item2 = UIBarButtonItem(image:UIImage(named: "photo"), style: .plain, target: self, action: #selector(CommonInfosOfSceneViewController.segueToContinuityPics))
        let item3 = UIBarButtonItem(image:UIImage(named: "script"), style: .plain, target: self, action: #selector(self.segueToScreenplay))
        let item12 = UIBarButtonItem(barButtonSystemItem: .fixedSpace, target: nil, action: nil)
        
        item12.width = -5
        
        self.tabBarController!.tabBarController!.navigationItem.rightBarButtonItems = [item3,item12,item2,item12,item1,item12,item0]
        
        print(self.tabBarController?.tabBarController?.navigationItem.rightBarButtonItems!)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.tabBarController?.tabBarController?.navigationItem.rightBarButtonItems?.removeAll()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        sceneNo = 13
        // Do any additional setup after loading the view.
        
        NotificationCenter.default.addObserver(self, selector: #selector(ContinuitySheetOfSceneViewController.sceneNumberDidChanged(_:)), name: NSNotification.Name(rawValue: NotificationName_DateNumberChange), object: nil)
        
        tableView.register(ContinuitySheetHeaderView.self, forHeaderFooterViewReuseIdentifier: Identifier_HeaderView)
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if recordings != nil {
            var count = 0
            var n = 0
            
            for key in keys! {
                count += (recordings![key]?.count)!
                n += (recordings![key]?.count)! + 1
                positionOfDateLabelCell.append(n)
            }
            
            count += (keys?.count)!
            return count
        }
        
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if checkPosition(indexPath.row) {
            let cell = tableView.dequeueReusableCell(withIdentifier: Identifier_ContinuitySheetDateCell, for: indexPath) as! ContinuitySheetDateCell
            let nowPosition = positionOfDateLabelCell.index(of: indexPath.row)
            cell.dateLabel.text = "日期:\(keys![nowPosition!])"
            return cell
        }
        
        let cell = tableView.dequeueReusableCell(withIdentifier: Identifier_ContinuitySheetCell) as! ContinuitySheetCell
        if let key = keys?[indexPath.section] {
            let recordingsOfDate = recordings![key]!
            for recording in recordingsOfDate {
                cell.prepareContinuitySheetCell(recording)
            }
        }
        
        return cell
        
        
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let cell = tableView.dequeueReusableHeaderFooterView(withIdentifier: Identifier_HeaderView) as! ContinuitySheetHeaderView
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 80
    }
    
//    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//        return keys?[section]
//    }
    
//    func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
//        
//    }
    
    fileprivate func searchContinuitySheetRecordingsBySceneNo(_ sceneNo:Int) -> [String : [ContinuitySheetRecording]]?{
        //根据日期，寻找当日的场记表条目
        
        var results : [String : [ContinuitySheetRecording]] = [String : [ContinuitySheetRecording]].init(minimumCapacity: 0)
        
        var dates : [String] = []
        for d in DATE["7月"]! {
            let str = "07\(d)"
            dates.append(str)
        }
        
        for d in DATE["8月"]! {
            let str = "08\(d)"
            dates.append(str)
        }
        
        
        for date in dates {
            
            var temp : [ContinuitySheetRecording] = []
            
            if let recordings = CONTINUITY_SHEET_INFOS[date] {
                
                for recording in recordings {
                    if recording.sceneNumber == sceneNo {
                        //若该条记录属于该场次，则放入temp
                        temp.append(recording)
                    }
                }
                
                }
            
            if temp.count > 0 {
                results.updateValue(temp, forKey: date)
                temp = []
            
            }
        }
        
        return results
       
    }
    
    func sceneNumberDidChanged(_ notification : Notification) {
       
        let userInfo = notification.userInfo
        let sceneNo = userInfo!["sceneNo"] as! Int
        print("消息收到\(sceneNo)")
        self.sceneNo = sceneNo
    }
    
    func segueToCommonInfos() {
        self.tabBarController?.selectedIndex = 0
    }
    
    func segueToContinuitySheet() {
        self.tabBarController?.selectedIndex = 1
    }
    
    func segueToContinuityPics() {
        self.tabBarController?.selectedIndex = 2
    }
    
    func segueToScreenplay() {
        self.tabBarController?.selectedIndex = 3
    }
    
    func checkPosition(_ row:Int) -> Bool {
        for i in positionOfDateLabelCell {
            if i == row {
            return true
            }
        }
        
        return false
    }

}
