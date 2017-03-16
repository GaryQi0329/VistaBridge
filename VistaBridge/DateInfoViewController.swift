//
//  DateInfoViewController.swift
//  VistaBridge
//
//  Created by 齐晴 on 16/9/6.
//  Copyright © 2016年 GaryQi. All rights reserved.
//

import UIKit

class DateInfoViewController: UIViewController , UICollectionViewDataSource, UICollectionViewDelegate , UICollectionViewDelegateFlowLayout{

    @IBOutlet weak var containerView: UIView!
    
    let DateCell_Identifier = "DateCell"
    
    @IBOutlet weak var dateCollectionView: UICollectionView!
    
    let DateHeaderView_Identifier = "DateHeaderView"
    
    let NotificationName_DateNumberChange = "DateInfoViewController_DateNumberChanged"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.leftBarButtonItem = self.splitViewController?.displayModeButtonItem
        containerView.subviews[0].superclass
        
        dateCollectionView.register(DateHeaderView.self, forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: DateHeaderView_Identifier)
        }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        self.tabBarController?.navigationItem.rightBarButtonItems = []
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        let nib = UINib(nibName: "DateCell", bundle: nil)
        collectionView.register(nib, forCellWithReuseIdentifier: DateCell_Identifier)
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if section == 0 {
            return DATE["7月"]!.count
        } else {
            return DATE["8月"]!.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DateCell_Identifier, for: indexPath) as! DateCell
        //显示日期中的日，剔除月
        if indexPath.section == 0 {
        let dateToBeDisplay = DATE["7月"]![indexPath.row]
        cell.dateLabel.text = dateToBeDisplay
            cell.dateLabel.font = UIFont(name: "Copperplate", size: 19.0)
        } else {
            let dateToBeDisplay = DATE["8月"]![indexPath.row]
            cell.dateLabel.text = dateToBeDisplay
            cell.dateLabel.font = UIFont(name: "Copperplate", size: 19.0)
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionElementKindSectionHeader, withReuseIdentifier: DateHeaderView_Identifier, for: indexPath) as! DateHeaderView
        if indexPath.section == 0 {
            headerView.monthLabel.text = "7月"
            headerView.monthLabel.backgroundColor = UIColor(red: 26/255, green: 188/255, blue: 156/255, alpha: 1)
        } else if indexPath.section == 1 {
            headerView.monthLabel.text = "8月"
            headerView.monthLabel.backgroundColor = UIColor(red: 52/255, green: 152/255, blue: 219/255, alpha: 1)
        }
        return headerView
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: 150,height: 80)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 50, height: 50)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        //找到选中的日期
        var date = ""
        
        if indexPath.section == 0 {
            let d = DATE["7月"]![indexPath.row]
            date = "07\(d)"
        } else {
            let d = DATE["8月"]![indexPath.row]
            date = "08\(d)"
        }
        
        
        NotificationCenter.default.post(name: Notification.Name(rawValue: NotificationName_DateNumberChange), object: self, userInfo: ["date" : date])
    }
    
}
