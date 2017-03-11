//
//  TempoarlDatabase_AboutCharacter.swift
//  VistaBridge
//
//  Created by 齐晴 on 16/10/23.
//  Copyright © 2016年 GaryQi. All rights reserved.
//

import Foundation
import UIKit

//每个演员的信息
struct Character {
    let ID : Int
    let name : String
    let acronym : String?    //角色的简称
    let makeups : [MakeUpInfo]?
    let wardrobes : [WardrobeInfo]
    let color : UIColor?
}

struct Cast {
    let castID : Int
    let characterID : Int
    let name : String
}

struct CastScheduleCell {
    let castID : Int
    var availableDates : [String]
}

var CastSchedule =
[
    CastScheduleCell(castID: 201, availableDates: [
        "7月1日","7月2日","7月3日","7月4日","7月5日","7月6日","7月7日","7月8日","7月9日","7月10日","7月11日","7月12日","7月13日","7月14日","7月17日","7月18日","7月19日","7月20日","7月21日","7月22日","7月23日","7月24日","7月25日","7月26日","7月27日","7月28日","7月29日","7月30日","8月1日","8月2日","8月3日","8月4日","8月5日","8月8日","8月9日","8月10日","8月11日","8月12日","8月13日","8月14日","8月15日","8月16日","8月17日","8月18日","8月19日","8月20日","8月21日","8月26日","8月27日","8月28日"
        ]),
    CastScheduleCell(castID: 202, availableDates: [
        "7月1日","7月2日","7月3日","7月4日","7月5日","7月9日","7月10日","7月11日","7月12日","7月13日","7月14日","7月20日","7月21日","7月22日","7月23日","7月24日","7月25日","7月26日","7月27日","7月28日","7月29日","7月30日","7月31日","8月1日","8月2日","8月3日","8月4日","8月5日","8月6日","8月7日","8月8日","8月9日","8月10日","8月11日","8月12日","8月13日","8月14日","8月15日","8月16日","8月17日","8月18日","8月19日","8月22日","8月23日","8月24日","8月25日","8月26日","8月27日","8月28日","8月29日","8月30日","8月31日",
        ]),
    CastScheduleCell(castID: 203, availableDates: [
        "7月1日","7月2日","7月3日","7月4日","7月5日","7月6日","7月9日","7月10日","7月11日","7月12日","7月13日","7月14日","7月15日","7月16日","7月17日","7月18日","7月19日","7月20日","7月21日","7月22日","7月23日","7月24日","7月25日","7月26日","7月27日","7月28日","7月29日","7月30日","7月31日","8月1日","8月2日","8月3日","8月4日","8月5日","8月6日","8月7日","8月8日","8月9日","8月10日","8月11日","8月12日","8月13日","8月14日",
        ]),
    CastScheduleCell(castID: 204, availableDates: [
        "7月1日","7月2日","7月7日","7月8日","7月9日","7月10日","7月11日","7月12日","7月13日","7月14日","7月15日","7月16日","7月17日","7月18日","7月19日","7月20日","7月24日","7月25日","7月26日","7月27日","7月28日","7月29日","7月30日","7月31日","8月1日","8月2日","8月3日","8月4日","8月8日","8月9日","8月10日","8月11日","8月12日","8月13日","8月14日","8月18日","8月19日","8月20日","8月21日","8月22日","8月23日","8月24日","8月25日","8月26日","8月27日","8月31日",
        ]),
    CastScheduleCell(castID: 205, availableDates: [
        "7月1日","7月2日","7月3日","7月4日","7月10日","7月11日","7月12日","7月13日","7月14日","7月15日","7月16日","7月17日","7月18日","7月19日","8月1日","8月2日","8月3日","8月4日","8月5日","8月6日","8月7日","8月8日","8月9日","8月10日","8月11日","8月12日","8月13日","8月14日","8月15日","8月16日","8月17日","8月18日","8月19日","8月23日","8月24日","8月25日","8月26日","8月27日","8月28日","8月29日","8月30日","8月31日",
        ]),
    CastScheduleCell(castID: 206, availableDates: [
        "7月1日","7月2日","7月3日","7月4日","7月5日","7月6日","7月7日","7月8日","7月9日","7月10日","7月14日","7月15日","7月16日","7月17日","7月18日","7月19日","7月20日","7月21日","7月22日","7月23日","7月24日","7月30日","7月31日","8月1日","8月2日","8月3日","8月4日","8月5日","8月6日","8月7日","8月8日","8月9日","8月10日","8月11日","8月12日","8月15日","8月16日","8月17日","8月18日","8月19日","8月20日","8月21日","8月22日","8月23日","8月24日","8月28日","8月29日","8月30日","8月31日",
        ]),
    CastScheduleCell(castID: 207, availableDates: [
         "7月1日","7月2日","7月3日","7月4日","7月5日","7月6日","7月7日","7月8日","7月9日","7月10日","7月11日","7月12日","7月13日","7月14日","7月15日","7月16日","7月17日","7月18日","7月19日","7月20日","7月21日","7月22日","7月23日","7月24日","7月25日","7月26日","7月27日","7月28日","7月29日","7月30日","7月31日","8月1日","8月2日","8月3日","8月4日","8月5日","8月6日","8月7日","8月8日","8月9日","8月10日","8月11日","8月12日","8月13日","8月14日","8月15日","8月16日","8月17日","8月18日","8月19日","8月20日","8月21日","8月22日","8月23日","8月24日","8月25日","8月26日","8月27日","8月28日","8月29日","8月30日","8月31日",
        ]),
    CastScheduleCell(castID: 208, availableDates: [
        "7月4日","7月5日","7月10日","7月11日","7月12日","7月13日","7月14日","7月15日","7月16日","7月17日","7月18日","7月19日","7月20日","7月21日","7月22日","7月23日","7月27日","7月28日","7月29日","7月30日","8月3日","8月4日","8月5日","8月6日","8月7日","8月8日","8月9日","8月10日","8月14日","8月15日","8月16日","8月17日","8月18日","8月19日","8月20日","8月21日","8月22日","8月23日","8月26日","8月27日","8月28日","8月31日",
        ]),
    CastScheduleCell(castID: 209, availableDates: [
        "7月1日","7月2日","7月3日","7月8日","7月9日","7月10日","7月11日","7月19日","7月20日","7月21日","7月22日","7月23日","7月24日","7月25日","7月26日","7月27日","7月28日","7月29日","7月30日","7月31日","8月4日","8月5日","8月6日","8月7日","8月10日","8月11日","8月14日","8月15日","8月16日","8月17日","8月18日","8月19日","8月20日","8月21日","8月22日","8月23日","8月24日","8月28日","8月29日","8月30日","8月31日",
        ]),
    CastScheduleCell(castID: 210, availableDates: [
        "7月1日","7月2日","7月3日","7月4日","7月5日","7月6日","7月10日","7月11日","7月12日","7月13日","7月14日","7月19日","7月20日","7月21日","7月26日","7月27日","7月28日","7月29日","7月30日","7月31日","8月1日","8月2日","8月3日","8月4日","8月17日","8月18日","8月19日","8月20日","8月21日","8月22日","8月23日","8月24日","8月25日","8月26日","8月27日","8月28日","8月29日","8月30日","8月31日",
        ]),
    CastScheduleCell(castID: 211, availableDates: [
        "7月1日","7月2日","7月3日","7月8日","7月9日","7月10日","7月11日","7月12日","7月13日","7月14日","7月15日","7月16日","7月17日","7月20日","7月21日","7月25日","7月29日","7月30日","7月31日","8月1日","8月2日","8月3日","8月4日","8月5日","8月6日","8月7日","8月8日","8月9日","8月10日","8月11日","8月16日","8月17日","8月18日","8月19日","8月20日","8月21日","8月22日","8月25日","8月26日","8月27日","8月31日",
        ]),
    CastScheduleCell(castID: 212, availableDates: [
        "7月1日","7月2日","7月3日","7月4日","7月5日","7月10日","7月11日","7月12日","7月13日","7月14日","7月15日","7月16日","7月17日","7月18日","7月19日","7月20日","7月24日","7月25日","7月26日","7月27日","7月28日","7月29日","8月2日","8月3日","8月4日","8月5日","8月6日","8月7日","8月8日","8月12日","8月13日","8月18日","8月19日","8月20日","8月21日","8月22日","8月25日","8月30日","8月31日",
        ]),
    CastScheduleCell(castID: 213, availableDates: [
        "7月3日","7月7日","7月8日","7月9日","7月10日","7月11日","7月12日","7月13日","7月14日","7月15日","7月16日","7月17日","7月21日","7月22日","7月23日","7月29日","7月30日","7月31日","8月1日","8月2日","8月3日","8月4日","8月5日","8月6日","8月7日","8月8日","8月9日","8月10日","8月11日","8月12日","8月13日","8月14日","8月15日","8月16日","8月17日","8月18日","8月19日","8月20日","8月21日","8月22日","8月23日","8月24日","8月25日","8月26日","8月27日","8月28日","8月29日","8月30日","8月31日",
        ]),
    CastScheduleCell(castID: 214, availableDates: [
        "7月1日","7月2日","7月3日","7月4日","7月5日","7月6日","7月7日","7月8日","7月9日","7月10日","7月14日","7月15日","7月16日","7月17日","7月18日","7月19日","7月20日","7月21日","7月22日","7月23日","7月24日","7月25日","7月26日","7月27日","7月28日","7月29日","7月30日","7月31日","8月1日","8月2日","8月3日","8月4日","8月10日","8月11日","8月12日","8月13日","8月16日","8月17日","8月18日","8月19日","8月20日","8月21日","8月22日","8月23日","8月24日","8月25日","8月29日"
        ]),
    CastScheduleCell(castID: 215, availableDates: [
        "7月1日","7月2日","7月3日","7月4日","7月5日","7月6日","7月7日","7月8日","7月9日","7月10日","7月11日","7月12日","7月13日","7月14日","7月15日","7月16日","7月17日","7月18日","7月19日","7月20日","7月21日","7月22日","7月23日","7月24日","7月25日","7月26日","7月27日","7月28日","7月29日","7月30日","7月31日","8月1日","8月2日","8月3日","8月4日","8月5日","8月6日","8月7日","8月8日","8月9日","8月10日","8月11日","8月12日","8月13日","8月14日","8月15日","8月16日","8月17日","8月18日","8月19日","8月20日","8月21日","8月22日","8月23日","8月24日","8月25日","8月26日","8月27日","8月28日","8月29日","8月30日","8月31日",
        ]),
    CastScheduleCell(castID: 216, availableDates: [
        "7月1日","7月2日","7月3日","7月4日","7月5日","7月6日","7月7日","7月8日","7月9日","7月10日","7月11日","7月12日","7月13日","7月14日","7月15日","7月16日","7月17日","7月18日","7月19日","7月20日","7月21日","7月22日","7月23日","7月24日","7月25日","7月26日","7月27日","7月28日","7月29日","7月30日","7月31日","8月1日","8月2日","8月3日","8月4日","8月5日","8月6日","8月7日","8月8日","8月9日","8月10日","8月11日","8月12日","8月13日","8月14日","8月15日","8月16日","8月17日","8月18日","8月19日","8月20日","8月21日","8月22日","8月23日","8月24日","8月25日","8月26日","8月27日","8月28日","8月29日","8月30日","8月31日",
        ]),
    CastScheduleCell(castID: 217, availableDates: [
        "7月1日","7月5日","7月6日","7月7日","7月8日","7月9日","7月10日","7月11日","7月12日","7月13日","7月14日","7月15日","7月16日","7月17日","7月18日","7月19日","7月20日","7月21日","7月22日","7月23日","7月24日","7月29日","7月30日","7月31日","8月1日","8月2日","8月3日","8月4日","8月5日","8月6日","8月7日","8月8日","8月9日","8月10日","8月11日","8月12日","8月13日","8月14日","8月15日","8月16日","8月17日","8月18日","8月19日","8月23日","8月24日","8月25日","8月26日","8月27日","8月28日","8月29日","8月30日","8月31日",
        ]),
    CastScheduleCell(castID: 218, availableDates: [
        "7月1日","7月2日","7月3日","7月4日","7月5日","7月6日","7月7日","7月8日","7月9日","7月10日","7月11日","7月12日","7月13日","7月14日","7月15日","7月16日","7月17日","7月18日","7月19日","7月20日","7月21日","7月22日","7月23日","7月24日","7月25日","7月26日","7月27日","7月28日","7月29日","7月30日","7月31日","8月1日","8月2日","8月3日","8月4日","8月5日","8月6日","8月7日","8月8日","8月9日","8月10日","8月11日","8月12日","8月13日","8月14日","8月15日","8月16日","8月17日","8月18日","8月19日","8月20日","8月21日","8月22日","8月23日","8月24日","8月25日","8月26日","8月27日","8月28日","8月29日","8月30日","8月31日",
        ]),
    CastScheduleCell(castID: 219, availableDates: [
        "7月1日","7月2日","7月3日","7月4日","7月5日","7月6日","7月7日","7月8日","7月9日","7月10日","7月11日","7月12日","7月13日","7月14日","7月19日","7月20日","7月21日","7月22日","7月23日","7月24日","7月25日","7月26日","7月27日","7月28日","7月29日","7月30日","7月31日","8月1日","8月2日","8月3日","8月4日","8月5日","8月6日","8月7日","8月8日","8月9日","8月13日","8月14日","8月15日","8月16日","8月17日","8月18日","8月19日","8月20日","8月21日","8月22日","8月23日","8月24日","8月25日","8月26日","8月27日","8月28日","8月29日","8月30日","8月31日",
        ]),
    CastScheduleCell(castID: 220, availableDates: [
        "7月1日","7月2日","7月3日","7月4日","7月5日","7月6日","7月7日","7月8日","7月9日","7月10日","7月11日","7月12日","7月13日","7月14日","7月15日","7月16日","7月17日","7月18日","7月19日","7月20日","7月21日","7月22日","7月23日","7月24日","7月25日","7月26日","7月27日","7月28日","7月29日","7月30日","7月31日","8月1日","8月2日","8月3日","8月4日","8月5日","8月6日","8月7日","8月8日","8月9日","8月10日","8月11日","8月12日","8月13日","8月14日","8月15日","8月16日","8月17日","8月18日","8月19日","8月20日","8月21日","8月22日","8月23日","8月24日","8月25日","8月26日","8月27日","8月28日","8月29日","8月30日","8月31日",
        ]),
    CastScheduleCell(castID: 221, availableDates: [
        "7月1日","7月2日","7月3日","7月4日","7月5日","7月6日","7月7日","7月8日","7月9日","7月10日","7月11日","7月12日","7月13日","7月14日","7月15日","7月16日","7月17日","7月18日","7月19日","7月20日","7月21日","7月22日","7月23日","7月24日","7月25日","7月26日","7月27日","7月28日","7月29日","7月30日","7月31日","8月1日","8月2日","8月3日","8月4日","8月5日","8月6日","8月7日","8月8日","8月9日","8月10日","8月11日","8月12日","8月13日","8月14日","8月15日","8月16日","8月17日","8月18日","8月19日","8月20日","8月21日","8月22日","8月23日","8月24日","8月25日","8月26日","8月27日","8月28日","8月29日","8月30日","8月31日",
        ]),
    CastScheduleCell(castID: 222, availableDates: [
        "7月1日","7月2日","7月3日","7月4日","7月5日","7月6日","7月7日","7月8日","7月9日","7月10日","7月11日","7月12日","7月13日","7月14日","7月15日","7月16日","7月17日","7月18日","7月19日","7月20日","7月21日","7月22日","7月23日","7月24日","7月25日","7月26日","7月27日","7月28日","7月29日","7月30日","7月31日","8月1日","8月2日","8月3日","8月4日","8月5日","8月6日","8月7日","8月8日","8月9日","8月10日","8月11日","8月12日","8月13日","8月14日","8月15日","8月16日","8月17日","8月18日","8月19日","8月20日","8月21日","8月22日","8月23日","8月24日","8月25日","8月26日","8月27日","8月28日","8月29日","8月30日","8月31日",
        ])
]

