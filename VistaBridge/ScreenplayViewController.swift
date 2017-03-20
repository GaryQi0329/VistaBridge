//
//  ScreenplayViewController.swift
//  VistaBridge
//
//  Created by 齐晴 on 17/1/4.
//  Copyright © 2017年 GaryQi. All rights reserved.
//

import UIKit

class ScreenplayViewController: UIViewController {
    @IBOutlet weak var textView_screenplay: UITextView!
    @IBOutlet weak var toolBarView: UIView!
    let assistant : ScreenplayAssistant = ScreenplayAssistant.init()
    
    let NotificationName_DateNumberChange = "SceneInfoViewController_SceneNumberChanged"
    
    let tag_greenButton = 4001
    let tag_yellowButton = 4002
    let tag_whiteButton = 4003
    let tag_redButton = 4004
    
    @IBOutlet weak var penButton: UIButton!
    var sceneNo : Int = 0
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func  viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        //为NavigationItem添加按钮，注意这个NavigationItem是谁的
        let item0 = UIBarButtonItem(image:UIImage(named: "info"), style: .plain, target: self, action: #selector(CommonInfosOfSceneViewController.segueToCommonInfos))
        
        let item1 = UIBarButtonItem(image:UIImage(named: "slate"), style: .plain, target: self, action: #selector(CommonInfosOfSceneViewController.segueToContinuitySheet))
        let item2 = UIBarButtonItem(image:UIImage(named: "photo"), style: .plain, target: self, action: #selector(CommonInfosOfSceneViewController.segueToContinuityPics))
        let item3 = UIBarButtonItem(image:UIImage(named: "script"), style: .plain, target: self, action: #selector(self.segueToScreenplay))
        self.tabBarController?.tabBarController?.navigationItem.rightBarButtonItems = [item3,item2,item1,item0]
        assistant.initStrike()
        textView_screenplay.attributedText = assistant.text_screenplay
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        textView_screenplay.attributedText = assistant.text_screenplay

        
        NotificationCenter.default.addObserver(self, selector: #selector(self.sceneNumberDidChanged(notification:)), name: NSNotification.Name(rawValue: NotificationName_DateNumberChange), object: nil)
    }
    
    func sceneNumberDidChanged(notification : NSNotification) {
        let userInfo = notification.userInfo
        sceneNo = userInfo!["sceneNo"] as! Int
        let range = assistant.sceneNoChanged(sceneNo: sceneNo)
        textView_screenplay.isScrollEnabled = false
        textView_screenplay.isScrollEnabled = true
        textView_screenplay.scrollRangeToVisible(range)
        
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
    
    @IBAction func colorButtonClicked(_ sender: UIButton) {
        //先判断是否有选中部分
        
        switch sender.tag {
        case tag_greenButton:
            setStatusForSceneNo(sceneNo: sceneNo, status: .green)
        case tag_yellowButton:
            setStatusForSceneNo(sceneNo: sceneNo, status: .yellow)
        case tag_whiteButton:
            setStatusForSceneNo(sceneNo: sceneNo, status: .white)
        default:
            //case tag_redButton:
            setStatusForSceneNo(sceneNo: sceneNo, status: .red)
            
        }
        
        NotificationCenter.default.post(name: Notification.Name(rawValue: "sceneNo_refresh"), object: self, userInfo:nil)
    }
    
    private func setStatusForSceneNo(sceneNo : Int , status : ShootingStatus) {
        for index in 0...SCENE_INFOS.count-1 {
            if SCENE_INFOS[index].sceneNo.number == sceneNo {
                SCENE_INFOS[index].sceneNo.status = status
                
                if status == .yellow {
                    var isExistInArry = false
                    
                    for sNo in ToBeChoosenScenesNo {
                        if sNo == sceneNo {
                            isExistInArry = true
                            break
                        }
                        
                    }
                    if isExistInArry == false {
                        ToBeChoosenScenesNo.append(sceneNo)
                    }
                }
                
                break
            }
            
            
        }
    }
    
    @IBAction func strikeSth(_ sender: Any) {
        
        let range = textView_screenplay.selectedRange
        if range.length != 0 {
            assistant.text_screenplay.addAttribute(NSStrikethroughStyleAttributeName, value: 1.0, range: NSMakeRange(range.location, range.length))
            textView_screenplay.attributedText = assistant.text_screenplay
            screenplay_strike.append(VB_Range(location: range.location + range.location, length: range.length))
            
        }
    }
    
}
