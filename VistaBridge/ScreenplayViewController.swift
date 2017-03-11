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
    let assistant : ScreenplayAssistant = ScreenplayAssistant.init()
    
    let NotificationName_DateNumberChange = "SceneInfoViewController_SceneNumberChanged"
    
    let tag_greenButton = 4001
    let tag_yellowButton = 4002
    let tag_whiteButton = 4003
    let tag_redButton = 4004
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func  viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        //为NavigationItem添加按钮，注意这个NavigationItem是谁的
        let item0 = UIBarButtonItem(title: "常", style: .plain, target: self, action: #selector(self.segueToCommonInfos))
        let item1 = UIBarButtonItem(title: "场", style: .plain, target: self, action: #selector(self.segueToContinuitySheet))
        let item2 = UIBarButtonItem(title: "接", style: .plain, target: self, action: #selector(self.segueToContinuityPics))
        let item3 = UIBarButtonItem(title: "剧", style: .plain, target: self, action: #selector(self.segueToScreenplay))
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
        let sceneNo = userInfo!["sceneNo"] as! Int
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
        print("location:\(textView_screenplay.selectedRange.location), length:\(textView_screenplay.selectedRange.length)")
        //先判断是否有选中部分
        if textView_screenplay.selectedRange.length == 0 {
            return
        }
        
        switch sender.tag {
        case tag_greenButton:
            textView_screenplay.attributedText = assistant.updateColor(range: textView_screenplay.selectedRange, tagOfColor: 1)
        case tag_yellowButton:
            textView_screenplay.attributedText = assistant.updateColor(range: textView_screenplay.selectedRange, tagOfColor: 2)
        case tag_whiteButton:
            textView_screenplay.attributedText = assistant.updateColor(range: textView_screenplay.selectedRange, tagOfColor: 3)
        default:
            //case tag_redButton:
            textView_screenplay.attributedText = assistant.updateColor(range: textView_screenplay.selectedRange, tagOfColor: 4)
            
        }
    }
    
    
}
