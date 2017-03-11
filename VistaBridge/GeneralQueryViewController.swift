//
//  GeneralQueryViewController.swift
//  VistaBridge
//
//  Created by 齐晴 on 16/9/6.
//  Copyright © 2016年 GaryQi. All rights reserved.
//

import UIKit

class GeneralQueryViewController: UIViewController , UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout{
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    let headerViewHeight : CGFloat = 120
    
    let CAR = 0
    let CHANNEL = 1
    let CONNECTION = 2
    
    var marker = 0
    
    let TAG_BUTTON_CAR = 1701
    let TAG_BUTTON_CHANNEL = 1702
    let TAG_BUTTON_CONNECTION = 1703
    
    @IBAction func button_clicked(_ sender: AnyObject) {
        switch sender.tag {
        case TAG_BUTTON_CAR :
            marker = CAR
//            NSURL *url = [NSURL URLWithString:@"telprompt://10010"];
//            [[UIApplication sharedApplication] openURL:url];
            let url = NSURL(string: "tel://10010")
                UIApplication.shared.openURL(url as! URL)
            collectionView.reloadData()
        case TAG_BUTTON_CHANNEL:
            marker = CHANNEL
            collectionView.reloadData()
        case TAG_BUTTON_CONNECTION:
            marker = CONNECTION
            collectionView.reloadData()
        default:
            print("GeneralQueryViewController_button_clicked_default.")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.leftBarButtonItem = self.tabBarController?.navigationItem.leftBarButtonItem
        collectionView.register(DepartmentHeaderView.self, forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: "departmentHeaderView")
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.collectionView.reloadData()
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //CollectionView
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        switch marker {
        case CAR:
            return departments.count
        case CHANNEL:
            return 1
        case CONNECTION:
            return departments.count
        default:
            print("GeneralQueryTableListViewController_numberOfSectionsInTableView")
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch marker {
        case CAR:
            return departments[section].cars.count
        case CHANNEL:
            return departments.count
        case CONNECTION:
            return departments[section].workers.count
        default:
            print("GeneralQueryTableListViewController_numberOfRowsInSection")
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.frame.size.width/4
        return CGSize(width: width, height: width)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        let width = collectionView.frame.size.width
        
        switch marker {
        case CAR:
            return CGSize(width: width, height: headerViewHeight)
        case CHANNEL:
            return CGSize(width: 0, height: 0)
        case CONNECTION:
            return CGSize(width: width, height: headerViewHeight)
        default:
            print("GeneralQueryTableListViewController_numberOfSectionsInTableView")
            return CGSize(width: width, height: headerViewHeight)
        }

        return CGSize(width: width, height: headerViewHeight)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        //判断情况，发送tableView和indexPath去相应的方法
        switch marker {
        case CAR:
            let cell = prepareCellForCarList(collectionView,indexPath: indexPath)
            return cell
        case CHANNEL :
            let cell = prepareCellForChannelList(collectionView,indexPath: indexPath)
            return cell
        case CONNECTION:
            let cell = prepareCellForConnectionList(collectionView,indexPath: indexPath)
            return cell
        default :
            let cell = UICollectionViewCell.init()
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let cell = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionElementKindSectionHeader, withReuseIdentifier: "departmentHeaderView", for: indexPath) as! DepartmentHeaderView
        cell.departmentLabel.text = departments[indexPath.section].name
        return cell
    }
    
    fileprivate func prepareCellForCarList(_ tableView:UICollectionView , indexPath : IndexPath) -> UICollectionViewCell{
        //CarListCell
        let cell = tableView.dequeueReusableCell(withReuseIdentifier: "CarListCell", for: indexPath) as! CarListCollectionCell
        
        let index = indexPath.section
        let department = departments[index]
        
        let carID = department.cars[indexPath.row]
        for car in cars {
            if car.ID == carID {
                cell.carName.text = car.type
                cell.plateNumber.text = car.plateNumber
                cell.driverName.text = car.driver
                cell.driverTel = car.driverTel
            }
        }
        
        cell.layer.borderColor = UIColor.darkGray.cgColor
        cell.layer.borderWidth = 0.3
        
        return cell
    }
    
    fileprivate func prepareCellForChannelList(_ tableView:UICollectionView , indexPath : IndexPath) -> UICollectionViewCell{
        //ChannelCell
        let cell = tableView.dequeueReusableCell(withReuseIdentifier: "ChannelListCell", for: indexPath) as! ChannelListCollectionCell
        
        let index = indexPath.row
        let department = departments[index]
        
        cell.departmentLabel.text = department.name
        cell.channelLabel.text = "\(department.channels)"
        
        cell.layer.borderColor = UIColor.darkGray.cgColor
        cell.layer.borderWidth = 0.3
        return cell
    }
    
    fileprivate func prepareCellForConnectionList(_ tableView:UICollectionView , indexPath : IndexPath) -> UICollectionViewCell{
        //ConnectionCell
        let cell = tableView.dequeueReusableCell(withReuseIdentifier: "ConnectionListCell", for: indexPath) as! ConnectionListCollectionCell
        
        let index = indexPath.section
        let department = departments[index]
        
        let workerID = department.workers[indexPath.row]
        
        for worker in workers {
            if worker.ID == workerID {
                cell.label_name.text = worker.name
                cell.label_position.text = worker.position
                cell.tel = worker.tel
            }
        }
        cell.layer.borderColor = UIColor.darkGray.cgColor
        cell.layer.borderWidth = 0.3
        return cell
    }
    

}
