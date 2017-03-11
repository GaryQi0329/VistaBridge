//
//  InfosWithTableCell.swift
//  VistaBridge
//
//  Created by 齐晴 on 16/9/21.
//  Copyright © 2016年 GaryQi. All rights reserved.
//

import UIKit

class InfosWithTableCell: UICollectionViewCell, UITableViewDataSource, UITableViewDelegate{
    
    @IBOutlet weak var typeLabel: UILabel!
    
    @IBOutlet weak var infosTable: UITableView!
    
    var identifierNo = -1    //代表要创建的cell的identifier在数组identifiersOfTableViewCell的位置
    
    let identifiersOfTableViewCell = [
        "CastActorInfoCell",
        "BackgroundActorInfoCell",
        "BackgroundActorInfoCell",
        "BackgroundActorInfoCell"
    ]
    
    var castActorInfos : [CharacterInfosAboutScene] = [] {
        didSet{
            //如果castActorInfos被赋值，说明tableview要显示的是主要演员的信息

            identifierNo = 0
            infosTable.reloadData()
            
        }
    }
    
    var backgroundActorInfos : [BackgroundcharacterInfosAboutScene] = [] {
        didSet{
            //如果backgroundActorInfos被赋值，说明tableview要显示的是群众演员的信息
            identifierNo = 1
            infosTable.reloadData()
            
        }
    }
    
    var props : [PropsAboutScene] = [] {
        didSet {
            //如果prps被赋值，说明tableview要显示的是道具的信息
            
            identifierNo = 2
            infosTable.reloadData()
            
        }
    }
    
    var equipmentInfos : [EquipmentInfosAboutScene] = [] {
        didSet {
            //如果equpiments被赋值，说明tableview要显示的是拍摄器械的信息
            
            identifierNo = 3
            infosTable.reloadData()
        }
    }
    
    func prepareInfosWithTableCell(_ typeOfTheCell : TypeOfTheCommonInfos , sceneNo : Int) {
        
        infosTable.dataSource = self
        infosTable.delegate = self
        
        //infosTable的分割线，滑动指示器
        infosTable.separatorStyle = .none
        infosTable.showsVerticalScrollIndicator = false
        
        switch typeOfTheCell {
        case .cast :
            //主要演员cell
            //获得该场次的所有涉及的主演信息
            castActorInfos = searchCastActorInfosBySceneNo(sceneNo)
            
        case .background :
            //群众演员cell
            //获得该场次的所有涉及的群演信息
            backgroundActorInfos = searchBackgroundInfosBySceneNo(sceneNo)
            
        case .props :
            //涉及道具cell
            //获得该场次涉及道具的信息
            props = searchPropsInfosBySceneNo(sceneNo)
        case .equipment :
            //拍摄器械信息Cell
            equipmentInfos = searchEquipmentInfosBySceneNo(sceneNo)
        default:
            print("还没有写其它的")
        }
    }
    
