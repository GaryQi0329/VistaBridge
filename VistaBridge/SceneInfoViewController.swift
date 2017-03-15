//
//  SceneInfoViewController.swift
//  VistaBridge
//
//  Created by 齐晴 on 16/9/6.
//  Copyright © 2016年 GaryQi. All rights reserved.
//

import UIKit

class SceneInfoViewController: UIViewController , UICollectionViewDataSource, UICollectionViewDelegate,UICollectionViewDelegateFlowLayout{

    @IBOutlet weak var sceneNoCollectionView: UICollectionView!
    let identifier_SceneNumberCell = "SceneNumberCell"
    
    let NotificationName_DateNumberChange = "SceneInfoViewController_SceneNumberChanged"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tabBarController?.navigationItem.title = "场次信息"
        self.navigationItem.leftBarButtonItem = self.tabBarController?.navigationItem.leftBarButtonItem
        
    }   
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        sceneNoCollectionView.reloadData()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.tabBarController?.navigationItem.rightBarButtonItems = []
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        collectionView.showsVerticalScrollIndicator = false
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return SCENE_INFOS.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: identifier_SceneNumberCell, for: indexPath) as! SceneNumberCell
        cell.sceneNumber.text = String(SCENE_INFOS[indexPath.row].sceneNo.number)
        cell.sceneNumber.textAlignment = .center
//        cell.sceneNumber.font = UIFont(name: "PingFangTC-Medium", size: 17)
//        cell.sceneNumber.textColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.9)
        cell.sceneNumber.backgroundColor = getColorFromStatus(status: SCENE_INFOS[indexPath.row].sceneNo.status)
//        cell.layer.borderColor = UIColor.darkGray.cgColor
//        cell.layer.borderWidth = 0.3
        cell.sceneNumber.textColor = UIColor(red: 70/255, green: 78/255, blue: 80/255, alpha: 1)
        return cell
    }
    
    private func getColorFromStatus(status:ShootingStatus) -> UIColor {
        switch status {
        case .green :
            return UIColor.green
        case .yellow :
            return UIColor.yellow
        case .red :
            return UIColor.red
        case .white :
            return UIColor.white
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let sceneNo = SCENES[indexPath.row]
        NotificationCenter.default.post(name: Notification.Name(rawValue: NotificationName_DateNumberChange), object: self, userInfo: ["sceneNo" : sceneNo])
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let width : CGFloat = 50
        return CGSize(width: width, height: width)
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    }
