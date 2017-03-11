//
//  WarehouseViewController.swift
//  VistaBridge
//
//  Created by 齐晴 on 16/9/6.
//  Copyright © 2016年 GaryQi. All rights reserved.
//

import UIKit

class WarehouseViewController: UIViewController ,UITableViewDataSource, UITableViewDelegate{
    
    let tag_bSetDressing = 3701
    let tag_bCostumes = 3702
    let tag_bProps = 3703
    
    var indicator : Int = 3701{
        didSet {
            tableview.reloadData()
        }
    }
    
    @IBOutlet weak var tableview: UITableView!
    
    let NotificationName_ZoomInImage = "NotificationName_ZoomInImage"
    let zoomView = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.leftBarButtonItem = self.tabBarController?.navigationItem.leftBarButtonItem
        NotificationCenter.default.addObserver(self, selector: #selector(WarehouseViewController.ZoomInImage(_:)), name: NSNotification.Name(rawValue: NotificationName_ZoomInImage), object: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch indicator {
        case tag_bSetDressing:
            return sets.count
        case tag_bCostumes:
            return costumes.count
        case tag_bProps:
            return props.count
        default:
            print("WarehouseViewController_numberOfRowsInSection.")
            return 0
        }
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch indicator {
        case tag_bSetDressing:
            let cell = tableView.dequeueReusableCell(withIdentifier: "SetDressingCell", for: indexPath) as! SetDressingCell
            for v in cell.contentView.subviews[1].subviews {
                v.removeFromSuperview()
            }
            
            cell.label_setName.text = sets[indexPath.row].name
            if sets[indexPath.row].completionDate != nil {
                cell.label_setCompletionDate.text = "\(sets[indexPath.row].completionDate!)  交景"
            }
            cell.rightView.frame.size.width = cell.frame.size.width/2
            cell.prepareScrollViewForImages(sets[indexPath.row].ID)
            return cell
        case tag_bCostumes:
            let cell = tableview.dequeueReusableCell(withIdentifier: "CostumeCell",for: indexPath) as! CostumeCell
            for v in cell.contentView.subviews[0].subviews {
                v.removeFromSuperview()
            }
        cell.label_costumeName.text = costumes[indexPath.row].name
            cell.label_costumeSum.text = "x\(costumes[indexPath.row].sum) 套"
            cell.rightView.frame.size.width = cell.frame.size.width/2
            cell.prepareScrollViewForImages(costumes[indexPath.row].ID)
            return cell
        default:
            //case tag_bPropCell
            let cell = tableview.dequeueReusableCell(withIdentifier: "PropCell",for: indexPath) as! PropCell
            for v in cell.contentView.subviews[0].subviews {
                v.removeFromSuperview()
            }
            cell.label_propName.text = props[indexPath.row].name
            cell.label_amount.text = "x\(props[indexPath.row].sum)"
            
            cell.rightView.frame.size.width = cell.frame.size.width/2
            cell.prepareScrollViewForImages(props[indexPath.row].ID)
            return cell
        }
        
        
        
    }
    
    func ZoomInImage(_ notification: Notification) {
        let userInfo = notification.userInfo
        let imageName = userInfo!["ImageName"] as! String
        
        zoomView.frame = self.view.frame
        zoomView.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.5)
        
        let imageView = UIImageView(image: UIImage(named: imageName))
        imageView.center = zoomView.center
        zoomView.addSubview(imageView)
        self.view.addSubview(zoomView)
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(WarehouseViewController.disappearZoomView))
        zoomView.addGestureRecognizer(tapGesture)
    }
    
    func disappearZoomView() {
        
        for sub in zoomView.subviews {
            sub.removeFromSuperview()
        }
        zoomView.removeFromSuperview()
    }
    
    @IBAction func switchButtonClicked(_ sender: AnyObject) {
        indicator = sender.tag
    }
}
