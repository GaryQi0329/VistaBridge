//
//  CallSheetSceneInfoCell.swift
//  VistaBridge
//
//  Created by 齐晴 on 16/10/17.
//  Copyright © 2016年 GaryQi. All rights reserved.
//

import UIKit
// FIXME: comparison operators with optionals were removed from the Swift Standard Libary.
// Consider refactoring the code to use the non-optional operators.
fileprivate func < <T : Comparable>(lhs: T?, rhs: T?) -> Bool {
  switch (lhs, rhs) {
  case let (l?, r?):
    return l < r
  case (nil, _?):
    return true
  default:
    return false
  }
}


class CallSheetSceneInfoCell: UITableViewCell {
    
    var sceneNoLabel = UILabel()
    var atmosphereLabel = UILabel()
    var pagesLabel = UILabel()
    var sceneLabel = UILabel()
    var contentLabel = UILabel()
    var remarkLabel = UILabel()
    
    var characterButtons : [UIView] = []
    
    var sceneInfos : SceneInfo?
    
    var characterButtonSize : CGFloat = 25
    
    var referenceK : CGFloat = 0
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        let labels = [sceneNoLabel,atmosphereLabel,pagesLabel,sceneLabel,contentLabel,remarkLabel]
        
        for label in labels {
            label.textAlignment = .center
            label.font = UIFont.init(name:"PingFangTC-Medium", size: 15)
            label.numberOfLines = 0
            label.baselineAdjustment = .alignCenters
            label.textColor = UIColor(red: 70/255, green: 78/255, blue: 80/255, alpha: 1)
            contentView.addSubview(label)
        }
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func prepareCallSheetSceneInfoCell() {
        //所有的数据在这里录入,不考虑布局的问题
        
        if let sceneInfos = self.sceneInfos {
            sceneNoLabel.text = String(sceneInfos.sceneNo.number)
            atmosphereLabel.text = arr_ATMOSPHERE[sceneInfos.atmosphere!.hashValue]
            pagesLabel.text = String(sceneInfos.pages!)
            sceneLabel.text = sceneInfos.sceneName
            contentLabel.text = sceneInfos.synopsis
            remarkLabel.text = sceneInfos.remark
            
            //演员
            if let characters = sceneInfos.characters {
                for index in 0...characters.count-1 {
                    let character = characters[index]
                    let button = UIButton()
                    button.titleLabel?.font = UIFont.init(name:"PingFangTC-Medium", size: 15)
                    button.setTitle(character.acronym, for: UIControlState())
                    button.backgroundColor = character.color
                    characterButtons.append(button)
                    contentView.addSubview(button)
                }
            }
        }
        
    }
    
    override func layoutSubviews() {
        //所有的布局问题集中在这里解决
        super.layoutSubviews()
        
        referenceK = contentView.frame.size.width/17
        
        let height = calculateCellHeight()
        
        let labels = [sceneNoLabel,atmosphereLabel,pagesLabel,sceneLabel,contentLabel,remarkLabel]
        
        let arr1 = [0,1,2,3,5,13] //x坐标的参考系数
        let arr2 = [1,1,1,2,4,4]  //width的参考系数
        
        //        let arr1 = [0,1,2,3,5,9,13]  //计算相对位置的系数
        //        let arr2 = [1,1,1,2,4,4,4]  //计算宽度的系数
        
        for i in 0...5 {
            labels[i].center = contentView.center
            
            //label高度
            labels[i].frame.size.height = height
            
            //label宽度
            labels[i].frame.size.width = referenceK * CGFloat(arr2[i])
            
            //label横坐标x
            labels[i].frame.origin.x = 0 + referenceK * CGFloat(arr1[i])
        }
        
        //单独处理Characters的Buttons
        
        let charactersButtonsZoneCenter_x = CGFloat(referenceK * 11)
        
        //首先判断有多少个characterButton，是奇数，还是偶数
        let count = characterButtons.count
        let o = count % 2
        var isOdd = false
        if o == 1 {
            isOdd = true
        }
        
        if isOdd {
            // count是奇数
            let superCenterX = contentView.center.x
            let indexOfButtonInCenter = (count-1)/2
            
            characterButtons[indexOfButtonInCenter].center = CGPoint(x: charactersButtonsZoneCenter_x,y: contentView.center.y)
            
            for button in characterButtons {
                let index = characterButtons.index(of: button)
                if index < indexOfButtonInCenter {
                    button.center.x = characterButtons[indexOfButtonInCenter].center.x - (CGFloat)(indexOfButtonInCenter-index!)*characterButtonSize
                    button.center.y = characterButtons[indexOfButtonInCenter].center.y
                }else{
                    button.center.x = characterButtons[indexOfButtonInCenter].center.x + (CGFloat)(index! - indexOfButtonInCenter)*characterButtonSize
                    button.center.y = characterButtons[indexOfButtonInCenter].center.y
                }
            }
        }else{
            // count是偶数
            let reference = count/2
            for button in characterButtons {
                let index = characterButtons.index(of: button)
                if index < reference {
                    button.frame.origin.x = charactersButtonsZoneCenter_x - (CGFloat)(reference - index!)*characterButtonSize
                    button.center.y = contentView.center.y
                }else{
                    button.frame.origin.x = charactersButtonsZoneCenter_x + (CGFloat)(index! - reference)*characterButtonSize
                    button.center.y = contentView.center.y
                }
            }
        }
        
        for button in characterButtons {
            button.frame.size.width = characterButtonSize
            button.frame.size.height = characterButtonSize
        }
        
    }
    
    fileprivate func calculateCellHeight() -> CGFloat{
        //根据内容计算Cell高度
        
        //判断高度的三个考虑因素，最后选择最大者
        var HeightForSynopsis = 0
        var HeightForCharacters = 0
        var HeightForRemark = 0
        
        if let characters = sceneInfos?.characters {
            let count = characters.count
            HeightForCharacters = (count/4 + 1)*Int(characterButtonSize)
        }
        
        if let synopsis = sceneInfos?.synopsis {
            let count = synopsis.characters.count
            HeightForSynopsis = (count/10 + 1)*Int(characterButtonSize)
        }
        
        if let remark = sceneInfos?.remark {
            let count = remark.characters.count
            HeightForRemark = (count/10 + 1)*Int(characterButtonSize)
        }
        
        //排序
        let arr = [HeightForSynopsis , HeightForCharacters, HeightForRemark].sorted()
        
        return CGFloat(arr.last!)
        
    }
    
}
