//
//  MasterViewController.swift
//  VistaBridge
//
//  Created by 齐晴 on 16/9/6.
//  Copyright © 2016年 GaryQi. All rights reserved.
//

import UIKit
import CoreData

class MasterViewController: UITableViewController, NSFetchedResultsControllerDelegate {
    
    var detailTabBarViewController: DetailTabBarController? = nil
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

        
        if let split = self.splitViewController {
            let controllers = split.viewControllers
            self.detailTabBarViewController = (controllers[controllers.count-1] as! UINavigationController).topViewController as? DetailTabBarController
            
        }
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.clearsSelectionOnViewWillAppear = self.splitViewController!.isCollapsed
        super.viewWillAppear(animated)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    // MARK: - Segues
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //        if segue.identifier == "showDetail" {
        //            if let indexPath = self.tableView.indexPathForSelectedRow {
        //                let naviController = segue.destinationViewController as! UINavigationController
        //
        //                let tabBarController = naviController.topViewController as! DetailTabBarController
        //                tabBarController.selectedIndex = indexPath.row
        //
        //            }
        //        }
    }
    
    // MARK: - Table View
    
    override func numberOfSections(in tableView: UITableView) -> Int {
//        tableView.separatorStyle = .None
        tableView.separatorColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.9)
        
        
        return MasterViewDataSource().cellNames.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return MasterViewDataSource().cellNames[section].count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) 
        cell.textLabel?.text = MasterViewDataSource().cellNames[indexPath.section][indexPath.row]
        cell.textLabel?.font = UIFont(name: "PingFangTC-Medium", size: 18)
        cell.textLabel?.textAlignment = .center
        cell.textLabel?.textColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.9)
        cell.contentView.backgroundColor = UIColor(red: 83/255, green: 219/255, blue: 64/255, alpha: 1)
//        cell.textLabel?.backgroundColor = UIColor.redColor()
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if indexPath.section < 2 {
            detailTabBarViewController?.selectedIndex = indexPath.section + indexPath.row
        } else {
            detailTabBarViewController?.selectedIndex = MasterViewDataSource().cellNames[0].count + MasterViewDataSource().cellNames[1].count + indexPath.row
        }
    }
    
    
    // MARK: - Fetched results controller
    
    /*
    // Implementing the above methods to update the table view in response to individual changes may have performance implications if a large number of changes are made simultaneously. If this proves to be an issue, you can instead just implement controllerDidChangeContent: which notifies the delegate that all section and object changes have been processed.
    
    func controllerDidChangeContent(controller: NSFetchedResultsController) {
    // In the simplest, most efficient, case, reload the table view.
    self.tableView.reloadData()
    }
    */
    
}

