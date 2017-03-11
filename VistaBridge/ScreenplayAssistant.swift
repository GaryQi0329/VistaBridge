//
//  screenplayAssistant.swift
//  VistaBridge
//
//  Created by 齐晴 on 17/1/4.
//  Copyright © 2017年 GaryQi. All rights reserved.
//

import Foundation
import UIKit

class ScreenplayAssistant {
    let text_screenplay : NSMutableAttributedString
    let text_refScreenplay : NSString
    
    init() {
        
        //init text_screenplay
        let url = Bundle.main.url(forResource: "screenplay", withExtension: "txt")
        do {
            text_screenplay = try NSMutableAttributedString.init(url: url!, options: [:], documentAttributes: nil)
        }catch {
            print("ScreenplayAssistant_init_NSAttributedString.init_error.")
            text_screenplay = NSMutableAttributedString(string: "ScreenplayAssistant_init_NSAttributedString.init_error.")
        }
        
        //init text_refScreenplay
        do {
            text_refScreenplay = try NSString(contentsOf: url!, encoding: String.Encoding.utf8.rawValue)
        } catch {
            print("ScreenplayAssistant_init_NSString.init_error.")
            text_refScreenplay = NSString(string: "ScreenplayAssistant_init_NSString.init_error.")
        }
        
        //字体和字色
        text_screenplay.addAttribute(NSFontAttributeName, value: UIFont(name: "PingFangTC-Medium", size: 17), range: NSRange.init(location: 0, length: text_screenplay.length))
        text_screenplay.addAttribute(NSForegroundColorAttributeName, value: UIColor(colorLiteralRed: 48/255, green: 52/255, blue: 50/255, alpha: 1), range: NSRange.init(location: 0, length: text_screenplay.length))
        
        initStrike()
    }
    
    func sceneNoChanged(sceneNo : Int) -> NSRange {
        //当场次号改变时，计算textView应该跳转至的位置，返回Range
        let sceneInfo = "\(sceneNo)."
        let range = text_refScreenplay.range(of: sceneInfo)
        print(range.location)
        print(range.length)
        return range
    }
    
    func initStrike() {
        //色彩初始化
        for range in screenplay_strike {
            text_screenplay.addAttribute(NSStrikethroughStyleAttributeName, value: 1.0, range: NSMakeRange(range.location, range.length))
        }
        
    }
    
    func updateColor(range : NSRange, tagOfColor tag : Int) -> NSMutableAttributedString{
        switch tag {
        case 1:
            //green
            text_screenplay.addAttribute(NSBackgroundColorAttributeName, value: UIColor.init(red: 83/255, green: 219/255, blue: 64/255, alpha: 1), range: range)
        case 2:
            //yellow
            text_screenplay.addAttribute(NSBackgroundColorAttributeName, value: UIColor.init(red: 241/255, green: 196/255, blue: 15/255, alpha: 1), range: range)
        case 3:
            //white
            text_screenplay.addAttribute(NSBackgroundColorAttributeName, value: UIColor.init(red: 255/255, green: 255/255, blue: 255/255, alpha: 1), range: range)
        default:
            //red
            text_screenplay.addAttribute(NSBackgroundColorAttributeName, value: UIColor.init(red: 231/255, green: 76/255, blue: 60/255, alpha: 1), range: range)
        }
        
        return text_screenplay
    }
    
}