let CAST = [
    Cast(castID: 201, characterID: 101, name: "胡军"),
    Cast(castID: 202, characterID: 102, name: "陈伟霆"),
    Cast(castID: 203, characterID: 103, name: "宝音"),
    Cast(castID: 204, characterID: 104, name: "思漩"),
    Cast(castID: 205, characterID: 105, name: "陈伟霆"),
    Cast(castID: 206, characterID: 106, name: "倪大红"),
    Cast(castID: 207, characterID: 107, name: "巴音"),
    Cast(castID: 208, characterID: 108, name: "咏梅"),
    Cast(castID: 209, characterID: 109, name: "赵立新"),
    Cast(castID: 210, characterID: 110, name: "张歆艺"),
    Cast(castID: 211, characterID: 111, name: "卢待曦"),
    Cast(castID: 212, characterID: 112, name: "欧阳兰兰"),
    Cast(castID: 213, characterID: 113, name: "张子浩"),
    Cast(castID: 214, characterID: 114, name: "巴森扎布"),
    Cast(castID: 215, characterID: 115, name: "代强"),
    Cast(castID: 216, characterID: 116, name: "李新源"),
    Cast(castID: 217, characterID: 117, name: "包宇"),
    Cast(castID: 218, characterID: 118, name: "韩承羽"),
    Cast(castID: 219, characterID: 119, name: "姜宝成"),
    Cast(castID: 220, characterID: 120, name: "法拉吉"),
    Cast(castID: 221, characterID: 121, name: "白古斯楞"),
    Cast(castID: 222, characterID: 122, name: "林允"),
]

