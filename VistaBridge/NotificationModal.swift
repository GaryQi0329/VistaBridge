//
//  NotificationModal.swift
//  VistaBridge
//
//  Created by 齐晴 on 16/9/23.
//  Copyright © 2016年 GaryQi. All rights reserved.
//

import Foundation

class modal : NSObject{
    
    let NotificationName_DateNumberChange = "NotificationName_DateNumberChanged"
    
    override init(){
        super.init()
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "DateNumberChanged", name: NotificationName_DateNumberChange, object: nil)
        print("注册通知了")
    }
    
    private func DateNumberChanged(notification : NSNotification) {
        print("DateNumberChanged")
        let userInfo = notification.userInfo as! [String : AnyObject]
        let dateNo = userInfo["dateNo"] as! String
        print("success_receive_notification")
//        self.date = dateNo
    }
    
    deinit{
        NSNotificationCenter.defaultCenter().removeObserver(self)
    }
}