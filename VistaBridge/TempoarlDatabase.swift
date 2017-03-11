//
//  TempoarlDatabase.swift
//  VistaBridge
//
//  Created by 齐晴 on 16/9/6.
//  Copyright © 2016年 GaryQi. All rights reserved.
//

import Foundation
import UIKit

struct MasterViewDataSource {
    
    //每个cell的名字
    let cellNames =
    [
        [
            "通告单"
        ],
        [
            "场次信息",
            "日期信息",
            "期表",
            "演员档期表",
            "仓库"
        ],
        [
            "查询"
        ]
    ]
}



//气氛
enum ATMOSPHERE : Int{
    case dayIn = 0
    case dayOut
    case nightIn
    case nightOut
}

let arr_ATMOSPHERE = ["日内","日外","夜内","夜外"]

//拍摄器械的基本信息
struct Equipment {
    let equipmentID : Int
    let name : String
    let amount : Int
}


//道具的基础信息
struct Props {
    let propsID : Int
    let name : String
    let amount : Int    //总量
}

//拍摄地相关信息
struct Location {
    let locationID : Int    //场景ID
    let name: String    //拍摄景地名称
    let address : String    //地址
    let distanceTime : Int   //单位分钟
}

let locations = [
    Location(locationID: 1401, name: "国华2号棚", address: "北京国华影视基地2号棚", distanceTime: 20),
    Location(locationID: 1402, name: "国华7号棚", address: "北京国华影视基地7号棚", distanceTime: 20)
]

//关于每个拍摄日的信息
struct DateInfo {
    let month : Int
    let day : Int
    var scenes : [Int]?  // 该日需要拍摄场次的场号
    
}

enum ShootingResult {
    case ok
    case kp
    case ng
}

enum ShotSize {
    case xls    //EXTREME LONG SHOT 远
    case vls    //VERY LONG SHOT 大全
    case ls     //LONG SHOT 全
    case mls    //MEDIUM LONG SHOT 中
    case ms     //MID SHOT 中近
    case mcu    //MEDIUM CLOSEUP 近
    case cu     //CLOSEUP 特
    case bcu    //BIG CLOSEUP 大特
    case ecu    //EXTREME CLOSEUP 局部大特
}

//场记单中每一条记录的信息
struct ContinuitySheetRecording{
    let createdDate : String
    let rollNumber : String
    let fileNumber : String
    let sceneNumber : Int
    let shotNumber : Int
    let takeNumber : Int
    let result : ShootingResult
    let synopsis : String?
    let shotSize : ShotSize?
}

//在场次信息表中的常规信息中，CollectionViewCell的类型
enum TypeOfTheCommonInfos:Int{
    case cast = 0 //主演
    case background //群演&替身
    //    case Stunts //武行
    case props  //道具
    //    case Set    //拍摄场景
    case location   //拍摄地
    case equipment  //拍摄器材
    
    static var count : Int{return TypeOfTheCommonInfos.equipment.rawValue+1}
}

struct BackgroundActor {
    let ID : Int
    let name : String
    let number : Int
}

struct DailySheet {
    let date : String   //日期
    let departureTime : timeOnDailySheet    //出工时间
    let firstShotAfterDeparture : timeOnDailySheet  //出工后拍摄第一条的时间
    let lunchtime : timeOnDailySheet    //中午放饭时间
    let firstShotAfterLunch : timeOnDailySheet  //午餐后拍摄第一条的时间
    let suppertime : timeOnDailySheet   //晚餐时间
    let fistShotAfterSupper : timeOnDailySheet  //晚餐后第一条的时间
    let offTime : timeOnDailySheet  //收工时间
    
}

//暂时的时间类，用于日报表
struct Time {
    let hour : Int
    let minute : Int
}

let SCENES = [
    1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73,74,75,76,77,78,79,80,81,82,83,84,85,86,87,88,89,90,91,92,93,94,95,96,97,98,99,100,101,102,103,104,105,106,107,108,109,110,111,112,113,114,115,116,117,118,119,120
]

