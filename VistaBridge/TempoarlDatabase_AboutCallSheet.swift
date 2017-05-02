//
//  TempoarlDatabase_AboutCallSheet.swift
//  VistaBridge
//
//  Created by 齐晴 on 16/10/23.
//  Copyright © 2016年 GaryQi. All rights reserved.
//

import Foundation

//通告单的基础信息
struct CallSheet {
    let callSheetID : Int
    let date : String
    let shootingDaysNumber : Int    //拍摄的第几天
    let weather : String
    let sunriseTime : String
    let sunsetTime : String
    let breakfastTime : String
    let lunchTime : String
    let dinnerTime : String
    let callingTime : [String : String] //ps. ["摄影组":"7:20" , "武术组":"8:30"]
    let scenesToBeShooted : [Int]   //存放需要拍摄场次的ID
    let actorInfosAboutCallSheet : [CharactersInfosAboutCallSheet]
}

//通告单中关于角色化妆的信息
struct CharactersInfosAboutCallSheet {
    let characterID : Int   // 通过角色ID可以推测出castID
    let count : Int? //群演的数量
    let departureTime : String //出发时间
    let makeupID : Int? //妆扮ID
    let wardrobeID : Int    //服装ID
    let makeupTime : String     //化妆时间
    let wardrobeTime : String   //服装时间
    let setCallTime : String    //进场时间
    let remarks : String?    //备注
}

let CALL_SHEETS = [
    CallSheet(callSheetID: 1201, date: "2016年7月15日 星期三", shootingDaysNumber: 55, weather: "多云转晴 35℃/17℃\n西北风 3-4级", sunriseTime: "05:15", sunsetTime: "18:31", breakfastTime: "驻地－7:30", lunchTime: "现场－12:30", dinnerTime: "现场－17:30", callingTime: ["摄影组":"08:00","美术组":"08:30","导演组":"08:30","灯光组":"08:00","道具组":"08:00","场务组":"08:00"], scenesToBeShooted: [1,5,14], actorInfosAboutCallSheet:
        [
            CharactersInfosAboutCallSheet(characterID: 101, count: nil,departureTime : "06:00", makeupID: 1, wardrobeID: 1, makeupTime: "06:30", wardrobeTime : "09:30", setCallTime: "10:00", remarks: "进场时间暂定10:00，一切以现场通知为准"),
            CharactersInfosAboutCallSheet(characterID: 102, count: nil, departureTime : "06:00", makeupID: 4, wardrobeID: 4, makeupTime: "06:30", wardrobeTime : "09:30", setCallTime: "10:00", remarks: nil),
            CharactersInfosAboutCallSheet(characterID: 103, count: nil, departureTime : "06:00", makeupID: 6, wardrobeID: 6, makeupTime: "06:30", wardrobeTime : "09:30", setCallTime: "10:00", remarks: nil),
            CharactersInfosAboutCallSheet(characterID: 104, count: nil, departureTime : "06:00", makeupID: 7, wardrobeID: 7, makeupTime: "06:30", wardrobeTime : "09:30", setCallTime: "10:00", remarks: nil),
            CharactersInfosAboutCallSheet(characterID: 701, count: 30, departureTime : "07:30", makeupID: nil, wardrobeID: 8, makeupTime: "8:00", wardrobeTime : "09:30", setCallTime: "8:30", remarks: "辛苦魔兵和联军兄弟早点入场走戏"),
            CharactersInfosAboutCallSheet(characterID: 702, count: 30, departureTime : "07:30", makeupID: 9, wardrobeID: 9, makeupTime: "8:00", wardrobeTime : "08:00", setCallTime: "8:30", remarks: nil)
        ])
]