    func prepareInfosWithTableCell() {
        infosTable.dataSource = self
        infosTable.delegate = self
        
        infosTable.reloadData()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch identifierNo {
        case 0 :
            return castActorInfos.count
        case 1 :
            return backgroundActorInfos.count
        case 2 :
            return props.count
        case 3:
            return equipmentInfos.count
        default:
            print("还没有写其它的")
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch identifierNo {
        case -1:
            print("还没有写其它的")
            let cell = tableView.dequeueReusableCell(withIdentifier: identifiersOfTableViewCell[1]) as! BackgroundActorInfoCell
            return cell
        case 0:
            //主要演员cell
            let cell = tableView.dequeueReusableCell(withIdentifier: identifiersOfTableViewCell[identifierNo]) as! CastActorInfoCell
            cell.actorNameLabel.text = searchCastActorNameByID(castActorInfos[indexPath.row].characterID)
            //            cell.actorMakeupButton.setImage(UIImage?, forState: UIControlState)   设置演员化妆的Button
            //            cell.actorWardrobeButton.setImage(UIImage?, forState: UIControlState) 设置演员服装的Button
            return cell
            
        case 1:
            //群众演员cell
            let cell = tableView.dequeueReusableCell(withIdentifier: identifiersOfTableViewCell[identifierNo]) as! BackgroundActorInfoCell
            cell.backgroundActorNameLabel.text = searchBackgroundActorNameByID(backgroundActorInfos[indexPath.row].backgroundCharacterID)
            cell.numberLabel.text = "X \(backgroundActorInfos[indexPath.row].number)"
            return cell
            
        case 2:
            //道具Cell,目前先复用群众演员的CELL类吧
            let cell = tableView.dequeueReusableCell(withIdentifier: identifiersOfTableViewCell[identifierNo]) as! BackgroundActorInfoCell
            cell.backgroundActorNameLabel.text = searchPropsNameByID(props[indexPath.row].propsID)
            cell.numberLabel.text = "X \(props[indexPath.row].number)"
            return cell
        case 3:
            //器械Cell,目前先服用群众演员的CELLL类吧
            let cell = tableView.dequeueReusableCell(withIdentifier: identifiersOfTableViewCell[identifierNo]) as! BackgroundActorInfoCell
            cell.backgroundActorNameLabel.text = searchEquipmentNameByID(equipmentInfos[indexPath.row].equipmentID)
            cell.numberLabel.text = "X \(equipmentInfos[indexPath.row].number)"
            return cell
        default :
            print("还没有写其它的")
            let cell = tableView.dequeueReusableCell(withIdentifier: identifiersOfTableViewCell[identifierNo]) as! BackgroundActorInfoCell
            return cell
        }
        
    }
    
    fileprivate func searchCastActorInfosBySceneNo(_ sceneNo : Int) -> [CharacterInfosAboutScene]{
        //搜寻该场次的设计主演信息
        //ps. 忽出鲁 1号妆， 1号装 ["忽出鲁"，1，1]
        var castActorInfosAboutScene : [CharacterInfosAboutScene] = []
        
        for castActorInfo in CASTACTOR_INFOS_ABOUT_SCENE {
            if castActorInfo.sceneNo == sceneNo {
                castActorInfosAboutScene.append(castActorInfo)
            }
        }
        
        return castActorInfosAboutScene
    }
    
    fileprivate func searchCastActorNameByID(_ characterID : Int) -> String {
        for character in characters {
            if character.ID == characterID {
                return character.name
            }
        }
        
        print("InfosWithTableCell_searchCastActorNameByID_没有找到")
        return ""
    }
    
    fileprivate func searchBackgroundInfosBySceneNo(_ sceneNo : Int) -> [BackgroundcharacterInfosAboutScene] {
        
        var backgroundActorInfosAboutScene : [BackgroundcharacterInfosAboutScene] = []
        
        for backgroundActor in BACKGROUND_ACTORS_INFOS_ABOUT_SCENE {
            if backgroundActor.sceneNo == sceneNo {
                backgroundActorInfosAboutScene.append(backgroundActor)
            }
        }
        
        return backgroundActorInfosAboutScene
        
    }
    
    fileprivate func searchBackgroundActorNameByID(_ backgroundActorID : Int) -> String {
        
        for backgroundActor in BACKGROUND_ACTORS_INFOS {
            if backgroundActor.ID == backgroundActorID {
                return backgroundActor.name
            }
        }
        
        print("InfosWithTableCell_searchBackgroundActorNameByID_没有找到")
        return ""
    }
    
    fileprivate func searchPropsInfosBySceneNo(_ sceneNo : Int) -> [PropsAboutScene] {
        
        var propsAboutScene : [PropsAboutScene] = []
        
        for propsInfo in PROPS_INFOS_ABOUT_SCENE {
            if propsInfo.sceneNo == sceneNo {
                propsAboutScene.append(propsInfo)
            }
        }
        
        return propsAboutScene
        
    }
    
    fileprivate func searchPropsNameByID(_ propsID : Int) -> String {
        for props in PROPS {
            if props.propsID == propsID {
                return props.name
            }
        }
        
        print("InfosWithTableCell_searchPropsNameByID_没有找到")
        return ""
    }
    
    fileprivate func searchEquipmentInfosBySceneNo(_ sceneNo : Int) -> [EquipmentInfosAboutScene] {
        
        var equipmentInfos : [EquipmentInfosAboutScene] = []
        
        for equipment in EQUIPMENTS_INFOS_ABOUT_SCENE {
            if equipment.sceneNo == sceneNo {
                equipmentInfos.append(equipment)
            }
        }
        
        return equipmentInfos
    }
    
    fileprivate func searchEquipmentNameByID(_ equipmentID : Int) -> String {
        for equipment in EQUIPMENTS {
            if equipment.equipmentID == equipmentID {
                return equipment.name
            }
        }
        
        print("InfosWithTableCell_searchEquipmentNameByID_没有找到")
        return ""
    }
}