let DATE =
[
    "7月":["1","2","3","4","5","6","7","8","9","10","11","12","13","14","15","16","17","18","19","20","21","22","23","24","25","26","27","28","29","30","31"],
    "8月":["1","2","3","4","5","6","7","8","9","10","11","12","13","14","15","16","17","18","19","20","21","22","23","24","25","26","27","28","29","30","31"]
]

let dates =
[
    "7月1日","7月2日","7月3日","7月4日","7月5日","7月6日","7月7日","7月8日","7月9日","7月10日","7月11日","7月12日","7月13日","7月14日","7月15日","7月16日","7月17日","7月18日","7月19日","7月20日","7月21日","7月22日","7月23日","7月24日","7月25日","7月26日","7月27日","7月28日","7月29日","7月30日","7月31日","8月1日","8月2日","8月3日","8月4日","8月5日","8月6日","8月7日","8月8日","8月9日","8月10日","8月11日","8月12日","8月13日","8月14日","8月15日","8月16日","8月17日","8月18日","8月19日","8月20日","8月21日","8月22日","8月23日","8月24日","8月25日","8月26日","8月27日","8月28日","8月29日","8月30日","8月31日",
]

let COLORS = [
    UIColor(red: 46/255, green: 204/255, blue: 213/255, alpha: 1),
    UIColor(red: 52/255, green: 152/255, blue: 219/255, alpha: 1),
    UIColor(red: 155/255, green: 89/255, blue: 182/255, alpha: 1),
    UIColor(red: 241/255, green: 196/255, blue: 15/255, alpha: 1),
    UIColor(red: 243/255, green: 156/255, blue: 18/255, alpha: 1),
    UIColor(red: 22/255, green: 160/255, blue: 133/255, alpha: 1),
    UIColor(red: 46/255, green: 204/255, blue: 213/255, alpha: 1)
]

let ACTOR_INFO = [
    "铁木真" : ["","",""],
    "孛尔帖": [],
    "博尔术": [],
    "忽出鲁": [],
    "扎木合": [],
    "塔里忽台": [],
    "朵歹": [],
    "萨满": [],
    "特薛禅" : [],
    "扎乌": [],
    "哈娃": [],
    "黑秃黑": [],
    "哈尔库": [],
    "也速亥": [],
    "冥王": [],
    "战神赤那": [],
    "诃额伦": [],
    "哈撒尔" : [],
    "别勒古台": [],
    "胡伯颜": [],
    "莫干": [],
    "阿如汗": [],
    "阿吉泰": [],
    "布森": [],
]




