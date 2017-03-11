//
//  DateClass.swift
//  MySwiftCalendar
//
//  Created by Zilu.Ma on 16/7/8.
//  Copyright © 2016年 Zilu.Ma. All rights reserved.
//

import UIKit

class DateClass {

    //得到当前年,月,日
    static func getNowDate() -> (year:Int,month:Int,day:Int){
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let string = dateFormatter.string(from: Date())
        let array = string.components(separatedBy: "-")
        
        return (Int(array[0])!,Int(array[1])!,Int(array[2])!)
    }
    
    //根据年月得到某月有几天,第一天是周几
    static func getCountOfDaysInMonth(year:Int,month:Int) -> (count:Int,week:Int){
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM"
        let date
            = dateFormatter.date(from: String(year)+"-"+String(month))
        
        let calender = Calendar(identifier:Calendar.Identifier.gregorian)
        let range = (calender as NSCalendar?)?.range(of: NSCalendar.Unit.day, in: NSCalendar.Unit.month, for: date!)
        
        let comps = (calender as NSCalendar?)?.components(NSCalendar.Unit.weekday, from: date!)
        let week = comps?.weekday
        
        return ((range?.length)!,week!)
    }
    
    static func getYearAndMonth(_ year:Int,month:Int) -> (year:Int,month:Int,count:Int,week:Int){
        
        var y = year
        var m = month
        if month > 12 {
            m = 1
            y += 1
        }else if month <= 0 {
            m = 12
            y -= 1
        }
        
        let countOfMonth = getCountOfDaysInMonth(year: y, month: m)
        
        return (y,m,countOfMonth.count,countOfMonth.week)
    }
    
    static func getNumber(_ number:Int) -> String {
        if number >= 10 {
            return String(number)
        }else{
            return "0" + String(number)
        }
    }
}




