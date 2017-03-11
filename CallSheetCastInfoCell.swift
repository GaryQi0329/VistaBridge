//
//  CallSheetCastInfoCell.swift
//  VistaBridge
//
//  Created by 齐晴 on 16/10/25.
//  Copyright © 2016年 GaryQi. All rights reserved.
//

import UIKit

class CallSheetCastInfoCell: UITableViewCell {

    var labels : [UILabel] = []//按顺序依次为：["演员","角色","出发时间","梳妆时间","服装时间","进场时间","备注"]
    
    var characterInfosAboutCallSheet : CharactersInfosAboutCallSheet?
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        //             2.5K  2.5K     2K        2K       2K       2K       4K
        let titles = ["演员","角色","出发时间","梳妆时间","服装时间","进场时间","备注"]
        
        for title in titles {
            let label = UILabel()
            label.text = title
            label.textAlignment = .center
            label.font = UIFont(name: "PingFangTC-Medium", size: 15)
            label.textColor = UIColor(red: 70/255, green: 78/255, blue: 80/255, alpha: 1)
            label.numberOfLines = 0
            labels.append(label)
            contentView.addSubview(label)
        }
    }
    
    func prepareCallSheetCastInfoCell() {
        
        //所有的数据在这里录入,不考虑布局的问题
        
        if let characterInfos  = self.characterInfosAboutCallSheet {
            labels[0].text = searchCharacterInfosByID(characterInfos.characterID)?.name
            labels[1].text = searchCastInfosByID(characterInfos.characterID)
//            labels[2].text = 
            labels[3].text = characterInfos.makeupTime
//            labels[4].text = characterInfos.wardrobeID
            labels[5].text = characterInfos.setCallTime
            labels[6].text = characterInfos.remarks
            
            
        }
        
    }
    
    override func layoutSubviews() {
        
        super.layoutSubviews()
        
        let arr1 = [0,2.5,5,7,9,11,13]  //计算相对位置的系数
        let arr2 = [2.5,2.5,2,2,2,2,4]  //计算宽度的系数
        
        let referenceK = contentView.frame.size.width/17
        let superviewHeight = contentView.frame.size.height
        
        for i in 0...6 {
            labels[i].frame.origin.x = 0 + referenceK * CGFloat(arr1[i])
//            labels[i].frame.origin.y = (superviewHeight - )
            labels[i].frame.size.width = referenceK * CGFloat(arr2[i])
            labels[i].frame.size.height = contentView.frame.height
        }
        
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    fileprivate func searchCharacterInfosByID(_ ID : Int) -> Character?{
        for character in characters {
            if character.ID == ID {
                return character
            }
        }
        
        return nil
    }
    
    fileprivate func searchCastInfosByID(_ ID : Int) -> String? {
        
        let character = searchCharacterInfosByID(ID)
        let characterID = character?.ID
        
        for cast in CAST {
            if cast.characterID == characterID {
                return cast.name
            }
        }
        
        return nil
        
    }

}