let characters =
[
    Character(ID: 101, name: "忽出鲁", acronym: "忽" , makeups:[
        MakeUpInfo(makeupID: 1, duration: 90, name: "魔王1号妆"),
        MakeUpInfo(makeupID: 2, duration: 100, name: "魔王2号怒妆"),
        MakeUpInfo(makeupID: 3, duration: 120, name: "3号游牧妆"),
        ], wardrobes:[
            WardrobeInfo(wardrobeID: 1, dreesingTime: 30, name: "魔王1号装"),
            WardrobeInfo(wardrobeID: 2, dreesingTime: 30, name: "魔王2号装"),
            WardrobeInfo(wardrobeID: 3, dreesingTime: 30, name: "3号游牧装")
        ],color : UIColor.init(red: 161/255, green: 47/255, blue: 47/255, alpha: 1)),
    
    Character(ID: 102, name: "铁木真", acronym: "铁" , makeups:[
        MakeUpInfo(makeupID: 4, duration: 100, name: "铁木真1号妆"),
        MakeUpInfo(makeupID: 5, duration: 100, name: "铁婚礼2号妆"),
        ], wardrobes:[
            WardrobeInfo(wardrobeID: 4, dreesingTime: 30, name: "铁木真1号妆"),
            WardrobeInfo(wardrobeID: 5, dreesingTime: 30, name: "铁婚礼2号妆"),
            ],color : UIColor.init(red: 0/255, green: 90/255, blue: 171/255, alpha: 1)),
    Character(ID: 103, name: "博尔术", acronym: "博", makeups:[
        MakeUpInfo(makeupID: 6, duration: 100, name: "博尔术1号妆")
        ], wardrobes:[
            WardrobeInfo(wardrobeID: 6, dreesingTime: 30, name: "博尔术1号妆"),
            ],color:UIColor.init(red: 107/255, green: 194/255, blue: 53/255, alpha: 1)),
    Character(ID: 104, name: "哈娃", acronym: "娃", makeups:[
        MakeUpInfo(makeupID: 7, duration: 180, name: "哈娃1号妆")
        ], wardrobes:[
            WardrobeInfo(wardrobeID: 7, dreesingTime: 30, name: "哈娃1号妆")
        ],color:UIColor.init(red: 90/255, green: 13/255, blue: 67/255, alpha: 1)),
    Character(ID: 105, name: "战神赤那", acronym: "战", makeups: [MakeUpInfo(makeupID: 8, duration:180, name: "战神赤那1号妆")],wardrobes:[WardrobeInfo(wardrobeID: 8, dreesingTime: 30, name: "战神赤那1号妆")],color:UIColor.init(red: 1/255, green: 77/255, blue: 103/255, alpha: 1)),
    Character(ID: 106, name: "萨满", acronym: "萨", makeups: [MakeUpInfo(makeupID: 9, duration:180, name: "萨满1号妆")],wardrobes:[WardrobeInfo(wardrobeID: 9, dreesingTime: 30, name: "萨满1号妆")],color:UIColor.init(red: 17/255, green: 63/255, blue: 61/255, alpha: 1)),
    Character(ID: 107, name: "也速亥", acronym: "也", makeups: [MakeUpInfo(makeupID: 10, duration:100, name: "也速亥1号妆")],wardrobes:[WardrobeInfo(wardrobeID: 10, dreesingTime: 30, name: "也速亥1号妆")],color:UIColor.init(red: 161/255, green: 23/255, blue: 21/255, alpha: 1)),
    Character(ID: 108, name: "诃额伦", acronym: "诃", makeups: [MakeUpInfo(makeupID: 11, duration:100, name: "诃额伦1号妆")],wardrobes:[WardrobeInfo(wardrobeID: 11, dreesingTime: 30, name: "诃额伦1号妆")],color:UIColor.init(red: 217/255, green: 104/255, blue: 49/255, alpha: 1)),
    Character(ID: 109, name: "塔里忽台", acronym: "塔", makeups: [MakeUpInfo(makeupID: 12, duration:100, name: "塔里忽台1号妆")],wardrobes:[WardrobeInfo(wardrobeID: 12, dreesingTime: 30, name: "塔里忽台1号妆")],color:UIColor.init(red: 78/255, green: 29/255, blue: 76/255, alpha: 1)),
    Character(ID: 110, name: "朵歹", acronym: "朵", makeups: [MakeUpInfo(makeupID: 13, duration:120, name: "朵歹1号妆")],wardrobes:[WardrobeInfo(wardrobeID: 13, dreesingTime: 30, name: "朵歹1号妆")],color:UIColor.init(red: 38/255, green: 188/255, blue: 213/255, alpha: 1)),
    Character(ID: 111, name: "少年铁木真", acronym: "真", makeups: [MakeUpInfo(makeupID: 14, duration:60, name: "少年铁木真1号妆")],wardrobes:[WardrobeInfo(wardrobeID: 14, dreesingTime: 30, name: "少年铁木真1号妆")],color:UIColor.init(red: 255/255, green: 150/255, blue: 128/255, alpha: 1)),
    Character(ID: 112, name: "少年孛尔帖", acronym: "帖", makeups: [MakeUpInfo(makeupID: 15, duration:60, name: "少年孛尔帖1号妆")],wardrobes:[WardrobeInfo(wardrobeID: 15, dreesingTime: 30, name: "少年孛尔帖1号妆")],color:UIColor.init(red: 0/255, green: 34/255, blue: 40/255, alpha: 1)),
    Character(ID: 113, name: "少年哈尔库", acronym: "哈", makeups: [MakeUpInfo(makeupID: 16, duration:60, name: "少年哈尔库1号妆")],wardrobes:[WardrobeInfo(wardrobeID: 16, dreesingTime: 30, name: "少年哈尔库1号妆")],color:UIColor.init(red: 158/255, green: 157/255, blue: 131/255, alpha: 1)),
    Character(ID: 114, name: "特薛禅", acronym: "特", makeups: [MakeUpInfo(makeupID: 17, duration:60, name: "特薛禅1号妆")],wardrobes:[WardrobeInfo(wardrobeID: 17, dreesingTime: 30, name: "特薛禅1号妆")],color:UIColor.init(red: 85/255, green: 72/255, blue: 64/255, alpha: 1)),
    Character(ID: 115, name: "少年哈撒尔", acronym: "尔", makeups: [MakeUpInfo(makeupID: 18, duration:60, name: "少年哈撒尔1号妆")],wardrobes:[WardrobeInfo(wardrobeID: 18, dreesingTime: 30, name: "少年哈撒尔1号妆")],color:UIColor.init(red: 18/255, green: 53/255, blue: 65/255, alpha: 1)),
    Character(ID: 116, name: "少年别勒古台", acronym: "台", makeups: [MakeUpInfo(makeupID: 19, duration:60, name: "少年别勒古台1号妆")],wardrobes:[WardrobeInfo(wardrobeID: 19, dreesingTime: 30, name: "少年别勒古台1号妆")],color:UIColor.init(red: 118/255, green: 77/255, blue: 57/255, alpha: 1)),
    Character(ID: 117, name: "哈撒尔", acronym: "撒", makeups: [MakeUpInfo(makeupID: 20, duration:90, name: "哈撒尔1号妆")],wardrobes:[WardrobeInfo(wardrobeID: 20, dreesingTime: 30, name: "哈撒尔1号妆")],color:UIColor.init(red: 20/255, green: 68/255, blue: 106/255, alpha: 1)),
    Character(ID: 118, name: "别勒古台", acronym: "别", makeups: [MakeUpInfo(makeupID: 21, duration:90, name: "别勒古台1号妆")],wardrobes:[WardrobeInfo(wardrobeID: 21, dreesingTime: 30, name: "别勒古台1号妆")],color:UIColor.init(red: 38/255, green: 157/255, blue: 128/255, alpha: 1)),
    Character(ID: 119, name: "黑秃黑", acronym: "黑", makeups: [MakeUpInfo(makeupID: 22, duration:240, name: "黑秃黑1号妆")],wardrobes:[WardrobeInfo(wardrobeID: 22, dreesingTime: 30, name: "黑秃黑1号妆")],color:UIColor.init(red: 3/255, green: 101/255, blue: 100/255, alpha: 1)),
    Character(ID: 120, name: "扎乌", acronym: "黑", makeups: [MakeUpInfo(makeupID: 23, duration:180, name: "扎乌1号妆")],wardrobes:[WardrobeInfo(wardrobeID: 23, dreesingTime: 30, name: "扎乌1号妆")],color:UIColor.init(red: 175/255, green: 18/255, blue: 88/255, alpha: 1)),
    Character(ID: 121, name: "哈尔库", acronym: "库", makeups: [MakeUpInfo(makeupID: 24, duration:100, name: "哈尔库1号妆")],wardrobes:[WardrobeInfo(wardrobeID: 24, dreesingTime: 30, name: "哈尔库1号妆")],color:UIColor.init(red: 250/255, green: 179/255, blue: 61/255, alpha: 1)),
    Character(ID: 121, name: "孛尔帖", acronym: "孛", makeups: [MakeUpInfo(makeupID: 25, duration:100, name: "孛尔帖1号妆")],wardrobes:[WardrobeInfo(wardrobeID: 25, dreesingTime: 30, name: "孛尔帖1号妆")],color:UIColor.init(red: 222/255, green: 125/255, blue: 44/255, alpha: 1))
]