var DATE_INFOS : [DateInfo] =
[
    DateInfo(month: 7, day:1, scenes: [1]),
    DateInfo(month: 7, day:2, scenes: [2,5,15]),
    DateInfo(month: 7, day:3, scenes: [3,24,27,50]),
    DateInfo(month: 7, day:4, scenes: [4,17,36]),
    DateInfo(month: 7, day:5, scenes: [5,34,44]),
    DateInfo(month: 7, day:6, scenes: [6,21,12,23,34,45]),
    DateInfo(month: 7, day:7, scenes: [7,13,24,35,36,37]),
    DateInfo(month: 7, day:8, scenes: [8,13,21]),
    DateInfo(month: 7, day:9, scenes: [54]),
    DateInfo(month: 7, day:10, scenes: [54]),
    DateInfo(month: 7, day:11, scenes: [54]),
    DateInfo(month: 7, day:12, scenes: [12,13]),
    DateInfo(month: 7, day:13, scenes: [13]),
    DateInfo(month: 7, day:14, scenes: [17,19,21,22]),
    DateInfo(month: 7, day:15, scenes: [21,22]),
    DateInfo(month: 7, day:16, scenes: [16,23,40]),
    DateInfo(month: 7, day:17, scenes: [17,43,23]),
    DateInfo(month: 7, day:18, scenes: [18,44,33,38]),
    DateInfo(month: 7, day:19, scenes: [19,22,33]),
    DateInfo(month: 7, day:20, scenes: [20,24,27,29]),
    DateInfo(month: 7, day:21, scenes: [21,40,41,42,43]),
    DateInfo(month: 7, day:22, scenes: [22,37,39]),
    DateInfo(month: 7, day:23, scenes: [23,41,23,55]),
    DateInfo(month: 7, day:24, scenes: [54,57,35]),
    DateInfo(month: 7, day:25, scenes: [25,33,42]),
    DateInfo(month: 7, day:26, scenes: [26,13,17]),
    DateInfo(month: 7, day:27, scenes: [27,23,24]),
    DateInfo(month: 7, day:28, scenes: [28,23,43,44,45]),
    DateInfo(month: 7, day:29, scenes: [29,51,52,53,54]),
    DateInfo(month: 7, day:30, scenes: [30,32,33,43]),
    DateInfo(month: 7, day:31, scenes: [31,49,50,51]),
    DateInfo(month: 8, day:1, scenes: [50,51]),
    DateInfo(month: 8, day:2, scenes: [33]),
    DateInfo(month: 8, day:3, scenes: [34]),
    DateInfo(month: 8, day:4, scenes: [35]),
    DateInfo(month: 8, day:5, scenes: [36]),
    DateInfo(month: 8, day:6, scenes: [37]),
    DateInfo(month: 8, day:7, scenes: [38]),
    DateInfo(month: 8, day:8, scenes: [39]),
    DateInfo(month: 8, day:9, scenes: [40]),
    DateInfo(month: 8, day:10, scenes: [41]),
    DateInfo(month: 8, day:11, scenes: [42]),
    DateInfo(month: 8, day:12, scenes: [43]),
    DateInfo(month: 8, day:13, scenes: [44]),
    DateInfo(month: 8, day:14, scenes: [45]),
    DateInfo(month: 8, day:15, scenes: [46]),
    DateInfo(month: 8, day:16, scenes: [47]),
    DateInfo(month: 8, day:17, scenes: [48]),
    DateInfo(month: 8, day:18, scenes: [49]),
    DateInfo(month: 8, day:19, scenes: [50]),
    DateInfo(month: 8, day:20, scenes: [51]),
    DateInfo(month: 8, day:21, scenes: [52]),
    DateInfo(month: 8, day:22, scenes: [53]),
    DateInfo(month: 8, day:23, scenes: [54]),
    DateInfo(month: 8, day:24, scenes: [55]),
    DateInfo(month: 8, day:25, scenes: [56]),
    DateInfo(month: 8, day:26, scenes: [57]),
    DateInfo(month: 8, day:27, scenes: [58]),
    DateInfo(month: 8, day:28, scenes: [59]),
    DateInfo(month: 8, day:29, scenes: [60]),
    DateInfo(month: 8, day:30, scenes: [1])
]

var AlreadyChoosenScenesNo = [1,5,18]

var ToBeChoosenScenesNo = [33,43,45,56]

let BACKGROUND_ACTORS_INFOS : [BackgroundActor] = [
    BackgroundActor(ID:1 , name:"魔兵", number:30),
    BackgroundActor(ID:2 , name:"草原联军", number:30)
]

let CASTACTOR_INFOS_ABOUT_SCENE = [
    CharacterInfosAboutScene(characterID: 101, sceneNo: 1, characterMakeupID: 1, characterWardrobeID: 1),
    CharacterInfosAboutScene(characterID: 102, sceneNo: 1, characterMakeupID: 2, characterWardrobeID: 3),
    CharacterInfosAboutScene(characterID: 103, sceneNo: 1, characterMakeupID: 2, characterWardrobeID: 2),
    CharacterInfosAboutScene(characterID: 104, sceneNo: 1, characterMakeupID: 1, characterWardrobeID: 2)
]

let BACKGROUND_ACTORS_INFOS_ABOUT_SCENE = [
    BackgroundcharacterInfosAboutScene(backgroundCharacterID: 1, sceneNo: 1, number: 15),
    BackgroundcharacterInfosAboutScene(backgroundCharacterID: 2, sceneNo: 1, number: 20)
]

let PROPS_INFOS_ABOUT_SCENE = [
    PropsAboutScene(propsID: 1, sceneNo: 1, number: 15),
    PropsAboutScene(propsID: 2, sceneNo: 1, number: 2),
    PropsAboutScene(propsID: 3, sceneNo: 1, number: 30)
]

let PROPS = [
    Props(propsID: 1, name: "铁的金刀", amount: 20),
    Props(propsID: 2, name: "苏勒定", amount: 3),
    Props(propsID: 3, name: "魔兵武器", amount: 50)
]

