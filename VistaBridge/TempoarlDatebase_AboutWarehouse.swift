//
//  Tempoar;Datebase_AboutWarehouse.swift
//  VistaBridge
//
//  Created by 齐晴 on 16/12/31.
//  Copyright © 2016年 GaryQi. All rights reserved.
//

import Foundation

struct Set {
    let ID : Int
    let name : String
    let completionDate : String?
    let images : [String]
}

struct Costume {
    let ID : Int
    let name : String
    let sum : Int
    let images : [String]
}

struct Prop {
    let ID : Int
    let name : String
    let sum : Int
    let images : [String]
}

let sets = [
    Set(ID: 3501, name: "盐堡大殿", completionDate: "2016-07-10",images: ["盐堡大殿","不儿罕山顶","乞颜部","翁吉喇部","草原集市"]),
    Set(ID: 3502, name: "不儿罕山顶", completionDate: "2016-08-10",images: ["不儿罕山顶"]),
    Set(ID: 3503, name: "乞颜部", completionDate: "2016-07-18",images: ["乞颜部"]),
    Set(ID: 3504, name: "翁吉喇部", completionDate: "2016-07-30",images: ["翁吉喇部"]),
    Set(ID: 3505, name: "河边毡包", completionDate: "2016-08-17",images: ["河边毡包"]),
    Set(ID: 3506, name: "盐堡城门", completionDate: "2016-07-20",images: ["盐堡城门","盐堡大殿","不儿罕山顶","乞颜部","翁吉喇部","草原集市"]),
    Set(ID: 3507, name: "草原集市", completionDate: "2016-06-10",images: ["草原集市"]),
    Set(ID: 3508, name: "盐堡采石场", completionDate: "2016-08-20",images: ["盐堡采石场"]),
    Set(ID: 3509, name: "盐堡堤坝", completionDate: "2016-07-03",images: ["盐堡堤坝"]),
    Set(ID: 3510, name: "万丈岩坑", completionDate: nil,images: ["万丈岩坑"]),
    Set(ID: 3511, name: "山涧河边", completionDate: "2016-08-08",images: ["山涧河边"]),
    Set(ID: 3512, name: "草原敖包", completionDate: nil,images: ["草原敖包"]),
]

let costumes = [
    Costume(ID: 3601, name: "铁木真部落装", sum: 2,images: ["铁木真部落装"]),
    Costume(ID: 3602, name: "铁木真结婚装", sum: 2,images: ["铁木真结婚装"]),
    Costume(ID: 3603, name: "博尔术部落装", sum: 2,images: ["博尔术部落装"]),
    Costume(ID: 3604, name: "孛尔帖部落装", sum: 2,images: ["孛尔帖部落装"]),
    Costume(ID: 3605, name: "孛尔帖结婚装", sum: 2,images: ["孛尔帖结婚装"]),
    Costume(ID: 3606, name: "忽出鲁生前装", sum: 2,images: ["忽出鲁生前装"]),
    Costume(ID: 3607, name: "忽出鲁阎魔装", sum: 2,images: ["忽出鲁阎魔装"]),
    Costume(ID: 3608, name: "萨满树皮妆", sum: 2,images: ["萨满树装"]),
    Costume(ID: 3609, name: "萨满集市装", sum: 2,images: ["萨满集市装"]),
    Costume(ID: 3610, name: "扎木合部落装", sum: 2,images: ["扎木合部落装"]),
    Costume(ID: 3611, name: "塔里忽台部落装", sum: 2,images: ["塔里忽台部落装"]),
    Costume(ID: 3612, name: "特薛蝉部落装", sum: 2,images: ["特薛蝉部落装"]),
    Costume(ID: 3613, name: "扎乌盐堡装", sum: 2,images: ["扎乌盐堡装"]),
    Costume(ID: 3614, name: "哈娃盐堡装", sum: 2,images: ["哈娃盐堡装"]),
    Costume(ID: 3615, name: "朵歹生前装", sum: 2,images: ["朵歹部落装"]),
    Costume(ID: 3616, name: "黑秃黑盐堡装", sum: 2,images: ["黑秃黑盐堡装"]),
    Costume(ID: 3617, name: "也速亥部落装", sum: 2,images: ["也速亥"]),
    Costume(ID: 3618, name: "诃额伦部落装", sum: 2,images: ["诃额伦部落装"]),
    Costume(ID: 3619, name: "草原联军装", sum: 40,images: ["草原联军"]),
    Costume(ID: 3620, name: "魔兵装", sum: 50,images: ["魔兵服"]),
    Costume(ID: 3621, name: "蒙古袍", sum: 20,images: ["蒙古袍"]),
]

let props = [
    Prop(ID: 3701, name: "苏勒定（大）", sum: 2,images: ["苏勒定"]),
    Prop(ID: 3702, name: "魔兵武器", sum: 60,images: ["魔兵武器"]),
    Prop(ID: 3703, name: "草原联军武器", sum: 40,images: ["草原联军武器"]),
    Prop(ID: 3704, name: "孛尔帖衣服一角", sum: 4,images: ["孛尔帖部落装"]),
    Prop(ID: 3705, name: "铁木真－包袱", sum: 2,images: ["铁木真包袱"]),
    Prop(ID: 3706, name: "也速亥－金刀", sum: 2,images: ["也速亥金刀"]),
    Prop(ID: 3707, name: "锅炉", sum: 5,images: ["锅炉"]),
    Prop(ID: 3708, name: "大旗", sum: 10,images: ["大旗"]),
    Prop(ID: 3709, name: "鼓", sum: 5,images: ["鼓"]),
    
]