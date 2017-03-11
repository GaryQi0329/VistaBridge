//
//  TestView.swift
//  testDrawRect
//
//  Created by 齐晴 on 16/9/27.
//  Copyright © 2016年 GaryQi. All rights reserved.
//

import UIKit

struct timeOnDailySheet {
    var day : Int
    var hour : Int
    var minute : Int
}



class DailySheetTimeAxisView : UIView {
    
    var time_chufa = timeOnDailySheet(day: 27, hour: 05, minute: 30)
    var time_fs_am = timeOnDailySheet(day: 27, hour: 09, minute: 00)
    var time_lunch = timeOnDailySheet(day: 27, hour: 12, minute: 30)
    var time_fs_pm = timeOnDailySheet(day: 27, hour: 14, minute: 30)
    var time_supper = timeOnDailySheet(day: 27, hour: 18, minute: 30)
    var time_fs_ng = timeOnDailySheet(day: 27, hour: 19, minute: 30)
    var time_shougong = timeOnDailySheet(day: 27, hour: 23, minute: 30)
    
    
    var time0 = timeOnDailySheet(day: 27, hour: 05, minute: 30)
    
    var x1 : CGFloat = 0
    var x2 : CGFloat = 0
    var y : CGFloat = 0
    var length : CGFloat = 0
    
    var points : [CGPoint] = []
    
    override func draw(_ rect: CGRect) {
        
        print("y:\(y)")
        
        var times = [time_chufa,time_fs_am,time_lunch,time_fs_pm,time_supper,time_fs_ng,time_shougong]
        
        var timesIndicator = ["出发","首镜","午餐","首镜","晚餐","首镜","收工"]
        
        
        
        let context = UIGraphicsGetCurrentContext()
        context?.setLineWidth(8.0)
        
        for index in 0...times.count-1 {
            context?.setStrokeColor(COLORS[index].cgColor)
            let scale = calculateScale(times[index])
            context?.move(to: CGPoint(x: x1, y: y))
            
            
           
            
            context?.setLineWidth(3.0)
            context?.strokePath()
            
            context?.move(to: CGPoint(x: x1, y: y))
            context?.setLineWidth(8.0)
            
            x2 = x1 + length * scale
            
            context?.addLine(to: CGPoint(x: x2, y: y))
            context?.strokePath()
            
            x1 = x2
            
            //添加Label
            let label = UILabel()
            if index%2 == 0 {
                label.frame.origin = CGPoint(x: x1-50, y: y+40)
                
                context?.move(to: CGPoint(x: x1-1, y: y+3))
                context?.addLine(to: CGPoint(x: x1-1, y: y+40))
            }else {
                label.frame.origin = CGPoint(x: x1-50, y: y-100)
                
                context?.move(to: CGPoint(x: x1+1, y: y-3))
                context?.addLine(to: CGPoint(x: x1+1, y: y-40))
            }
            
            context?.setLineWidth(2.0)
            context?.setStrokeColor(COLORS[index].cgColor)
            
            label.frame.size = CGSize(width: 100, height: 60)
            label.numberOfLines = 0
            //            label.backgroundColor = UIColor.yellowColor()
            label.textAlignment = .center
            label.textColor = UIColor(red: 70/255, green: 78/255, blue: 80/255, alpha: 1)
            label.font = UIFont(name: "PingFangTC-Medium", size: 14)
            label.text = "\(timesIndicator[index])\n\(times[index].day)日\(timeToString(times[index].hour)):\(timeToString(times[index].minute))"
            self.addSubview(label)
            
            context?.strokePath()
        }
        
    }
    
    fileprivate func calculateScale(_ time1:timeOnDailySheet) -> CGFloat {
        
        let totalTime = calculateTotalTime()
        
        let scale = CGFloat(time1.hour*60 + time1.minute - (time0.hour * 60 + time0.minute)) / CGFloat(totalTime)
        
        time0.day = time1.day
        time0.hour = time1.hour
        time0.minute = time1.minute
        
        return scale
    }
    
    fileprivate func calculateTotalTime() -> Int {
        if time_shougong.day != time_chufa.day {
            let totalTime = (24 + time_shougong.hour)*60 + time_shougong.minute - (time_chufa.hour * 60 + time_chufa.minute)
            print("totalTime:\(totalTime)")
            return totalTime
        }
        
        let totalTime = (time_shougong.hour*60 + time_shougong.minute ) - (time_chufa.hour * 60 + time_chufa.minute)
        return totalTime
    }
    
    fileprivate func timeToString(_ time:Int) -> String {
        if time < 10 {
            return "0\(time)"
        }
        else{
            return "\(time)"
        }
    }
    
}
