//
//  TempoarlDatabase_AboutScene.swift
//  VistaBridge
//
//  Created by 齐晴 on 16/10/23.
//  Copyright © 2016年 GaryQi. All rights reserved.
//

import Foundation

//每场次戏的基本信息
struct SceneInfo {
    var sceneNo : SceneNo   //场次号
    var atmosphere : ATMOSPHERE? //气氛
    var pages : Double?  //页数
    var sceneName : String? //场景名
    var characters : [Character]?   //该场次涉及的演员
    var backgroundActors : [BackgroundActor]?   //该场次涉及的群演
    var synopsis : String   //概要
    var remark : String?    //备注
    var locationID : Int  //拍摄地
}

//主要演员关于场次的信息
struct CharacterInfosAboutScene {
    let characterID : Int
    let sceneNo : Int
    let characterMakeupID : Int
    let characterWardrobeID : Int
}

//群众演员关于场次的信息
struct BackgroundcharacterInfosAboutScene {
    let backgroundCharacterID : Int
    let sceneNo : Int
    let number : Int
}

//道具关于场次的信息
struct PropsAboutScene {
    let propsID : Int
    let sceneNo : Int
    let number : Int
}

//拍摄器械关于场次的信息
struct EquipmentInfosAboutScene {
    let equipmentID : Int
    let sceneNo : Int
    let number : Int
}

////场景与拍摄地之间的从属关系
//struct LocationInfosAboutScene {
//    let sceneID : Int
//    let locationID : Int
//}

enum ShootingStatus {
    case green  //已拍摄
    case yellow //已拍未消
    case red    //已删
    case white  //未拍
}

struct SceneNo {
    let number : Int
    var status : ShootingStatus
}

//0, 1, 2, 3,  4,  5, 6, 7,  8， 9，10，  11， 12， 13，14，  15，16，17,18,19，20，21
//忽，铁，博，娃，战，萨，也，诃，塔，朵，少铁，少孛，少库，特，少撒，少别，撒，别，黑, 扎，库，孛

