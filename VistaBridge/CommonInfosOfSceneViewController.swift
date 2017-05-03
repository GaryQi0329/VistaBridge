//
//  CommonInfosOfSceneViewController.swift
//  VistaBridge
//
//  Created by 齐晴 on 16/9/21.
//  Copyright © 2016年 GaryQi. All rights reserved.
//

import UIKit

class CommonInfosOfSceneViewController: UIViewController ,UICollectionViewDataSource, UICollectionViewDelegate,UICollectionViewDelegateFlowLayout{
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    //场次信息卡
    @IBOutlet weak var cardSceneNo: UILabel!
    
    
    let NotificationName_DateNumberChange = "SceneInfoViewController_SceneNumberChanged"
    
    let identifier_infosWithTableCell = "InfosWithTableCell"
    let identifier_locationCell = "LocationCell"
    
    var sceneNo = 1 {   //场次号
        didSet{
            collectionView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("2")
        // Do any additional setup after loading the view.
        
        self.tabBarController?.tabBar.isHidden = true
        NotificationCenter.default.addObserver(self, selector: #selector(CommonInfosOfSceneViewController.sceneNumberDidChanged(_:)), name: NSNotification.Name(rawValue: NotificationName_DateNumberChange), object: nil)
        
        collectionView.showsVerticalScrollIndicator = false
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        let item0 = UIBarButtonItem(image:UIImage(named: "info"), style: .plain, target: self, action: #selector(CommonInfosOfSceneViewController.segueToCommonInfos))
        
        let item1 = UIBarButtonItem(image:UIImage(named: "slate"), style: .plain, target: self, action: #selector(CommonInfosOfSceneViewController.segueToContinuitySheet))
        let item2 = UIBarButtonItem(image:UIImage(named: "photo"), style: .plain, target: self, action: #selector(CommonInfosOfSceneViewController.segueToContinuityPics))
        let item3 = UIBarButtonItem(image:UIImage(named: "script"), style: .plain, target: self, action: #selector(self.segueToScreenplay))
        let item12 = UIBarButtonItem(barButtonSystemItem: .fixedSpace, target: nil, action: nil)
        
        item12.width = -5
        
        self.tabBarController?.tabBarController?.navigationItem.rightBarButtonItems = [item3,item12,item2,item12,item1,item12,item0]
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillAppear(animated)  
        self.tabBarController?.tabBarController?.navigationItem.rightBarButtonItems?.removeAll()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return TypeOfTheCommonInfos.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        //找到此cell代表的单元格类型
        let typeOfTheCell = TypeOfTheCommonInfos(rawValue: indexPath.row)!
        
        //根据type，创建cell
        let cell = createCell(collectionView, indexPath: indexPath, typeOfTheCell: typeOfTheCell)
        
        //        cell.prepareInfosWithTableCell(typeOfTheCell)
        
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (UIScreen.main.bounds.width - 170)/3
        return CGSize(width: width, height: 400)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    fileprivate func createCell(_ collectionView: UICollectionView ,indexPath: IndexPath,typeOfTheCell:TypeOfTheCommonInfos) -> UICollectionViewCell {
        switch typeOfTheCell {
        case .cast :
            //主要演员cell
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: identifier_infosWithTableCell, for:indexPath) as! InfosWithTableCell
            cell.typeLabel.text = "主要演员"
            cell.typeLabel.backgroundColor = UIColor(red: 52/255, green: 139/255, blue: 211/255, alpha: 1.0)
            cell.prepareInfosWithTableCell(.cast, sceneNo: sceneNo)
            return cell
        case .background :
            //群众演员&替身
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: identifier_infosWithTableCell, for:indexPath) as! InfosWithTableCell
            cell.typeLabel.text = "群演&替身"
            cell.typeLabel.backgroundColor = UIColor(red: 39/255, green: 174/255, blue: 96/255, alpha: 1.0)
            cell.prepareInfosWithTableCell(.background, sceneNo: sceneNo)
            return cell
        case .props :
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: identifier_infosWithTableCell, for:indexPath) as! InfosWithTableCell
            cell.typeLabel.text = "道具"
            cell.typeLabel.backgroundColor = UIColor(red: 231/255, green: 76/255, blue: 60/255, alpha: 1.0)
            cell.prepareInfosWithTableCell(.props, sceneNo: sceneNo)

            return cell
        case .equipment :
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: identifier_infosWithTableCell, for:indexPath) as! InfosWithTableCell
            cell.typeLabel.text = "拍摄器械"
            cell.typeLabel.backgroundColor = UIColor(red: 241/255, green: 196/255, blue: 15/255, alpha: 1.0)
            cell.prepareInfosWithTableCell(.equipment, sceneNo: sceneNo)
            return cell
        case .location :
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: identifier_locationCell, for: indexPath) as! LocationCell
            cell.typeLabel.text = "拍摄地"
            cell.typeLabel.backgroundColor = UIColor(red: 235/255, green: 109/255, blue: 26/255, alpha: 1.0)
            
            return cell
        default:
            
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: identifier_infosWithTableCell, for:indexPath) as! InfosWithTableCell
            cell.identifierNo = -1
            cell.prepareInfosWithTableCell()
            cell.typeLabel.text = "Default"
            return cell
        }
        
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
    
}
