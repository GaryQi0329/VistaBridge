//
//  CallSheetViewController.swift
//  VistaBridge
//
//  Created by 齐晴 on 16/9/6.
//  Copyright © 2016年 GaryQi. All rights reserved.
//

import UIKit

class CallSheetViewController: UIViewController,UITableViewDataSource,UITableViewDelegate{
    
    @IBOutlet weak var callSheetTableView: UITableView!
    
    var callsheet = CALL_SHEETS[0]
    
    let SceneInfoCell_Identifier = "CallSheetSceneInfoCell"
    let CastInfoCell_Identifier = "CallSheetCastInfoCell"
    let SceneInfoHeaderCell_Identifier = "CallSheetSceneInfoHeaderCell"
    let CastInfoHeaderCell_Identifier = "CallSheetCastInfoHeaderCell"
    let GeneralInfoCell_Identifier = "GeneralInfoCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.leftBarButtonItem = self.splitViewController?.displayModeButtonItem
        
        //注册Cell
        callSheetTableView.register(CallSheetSceneInfoCell.self, forCellReuseIdentifier: SceneInfoCell_Identifier)
        callSheetTableView.register(CallSheetCastInfoCell.self, forCellReuseIdentifier: CastInfoCell_Identifier)
        
        //注册场景信息的header view
        callSheetTableView.register(CallSheetSceneInfoHeaderCell.self, forHeaderFooterViewReuseIdentifier:SceneInfoHeaderCell_Identifier)
        callSheetTableView.register(CallSheetCastInfoHeaderCell.self, forHeaderFooterViewReuseIdentifier:CastInfoHeaderCell_Identifier)
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0 :
            //通告单中的常规信息
            return 1
        case 1 :
            //通告单中的场次信息
            return callsheet.scenesToBeShooted.count
        case 2 :
            //通告单中的演员化妆信息
            return callsheet.actorInfosAboutCallSheet.count
        default :
            return 0
            
        }
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        switch section {
        case 0 :
            //通告单中的常规信息
            return nil
        case 1 :
            //通告单中的场次信息
            let sceneSectionHeaderView = tableView.dequeueReusableHeaderFooterView(withIdentifier: SceneInfoHeaderCell_Identifier) as! CallSheetSceneInfoHeaderCell
            return sceneSectionHeaderView
        case 2 :
            //通告单中的演员化妆信息
            let castSectionHeaderView = tableView.dequeueReusableHeaderFooterView(withIdentifier: CastInfoHeaderCell_Identifier) as! CallSheetCastInfoHeaderCell
            return castSectionHeaderView
        default :
            return nil
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0 :
            //通告单中的常规信息
            let cell = tableView.dequeueReusableCell(withIdentifier: GeneralInfoCell_Identifier) as! GeneralInfoCell
            return cell
            
        case 1 :
            //通告单中的场次信息
            let cell = tableView.dequeueReusableCell(withIdentifier: SceneInfoCell_Identifier) as! CallSheetSceneInfoCell
            cell.sceneInfos = searchSceneInfosBySceneNo(callsheet.scenesToBeShooted[indexPath.row])
            
            if cell.sceneInfos != nil {
                cell.prepareCallSheetSceneInfoCell()
            }
            
            return cell
            
        case 2 :
            //通告单中的演员化妆信息
            let cell = tableView.dequeueReusableCell(withIdentifier: CastInfoCell_Identifier) as! CallSheetCastInfoCell
            cell.characterInfosAboutCallSheet = callsheet.actorInfosAboutCallSheet[indexPath.row]
            
            if cell.characterInfosAboutCallSheet != nil {
                cell.prepareCallSheetCastInfoCell()
            }
            
            return cell
        default :
            let cell = tableView.dequeueReusableCell(withIdentifier: SceneInfoCell_Identifier) as! CallSheetSceneInfoCell
            
            for view in cell.subviews {
                view.removeFromSuperview()
            }
            
            return cell
            
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //判断选中的是场次Cell
        if indexPath.section == 1{
            let cell = tableView.cellForRow(at: indexPath) as! CallSheetSceneInfoCell
            let sceneNo = Int(cell.sceneNoLabel.text!)!
            
            let popController = SceneCardViewController()
            popController.prepareSceneCard(sceneNo: sceneNo)
            popController.view.frame = CGRect(x: 0, y: 0, width: 320, height: 180)
            let d = UIPopoverController(contentViewController: popController)
            d.contentSize = CGSize(width: 320, height: 180)
            let p = self.view.center
            let rect = CGRect(x: p.x, y: p.y, width: 0, height: 0)
            d.present(from: rect, in: self.view, permittedArrowDirections: .unknown, animated: true)
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return 280
        }else {
            return 60
        }
    }
    
    
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        view.tintColor = UIColor.white
        view.backgroundColor = UIColor.white
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        
        if section == 0{
            return 0
        }
        return 90
    }
    
    
    fileprivate func searchSceneInfosBySceneNo(_ sceneNo : Int) -> SceneInfo? {
        for sceneInfo in SCENE_INFOS {
            if sceneInfo.sceneNo.number == sceneNo {
                return sceneInfo
            }
        }
        
        return nil
    }
}