var SCENE_INFOS : [SceneInfo] =
[
    SceneInfo(sceneNo: SceneNo(number:1,status:.white), atmosphere: .dayOut,pages: 0.1, sceneName:"宇宙" ,characters:[characters[1],characters[17],characters[13],characters[2],characters[19]], backgroundActors: nil , synopsis:"浩瀚宇宙中繁星飘渺" , remark:nil , locationID : 1401 ),
    SceneInfo(sceneNo: SceneNo(number:2,status:.green),atmosphere: .dayOut, pages: 0.3,sceneName:"草原", characters:nil, backgroundActors:nil , synopsis: "上古时期的游牧民族" , remark:nil,locationID : 1401),
    SceneInfo(sceneNo: SceneNo(number:3,status:.white),atmosphere: .dayOut, pages: 0.3,sceneName:"原始森林",characters:nil , backgroundActors:nil , synopsis: "苍狼杀熊救白鹿",remark:nil,locationID : 1402),
    SceneInfo(sceneNo: SceneNo(number:4,status:.white), atmosphere: .dayOut, pages: 0.1,sceneName:"草原",characters:nil , backgroundActors:nil , synopsis: "狼鹿亲昵，游牧繁衍",remark:nil,locationID : 1402),
    SceneInfo(sceneNo: SceneNo(number:5,status:.white), atmosphere: .dayOut, pages: 0.1,sceneName:"地狱",characters:nil , backgroundActors:nil , synopsis: "地下世界，红色熔岩",remark:nil,locationID : 1402),
    SceneInfo(sceneNo: SceneNo(number:6,status:.white), atmosphere: .dayOut, pages: 0.1, sceneName: "天空", characters: nil, backgroundActors: nil, synopsis: "天狼星遮住太阳", remark: nil, locationID: 1401),
    SceneInfo(sceneNo: SceneNo(number:7,status:.white), atmosphere: .dayOut, pages: 0.1, sceneName: "草原", characters: [characters[4]], backgroundActors: nil, synopsis: "赤那骑马在风雪中疾驰", remark: nil, locationID: 1402),
    SceneInfo(sceneNo: SceneNo(number:8,status:.white), atmosphere: .dayOut, pages: 0.2, sceneName: "不儿罕山顶", characters: [characters[4]], backgroundActors: nil, synopsis: "赤那将苏勒定插于不儿罕山顶", remark: nil, locationID: 1401),
    SceneInfo(sceneNo: SceneNo(number:9,status:.white), atmosphere: .dayOut, pages: 0.1, sceneName: "草原", characters: [characters[0]], backgroundActors: nil, synopsis: "迷雾草原，狼烟四起，血腥的杀戮", remark: nil, locationID: 1402),
    SceneInfo(sceneNo: SceneNo(number:10,status:.white), atmosphere: .dayOut, pages: 0.1, sceneName: "不儿罕山山涧古林", characters: [characters[5]], backgroundActors: nil, synopsis: "萨满惊醒睁眼", remark: nil, locationID: 1401),
    SceneInfo(sceneNo: SceneNo(number:11,status:.white), atmosphere:.dayIn, pages: 0.1, sceneName: "浩特蒙古包", characters: [characters[6],characters[7]], backgroundActors: nil, synopsis: "也给子起名字", remark: nil, locationID: 1402),
    SceneInfo(sceneNo: SceneNo(number:12,status:.white), atmosphere: .dayOut, pages: 0.7, sceneName: "草原古战场", characters: [characters[0],characters[8],characters[9],characters[6]], backgroundActors: nil, synopsis: "乞颜部抵抗莽古斯部入侵，也忽同归于尽，塔偷走金刀", remark: nil, locationID: 1401),
    SceneInfo(sceneNo: SceneNo(number:13,status:.white), atmosphere: .dayOut, pages: 1.0, sceneName: "翁吉喇部金莲花海", characters: [characters[10],characters[11],characters[12]], backgroundActors: nil, synopsis: "铁被犬追，哈嘲笑铁，孛愿意嫁给铁", remark: nil, locationID: 1402),
    SceneInfo(sceneNo: SceneNo(number:14,status:.white), atmosphere: .dayOut, pages: 0.3, sceneName: "草原古战场", characters: [characters[0],characters[9]], backgroundActors: nil, synopsis: "朵大悲，泪化湖，冥向朵提出交易，魔宫起", remark: nil, locationID: 1401),
    SceneInfo(sceneNo: SceneNo(number:15,status:.white), atmosphere: .dayOut, pages: 0.2, sceneName: "翁吉喇部金莲花海", characters: [characters[13],characters[10],characters[11]], backgroundActors: nil, synopsis: "孛与白海青沟通，传来亥噩耗", remark: nil, locationID: 1402),
    SceneInfo(sceneNo: SceneNo(number:16,status:.white), atmosphere: .dayOut, pages: 0.1, sceneName: "翁吉喇部金莲花海", characters: [characters[10]], backgroundActors: nil, synopsis: "铁疯跑", remark: nil, locationID: 1402),
    SceneInfo(sceneNo: SceneNo(number:17,status:.yellow), atmosphere: .dayOut, pages: 0.2, sceneName: "乞颜部", characters: [characters[6],characters[7],characters[10]], backgroundActors: nil, synopsis: "闪回:也教铁搏击", remark: nil, locationID: 1401),
    SceneInfo(sceneNo: SceneNo(number:18,status:.white), atmosphere: .dayOut, pages: 0.3, sceneName: "翁吉喇部金莲花海", characters: [characters[10],characters[11]], backgroundActors: nil, synopsis: "铁上马，孛撕衣留念", remark: nil, locationID: 1402),
    SceneInfo(sceneNo: SceneNo(number:19,status:.white), atmosphere: .dayOut, pages: 0.7, sceneName: "乞颜部", characters: [characters[8],characters[7],characters[10],characters[14],characters[15]], backgroundActors:nil , synopsis: "塔拉倒鹿石，抢劫铁家", remark: nil, locationID: 1402),
    SceneInfo(sceneNo: SceneNo(number:20,status:.white), atmosphere: .dayIn, pages: 0.2, sceneName: "森林里铁木真家毡包", characters: [characters[1],characters[7]], backgroundActors: nil, synopsis: "铁承认，诃要铁去娶回孛", remark: nil, locationID: 1401),
    SceneInfo(sceneNo: SceneNo(number:21,status:.white), atmosphere: .dayOut, pages: 0.3, sceneName: "森林里铁木真家毡包", characters: [characters[1],characters[7],characters[16],characters[17]], backgroundActors: nil, synopsis: "铁告别亲人，上路", remark: nil, locationID: 1401),
    SceneInfo(sceneNo: SceneNo(number:22,status:.red), atmosphere: .dayOut, pages: 0.1, sceneName: "草原", characters: [characters[1]], backgroundActors: nil, synopsis: "乌鸦跟踪铁", remark: nil, locationID: 1402),
    SceneInfo(sceneNo: SceneNo(number:23,status:.white), atmosphere: .dayOut, pages: 0.1, sceneName: "草原", characters: [characters[1]], backgroundActors: nil, synopsis: "乌鸦飞过", remark: nil, locationID: 1401),
    SceneInfo(sceneNo: SceneNo(number:24,status:.white), atmosphere: .dayOut, pages: 0.1, sceneName: "盐湖边", characters: [characters[18]], backgroundActors: nil, synopsis: "魔兵押着上百名强掳来的女人", remark: nil, locationID: 1402),
    SceneInfo(sceneNo: SceneNo(number:25,status:.white), atmosphere: .dayOut, pages: 0.1, sceneName: "地下溶洞隧道", characters: nil, backgroundActors: nil, synopsis: "乌鸦飞入，在扭曲底下通道中穿过", remark: nil, locationID: 1401),
    SceneInfo(sceneNo: SceneNo(number:26,status:.white), atmosphere: .dayOut, pages: 0.1, sceneName: "地下齿轮溶洞", characters: nil, backgroundActors: nil, synopsis: "奴隶爬齿轮", remark: nil, locationID: 1402),
    SceneInfo(sceneNo: SceneNo(number:27,status:.white), atmosphere: .dayOut, pages: 0.1, sceneName: "城门堤坝吊桥", characters: [characters[18]], backgroundActors: nil, synopsis: "吊桥放下", remark: nil, locationID: 1401),
    SceneInfo(sceneNo: SceneNo(number:28,status:.white), atmosphere: .dayOut, pages: 0.1, sceneName: "地下溶洞口+大殿前", characters: nil, backgroundActors: nil, synopsis: "乌鸦飞出溶洞，飞向大殿", remark: nil, locationID: 1402),
    SceneInfo(sceneNo: SceneNo(number:29,status:.white), atmosphere: .dayIn, pages: 0.1, sceneName: "盐堡大殿瞭望窗口", characters: [characters[0]], backgroundActors: nil, synopsis: "忽俯视押送队伍", remark: nil, locationID: 1401),
    SceneInfo(sceneNo: SceneNo(number:30,status:.white), atmosphere: .dayOut, pages: 0.2, sceneName: "盐堡广场", characters: [characters[3]], backgroundActors: nil, synopsis: "娃杀少女", remark: nil, locationID: 1402),
    SceneInfo(sceneNo: SceneNo(number:31,status:.white), atmosphere: .dayOut, pages: 0.8, sceneName: "盐堡大殿", characters: [characters[0],characters[3],characters[19]], backgroundActors: nil, synopsis: "小蜥蜴吸血验地母，忽惩罚娃", remark: nil, locationID: 1401),
    SceneInfo(sceneNo: SceneNo(number:32,status:.white), atmosphere: .dayIn, pages: 0.8, sceneName: "盐堡大殿内饰", characters: [characters[0],characters[9],characters[19]], backgroundActors: nil, synopsis: "冥提示忽到哪去找地母", remark: nil, locationID: 1402),
    SceneInfo(sceneNo: SceneNo(number:33,status:.white), atmosphere: .dayOut, pages: 0.1, sceneName: "盐堡城门+第八", characters: [characters[0],characters[3],characters[19]], backgroundActors: nil, synopsis: "魔兵出发", remark: nil, locationID: 1401),
    SceneInfo(sceneNo: SceneNo(number:34,status:.white), atmosphere: .dayOut, pages: 0.1, sceneName: "草原", characters: [characters[1]], backgroundActors: nil, synopsis: "铁赶往翁吉喇部", remark: nil, locationID: 1402),
    SceneInfo(sceneNo: SceneNo(number:35,status:.white), atmosphere: .dayOut, pages: 0.4, sceneName: "翁吉喇部", characters: [characters[13],characters[20]], backgroundActors: nil, synopsis: "特坚守孛的婚约", remark: nil, locationID: 1401),
    SceneInfo(sceneNo: SceneNo(number:36,status:.white), atmosphere: .dayOut, pages: 0.3, sceneName: "翁吉喇部金莲花海", characters: [characters[21],characters[20]], backgroundActors: nil, synopsis: "孛马上弯腰摘花", remark: nil, locationID: 1402),
    SceneInfo(sceneNo: SceneNo(number:37,status:.white), atmosphere: .dayOut, pages: 1.4, sceneName: "草原集市", characters: [characters[1],characters[8],characters[5]], backgroundActors: nil, synopsis: "铁救萨，教训壮汉，阻止塔抢少女，被塔认出，追杀", remark: nil, locationID: 1401),
    SceneInfo(sceneNo: SceneNo(number:38,status:.white), atmosphere: .dayOut, pages: 0.6, sceneName: "集市边树林", characters: [characters[1],characters[2],characters[8]], backgroundActors: nil, synopsis: "铁落坑亡马，博救铁", remark: nil, locationID: 1402),
    SceneInfo(sceneNo: SceneNo(number:39,status:.white), atmosphere: .dayOut, pages: 0.1, sceneName: "草原", characters: [characters[1]], backgroundActors: nil, synopsis: "铁徒步赶路", remark: nil, locationID: 1401),
    SceneInfo(sceneNo: SceneNo(number:40,status:.white), atmosphere: .dayOut, pages: 0.3, sceneName: "沙漠", characters: [characters[0],characters[3],characters[19]], backgroundActors: nil, synopsis: "忽率领骑兵队奋力奔袭", remark: nil, locationID: 1402),
    SceneInfo(sceneNo: SceneNo(number:41,status:.white), atmosphere: .dayOut, pages: 0.8, sceneName: "草原湖边", characters: [characters[1],characters[5]], backgroundActors: nil, synopsis: "铁不愿用聘礼换马，萨留马给铁", remark: nil, locationID: 1401),
    SceneInfo(sceneNo: SceneNo(number:42,status:.white), atmosphere: .dayOut, pages: 0.2, sceneName: "森林", characters: [characters[1]], backgroundActors: nil, synopsis: "白马甩下铁，铁追白马", remark: nil, locationID: 1402),
    SceneInfo(sceneNo: SceneNo(number:43,status:.white), atmosphere: .dayOut, pages: 0.6, sceneName: "悬崖", characters: [characters[1]], backgroundActors: nil, synopsis: "白马救落崖的铁", remark: nil, locationID: 1401),
    SceneInfo(sceneNo: SceneNo(number:44,status:.white), atmosphere: .dayOut, pages: 0.2, sceneName: "草原与森林的交界处", characters: [characters[0],characters[3],characters[19]], backgroundActors: nil, synopsis: "忽部队快到翁吉喇部了", remark: nil, locationID: 1402),
    SceneInfo(sceneNo: SceneNo(number:45,status:.white), atmosphere: .dayOut, pages: 0.4, sceneName: "翁吉喇部营地前", characters: [characters[1],characters[21],characters[13],characters[20]], backgroundActors: nil, synopsis: "铁遇犬，仓皇而逃，引众笑", remark: nil, locationID: 1401),
    SceneInfo(sceneNo: SceneNo(number:46,status:.white), atmosphere: .dayOut, pages: 1.0, sceneName: "翁吉喇部营地", characters: [characters[1],characters[21],characters[13],characters[20]], backgroundActors: nil, synopsis: "哈尔库摔下马，孛神奇安抚怒马", remark: nil, locationID: 1402),
    SceneInfo(sceneNo: SceneNo(number:47,status:.white), atmosphere: .nightOut, pages: 0.6, sceneName: "翁吉喇部营地", characters: [characters[1],characters[21],characters[13],characters[20]], backgroundActors: nil, synopsis: "铁孛婚礼", remark: nil, locationID: 1401),
    SceneInfo(sceneNo: SceneNo(number:48,status:.white), atmosphere: .nightOut, pages: 0.1, sceneName: "翁吉喇部营地后面高坡", characters: [characters[1],characters[21],characters[13],characters[20],characters[0],characters[3],characters[19]], backgroundActors: nil, synopsis: "忽下令攻打翁吉喇部", remark: nil, locationID: 1402),
    SceneInfo(sceneNo: SceneNo(number:49,status:.white), atmosphere: .nightIn, pages: 0.5, sceneName: "翁吉喇部营地新婚帐篷", characters: [characters[1],characters[21]], backgroundActors: nil, synopsis: "新人拥抱，听到杀声", remark: nil, locationID: 1401),
    SceneInfo(sceneNo: SceneNo(number:50,status:.white), atmosphere: .nightOut, pages: 0.2, sceneName: "翁吉喇部营地", characters: [characters[13],characters[20],characters[0],characters[3],characters[19]], backgroundActors: nil, synopsis: "魔兵逼近", remark: nil, locationID: 1402),
    SceneInfo(sceneNo: SceneNo(number:51,status:.white), atmosphere: .nightIn, pages: 0.1, sceneName: "翁吉喇部营地新婚帐篷", characters: [characters[1],characters[21]], backgroundActors: nil, synopsis: "铁与孛冲出帐篷", remark: nil, locationID: 1401),
    SceneInfo(sceneNo: SceneNo(number:52,status:.white), atmosphere: .nightOut, pages: 0.5, sceneName: "翁吉喇部营地", characters: [characters[1],characters[21],characters[13],characters[20],characters[0],characters[3],characters[19]], backgroundActors: nil, synopsis: "铁腰孛先逃，与娃厮杀，陷入包围", remark: nil, locationID: 1402),
    SceneInfo(sceneNo: SceneNo(number:53,status:.white), atmosphere: .nightOut, pages: 0.1, sceneName: "翁吉喇部树林", characters: [characters[21]], backgroundActors: nil, synopsis: "翁吉喇部树林中逃窜的族人", remark: nil, locationID: 1401),
    SceneInfo(sceneNo: SceneNo(number:54,status:.white), atmosphere: .nightOut, pages: 1.1, sceneName: "翁吉喇部营地", characters: [characters[1],characters[21],characters[13],characters[20],characters[0],characters[3],characters[19]], backgroundActors: nil, synopsis: "孛舍身保护族人，被忽掳走，铁冲杀追去", remark: nil, locationID: 1402),
    SceneInfo(sceneNo: SceneNo(number:55,status:.white), atmosphere: .dayOut, pages: 0.4, sceneName: "沙漠", characters: [characters[21],characters[2],characters[0],characters[3],characters[19]], backgroundActors: nil, synopsis: "博见骑兵队，遇沙暴突袭", remark: nil, locationID: 1401),
    SceneInfo(sceneNo: SceneNo(number:56,status:.white), atmosphere: .dayOut, pages: 0.2, sceneName: "沙漠", characters: [characters[1],characters[2]], backgroundActors: nil, synopsis: "铁救博", remark: nil, locationID: 1402),
    SceneInfo(sceneNo: SceneNo(number:57,status:.white), atmosphere: .dayOut, pages: 0.5, sceneName: "沙漠", characters: [characters[1],characters[2]], backgroundActors: nil, synopsis: "铁与博同行去魔宫", remark: nil, locationID: 1401),
    SceneInfo(sceneNo: SceneNo(number:58,status:.white), atmosphere: .dayOut, pages: 0.3, sceneName: "不儿罕山下", characters: [characters[1],characters[2]], backgroundActors: nil, synopsis: "结拜，上路", remark: nil, locationID: 1402),
    SceneInfo(sceneNo: SceneNo(number:59,status:.white), atmosphere: .dayIn, pages: 0.7, sceneName: "盐堡宫殿", characters: [characters[21],characters[0],characters[3],characters[19],characters[9]], backgroundActors: nil, synopsis: "严明孛是地母，忽腰打开地狱之门", remark: nil, locationID: 1401),
    SceneInfo(sceneNo: SceneNo(number:60,status:.white), atmosphere: .nightOut, pages: 0.2, sceneName: "雪山脚下", characters: [characters[1],characters[2]], backgroundActors: nil, synopsis: "听地表声音，铁博爬雪山", remark: nil, locationID: 1402)
]

let CASTACTOR_INFOS_ABOUT_SCENE = [
    CharacterInfosAboutScene(characterID: 101, sceneNo: 1, characterMakeupID: 1, characterWardrobeID: 1),
    CharacterInfosAboutScene(characterID: 102, sceneNo: 1, characterMakeupID: 2, characterWardrobeID: 3),
    CharacterInfosAboutScene(characterID: 103, sceneNo: 1, characterMakeupID: 2, characterWardrobeID: 2),
    CharacterInfosAboutScene(characterID: 104, sceneNo: 1, characterMakeupID: 1, characterWardrobeID: 2)
]

struct VB_Range {
    let location : Int
    let length : Int
}


var screenplay_strike = [
    VB_Range(location: 90, length: 47),
    VB_Range(location: 440, length: 65),
    VB_Range(location: 75, length: 20),
    VB_Range(location: 220, length: 40),
    VB_Range(location: 190, length: 47),
    VB_Range(location: 340, length: 65)
]