let EQUIPMENTS = [
    Equipment(equipmentID: 1, name: "GoPro", amount: 4),
    Equipment(equipmentID: 2, name: "电子炮", amount: 1),
    Equipment(equipmentID: 3, name: "跟拍车", amount: 2)
]

let EQUIPMENTS_INFOS_ABOUT_SCENE = [
    EquipmentInfosAboutScene(equipmentID: 1, sceneNo: 1, number: 2),
    EquipmentInfosAboutScene(equipmentID: 2, sceneNo: 1, number: 1),
    EquipmentInfosAboutScene(equipmentID: 3, sceneNo: 1, number: 1)
]



let DAILYSHEET = [
    DailySheet(date: "0711", departureTime: timeOnDailySheet(day:11,hour: 5,minute: 30), firstShotAfterDeparture: timeOnDailySheet(day:11,hour: 8,minute: 30), lunchtime: timeOnDailySheet(day:11,hour: 12,minute: 30), firstShotAfterLunch: timeOnDailySheet(day:11,hour: 14,minute: 0), suppertime :timeOnDailySheet(day:11,hour: 18,minute: 30),fistShotAfterSupper:timeOnDailySheet(day:11,hour: 20,minute: 30),offTime: timeOnDailySheet(day:12,hour: 3,minute: 30))
]