/*

以下是，在数据库中要表达的，角色与其服装化妆信息之间的一对多关系所要补充的表格

//每个演员的妆扮信息
struct CharacterMakeup {
let characterID : Int   //演员ID
let makeupID : Int  //妆容ID
}

//每个演员的服装信息
struct  CharacterWardrobe {
let characterID : Int
let wardrobeID : Int
}
*/

//妆扮信息结构体
struct MakeUpInfo {
    let makeupID : Int
    let duration : Int   // 化妆所需时间,单位是分钟
    let name : String //妆扮名称
}

//服装信息结构体
struct WardrobeInfo {
    let wardrobeID : Int
    let dreesingTime : Int  // 更换衣服的时间，单位是 分钟
    let name : String   // 服装名称
}



let backgroundActors =
[
    Character(ID: 701, name: "魔兵", acronym: nil, makeups: nil, wardrobes: [WardrobeInfo(wardrobeID: 8, dreesingTime: 30, name: "魔兵服")],color:nil),
    Character(ID: 702, name: "草原联军", acronym: nil, makeups: [MakeUpInfo(makeupID: 9, duration: 60, name: "草原联军妆")], wardrobes: [WardrobeInfo(wardrobeID: 9, dreesingTime: 30, name: "草原联军服")],color:nil),
]

let ACTORS = [
    "铁木真",
    "孛尔帖",
    "博尔术",
    "忽出鲁",
    "扎木合",
    "塔里忽台",
    "朵歹",
    "萨满",
    "特薛禅",
    "扎乌",
    "哈娃",
    "黑秃黑",
    "哈尔库",
    "也速亥",
    "冥王",
    "战神赤那",
    "诃额伦",
    "哈撒尔",
    "别勒古台",
    "胡伯颜",
    "莫干",
    "阿如汗",
    "阿吉泰",
    "布森",
]
