//
//  CheckAlgorithmModal.swift
//  VistaBridge
//
//  Created by 齐晴 on 17/2/14.
//  Copyright © 2017年 GaryQi. All rights reserved.
//

import Foundation

struct WrongCastSchedule {
    let castID : Int
    let date : String
    let scene : Int
}

struct VBDate {
    let month : Int
    let day : Int
}

//错误排期信息表
var wrongSchedules : [WrongCastSchedule] = []
var initWrongSchedules = 0

//得到错误排期信息表
func createWrongSchedules() {
    
    var wsTmp : [WrongCastSchedule] = []
    
    //遍历每一天的期表排期
    for oneDay in DATE_INFOS {
        let date = "\(oneDay.month)月\(oneDay.day)日"
        
        //遍历每一天排的每一场次
        if oneDay.scenes != nil {
            for scene in getSceneInfosBySceneNo(sceneNo: oneDay.scenes!) {
                //获得该场次所有涉及演员的ID
                let casts = getCastIdByCharacter(characters: scene.characters)
                if casts != nil {
                    //遍历每一位涉及演员
                    for castID in casts! {
                        //判断该日该演员是否有档期
                        if !dateIsAvailable(availableDates: getAvailableDatesByID(castID: castID), date: date) {
                            let w = WrongCastSchedule(castID: castID, date: date, scene: scene.sceneNo.number)
                            wsTmp.append(w)
                        }
                    }
                }
            }
        }
    }
    
    wrongSchedules = wsTmp
//    print("createWrongSchedules:\(wrongSchedules)")
    initWrongSchedules = 1
}

//根据 场次号 数组，得到 场次信息 数组
func getSceneInfosBySceneNo(sceneNo : [Int]) -> [SceneInfo] {
    
    var result : [SceneInfo] = []
    
    for n in sceneNo {
        for sceneInfo in SCENE_INFOS {
            if sceneInfo.sceneNo.number == n {
                result.append(sceneInfo)
                break
            }
        }
        
    }
    
    return result
}

//根据CastID ，得到 Character
func getCharacterByCastID(castID : Int) -> Character {
    
    var c : Cast = CAST[0]
    for cast in CAST {
        if cast.castID == castID {
            c = cast
            break
        }
    }
    
    for d in characters {
        if d.ID == c.characterID {
            return d
        }
    }
    
    print("CheckAlgorithmModal_getCharacterByCastID_faild")
    return characters[0]
}

//根据 角色 数组，得到 演员ID 数组
func getCastIdByCharacter(characters : [Character]?) -> [Int]?{
    
    var castID : [Int]?
    
    if characters != nil {
        //遍历每一个角色信息
        var tmp : [Int] = []
        for character in characters! {
            for cast in CAST {
                if cast.characterID == character.ID {
                    tmp.append(cast.castID)
                    break
                }
            }
        }
        
        castID = tmp
    }
    
    return castID
    
}

//查询演员是否在该日有档期
func dateIsAvailable(availableDates : [String], date: String) -> Bool {
    for d in availableDates {
        if date == d {
            return true
        }
    }
    
    return false
}

//根据 演员ID，得到 演员可用档期 数组
func getAvailableDatesByID(castID: Int) -> [String]{
    for cast in CastSchedule {
        if cast.castID == castID {
            return cast.availableDates
        }
    }
    
    print("CheckAlgorithmModal_getAvailableDatesByID_faild!")
    return []
}

//
//func getCharacterByCastID(CastID : Int) -> Character {
//    for c in characters {
////        if c.ID
//    }
//}