let CONTINUITY_SHEET_INFOS : [String:[ContinuitySheetRecording]] = [
    
    "0711" :[ContinuitySheetRecording(createdDate:"0711",rollNumber: "A001", fileNumber: "C001", sceneNumber: 13, shotNumber: 1, takeNumber: 1, result: .ng, synopsis: "忽出鲁与铁木真交战",shotSize:.mcu)],
    "0712" :[ContinuitySheetRecording(createdDate: "0712", rollNumber: "A002", fileNumber: "C001", sceneNumber: 13, shotNumber: 4, takeNumber: 1, result: .ok, synopsis: "忽出鲁查杀铁木真", shotSize:ShotSize.mls),ContinuitySheetRecording(createdDate: "0712", rollNumber: "A002", fileNumber: "C001", sceneNumber: 13, shotNumber: 4, takeNumber: 1, result: .ok, synopsis: "忽出鲁查杀铁木真", shotSize:ShotSize.mls),ContinuitySheetRecording(createdDate: "0712", rollNumber: "A002", fileNumber: "C001", sceneNumber: 13, shotNumber: 4, takeNumber: 1, result: .ok, synopsis: "忽出鲁查杀铁木真", shotSize:ShotSize.mls),ContinuitySheetRecording(createdDate: "0712", rollNumber: "A002", fileNumber: "C001", sceneNumber: 13, shotNumber: 4, takeNumber: 1, result: .ok, synopsis: "忽出鲁查杀铁木真", shotSize:ShotSize.mls),ContinuitySheetRecording(createdDate: "0712", rollNumber: "A002", fileNumber: "C001", sceneNumber: 13, shotNumber: 4, takeNumber: 1, result: .ok, synopsis: "忽出鲁查杀铁木真", shotSize:ShotSize.mls),ContinuitySheetRecording(createdDate: "0712", rollNumber: "A002", fileNumber: "C001", sceneNumber: 13, shotNumber: 4, takeNumber: 1, result: .ok, synopsis: "忽出鲁查杀铁木真", shotSize:ShotSize.mls),ContinuitySheetRecording(createdDate: "0712", rollNumber: "A002", fileNumber: "C001", sceneNumber: 13, shotNumber: 4, takeNumber: 1, result: .ok, synopsis: "忽出鲁查杀铁木真", shotSize:ShotSize.mls),ContinuitySheetRecording(createdDate: "0712", rollNumber: "A002", fileNumber: "C001", sceneNumber: 13, shotNumber: 4, takeNumber: 1, result: .ok, synopsis: "忽出鲁查杀铁木真", shotSize:ShotSize.mls),ContinuitySheetRecording(createdDate: "0712", rollNumber: "A002", fileNumber: "C001", sceneNumber: 13, shotNumber: 4, takeNumber: 1, result: .ok, synopsis: "忽出鲁查杀铁木真", shotSize:ShotSize.mls),ContinuitySheetRecording(createdDate: "0712", rollNumber: "A002", fileNumber: "C001", sceneNumber: 13, shotNumber: 4, takeNumber: 1, result: .ok, synopsis: "忽出鲁查杀铁木真", shotSize:ShotSize.mls),ContinuitySheetRecording(createdDate: "0712", rollNumber: "A002", fileNumber: "C001", sceneNumber: 13, shotNumber: 4, takeNumber: 1, result: .ok, synopsis: "忽出鲁查杀铁木真", shotSize:ShotSize.mls),ContinuitySheetRecording(createdDate: "0712", rollNumber: "A002", fileNumber: "C001", sceneNumber: 13, shotNumber: 4, takeNumber: 1, result: .ok, synopsis: "忽出鲁查杀铁木真", shotSize:ShotSize.mls),ContinuitySheetRecording(createdDate: "0712", rollNumber: "A002", fileNumber: "C001", sceneNumber: 13, shotNumber: 4, takeNumber: 1, result: .ok, synopsis: "忽出鲁查杀铁木真", shotSize:ShotSize.mls),ContinuitySheetRecording(createdDate: "0712", rollNumber: "A002", fileNumber: "C001", sceneNumber: 13, shotNumber: 4, takeNumber: 1, result: .ok, synopsis: "忽出鲁查杀铁木真", shotSize:ShotSize.mls),ContinuitySheetRecording(createdDate: "0712", rollNumber: "A002", fileNumber: "C001", sceneNumber: 13, shotNumber: 4, takeNumber: 1, result: .ok, synopsis: "忽出鲁查杀铁木真", shotSize:ShotSize.mls),ContinuitySheetRecording(createdDate: "0712", rollNumber: "A002", fileNumber: "C001", sceneNumber: 13, shotNumber: 4, takeNumber: 1, result: .ok, synopsis: "忽出鲁查杀铁木真", shotSize:ShotSize.mls),ContinuitySheetRecording(createdDate: "0712", rollNumber: "A002", fileNumber: "C001", sceneNumber: 13, shotNumber: 4, takeNumber: 1, result: .ok, synopsis: "忽出鲁查杀铁木真", shotSize:ShotSize.mls),ContinuitySheetRecording(createdDate: "0712", rollNumber: "A002", fileNumber: "C001", sceneNumber: 13, shotNumber: 4, takeNumber: 1, result: .ok, synopsis: "忽出鲁查杀铁木真", shotSize:ShotSize.mls),ContinuitySheetRecording(createdDate: "0712", rollNumber: "A002", fileNumber: "C001", sceneNumber: 13, shotNumber: 4, takeNumber: 1, result: .ok, synopsis: "忽出鲁查杀铁木真", shotSize:ShotSize.mls),ContinuitySheetRecording(createdDate: "0712", rollNumber: "A002", fileNumber: "C001", sceneNumber: 13, shotNumber: 4, takeNumber: 1, result: .ok, synopsis: "忽出鲁查杀铁木真", shotSize:ShotSize.mls),ContinuitySheetRecording(createdDate: "0712", rollNumber: "A002", fileNumber: "C001", sceneNumber: 13, shotNumber: 4, takeNumber: 1, result: .ok, synopsis: "忽出鲁查杀铁木真", shotSize:ShotSize.mls),ContinuitySheetRecording(createdDate: "0712", rollNumber: "A002", fileNumber: "C001", sceneNumber: 13, shotNumber: 4, takeNumber: 1, result: .ok, synopsis: "忽出鲁查杀铁木真", shotSize:ShotSize.mls),
        ContinuitySheetRecording(createdDate: "0712", rollNumber: "A004", fileNumber: "C002", sceneNumber: 13, shotNumber: 5, takeNumber: 7, result: .ok, synopsis: "忽出鲁查杀铁木真", shotSize:ShotSize.mls)],
    "0713" :[ContinuitySheetRecording(createdDate:"0713",rollNumber: "A004", fileNumber: "C011", sceneNumber: 4, shotNumber: 1, takeNumber: 1, result: .ng, synopsis: "忽出鲁与铁木真交战",shotSize:.mcu)]
]

