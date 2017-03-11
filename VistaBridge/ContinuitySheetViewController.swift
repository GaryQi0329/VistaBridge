//
//  ContinuitySheetViewController.swift
//  VistaBridge
//
//  Created by 齐晴 on 16/9/19.
//  Copyright © 2016年 GaryQi. All rights reserved.
//

import UIKit

class ContinuitySheetViewController: UIViewController,UITableViewDataSource,UITableViewDelegate{

    @IBOutlet weak var tableView: UITableView!
    
    let Identifier_ContinuitySheetCell = "ContinuitySheetCell"
    let Identifier_ContinuitySheetDateCell = "ContinuitySheetDateCell"
    let Identifier_HeaderView = "ContinuitySheet_HeaderView"
    let NotificationName_DateNumberChange = "DateInfoViewController_DateNumberChanged"
    
    var recordings : [ContinuitySheetRecording]?
    
    var date : String? {
        didSet {
            //每当date重新设置了新的值，就更新tableView中的数据
            recordings?.removeAll()
            recordings = searchContinuitySheetRecordingsByDate(date!)
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
                NotificationCenter.default.addObserver(self, selector: #selector(ContinuitySheetViewController.DateNumberChanged(_:)), name: NSNotification.Name(rawValue: NotificationName_DateNumberChange), object: nil)
        
        tableView.register(ContinuitySheetHeaderView.self, forHeaderFooterViewReuseIdentifier: Identifier_HeaderView)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        
        NotificationCenter.default.removeObserver(self, name: NSNotification.Name(rawValue: NotificationName_DateNumberChange), object: nil)
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
            return recordings!.count
        } else {
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Identifier_ContinuitySheetCell) as! ContinuitySheetCell
        if recordings != nil {
            //该日期下,有场记条目若干
            cell.prepareContinuitySheetCell(recordings![indexPath.row])
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
    
    fileprivate func searchContinuitySheetRecordingsByDate(_ date:String) -> [ContinuitySheetRecording]?{
        //根据日期，寻找当日的场记表条目
        if let recordings = CONTINUITY_SHEET_INFOS[date] {
            return recordings
        } else {
            return nil
        }
    }
    
    func DateNumberChanged(_ notification : Notification) {
        let userInfo = notification.userInfo as! [String : String]
        date = userInfo["date"]
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        //为NavigationItem添加按钮，注意这个NavigationItem是谁的
        let item0 = UIBarButtonItem(title: "日", style: .plain, target: self, action: #selector(ContinuitySheetViewController.segueToDailySheet))
        let item1 = UIBarButtonItem(title: "场", style: .plain, target: self, action: #selector(ContinuitySheetViewController.segueToContinuitySheet))
        self.tabBarController?.tabBarController?.navigationItem.rightBarButtonItems = [item1,item0]
    }
    
    func segueToDailySheet() {
        self.tabBarController?.selectedIndex = 0
    }
    
    func segueToContinuitySheet() {
        self.tabBarController?.selectedIndex = 1
    }

}
