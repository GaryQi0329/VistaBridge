//
//  CastInfoViewController.swift
//  VistaBridge
//
//  Created by 齐晴 on 16/9/6.
//  Copyright © 2016年 GaryQi. All rights reserved.
//

import UIKit

class CastInfoViewController: UIViewController ,UICollectionViewDataSource , UICollectionViewDelegate{
    
    //
    @IBOutlet weak var castCollection: UICollectionView!
    let width = UIScreen.main.bounds.width/15
    let height = UIScreen.main.bounds.height/12
    
    //Cell Identifier
    struct Cell_Identifier {
        let ActorCell = "ActorCell"
        let DateCell = "DateCell"
        let ButtonCell = "ButtonCell"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.leftBarButtonItem = self.tabBarController?.navigationItem.leftBarButtonItem
        self.automaticallyAdjustsScrollViewInsets = true
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
//        castCollection.reloadData()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        //即将消失时，创建错误信息排期表
        createWrongSchedules()
        print("CastInfoViewController_viewWillDisappear:\(wrongSchedules)")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
//        collectionView.delaysContentTouches = false
        return dates.count + 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return characters.count + 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        //左上角的空cell
        if indexPath.section == 0 && indexPath.row == 0 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Cell_Identifier.init().ActorCell, for: indexPath) as! ActorCell
            cell.actorLabel.text = ""
            return cell
        }
        
        //日期cell
        if indexPath.section != 0 && indexPath.row == 0 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Cell_Identifier.init().ActorCell, for: indexPath) as! ActorCell
            cell.actorLabel.text = dates[indexPath.section - 1]
            return cell
        }
        
        //演员cell
        if indexPath.section == 0 && indexPath.row != 0 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Cell_Identifier.init().ActorCell, for: indexPath) as! ActorCell
            cell.actorLabel.text = characters[indexPath.row - 1].acronym
            return cell
        }
        
        //档期cell
        if indexPath.section != 0 && indexPath.row != 0 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Cell_Identifier.init().ButtonCell, for: indexPath) as! ButtonCell
            cell.indexPath = ButtonIndexpath(section: indexPath.section, row: indexPath.row)
            let dateStr1 = (dates[indexPath.section - 1] as NSString).substring(from: 2)
            let dateStr2 = (dateStr1 as NSString).substring(to: dateStr1.characters.count-1)
            let day = Int(dateStr2)
            cell.button.setTitle("\(day!)", for: .normal)
            cell.title = "\(day!)"
//            cell.button.frame.size.width = cell.contentView.bounds.size.width/2
            
            for sub in cell.subviews {
                sub.backgroundColor = UIColor.clear
            }
            
            let date = dates[indexPath.section - 1]
            let characterID = characters[indexPath.row - 1].ID
            
            if castHasTime(characterID: characterID, dateNo: date) {
                cell.button.tintColor = characters[indexPath.row - 1].color
            } else {
                cell.button.tintColor = UIColor.red
            }
            
            if indexPath.section % 2 == 0{
                cell.contentView.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.05)
                
            }
//            cell.layer.borderColor = UIColor.darkGray.cgColor
//            cell.layer.borderWidth = 0.3
            return cell
        }
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Cell_Identifier.init().ActorCell, for: indexPath) as! ActorCell
        cell.actorLabel.text = ""
        return cell
        
    }
    
    //通过角色ID，和日期，判断是否该日演员有档期
    func castHasTime(characterID : Int, dateNo date:String) -> Bool {
        
        var castID : Int = 0
        
        for cast in  CAST {
            if cast.characterID == characterID {
                castID = cast.castID
            }
        }
        
        
//        if castID == 202 {
//            print(CastSchedule[1])
//        }
        
        var dates : [String]? = nil
        
        if castID != 0 {
            for cast in CastSchedule {
                if cast.castID == castID {
                    dates = cast.availableDates
                }
            }
        }
        
        if dates != nil {
            for d in dates! {
                if d == date {
                    return true
                }
            }
        }
        
        return false
    }
    
    //    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAtIndex section: Int) -> CGFloat {
    //        return 0
    //    }
    //
    //    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
    //
    //        return CGSize(width: width, height: height)
    //    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}
