//
//  ScheduleSceneInfoView.swift
//  VistaBridge
//
//  Created by 齐晴 on 16/10/30.
//  Copyright © 2016年 GaryQi. All rights reserved.
//

import UIKit

class ScheduleSceneInfoView: UIView {
    
    var isToBeChoosen = false
    
    let ButtonTitleSize : CGFloat = 11    //button里面，演员名字简称的字号
    let SynopsisFontSize : CGFloat = 11   //简介的字号
    
    let ButtonSize :CGFloat = 15    //button的大小
    let distanceBetweenButtonAndLabel :CGFloat = 5  //简介与演员button之间的间距
    
    var width : CGFloat = 0
    var height : CGFloat = 0
    
    var sceneInfo : SceneInfo?
    
    var synopsisLabel = UILabel()
    var charactersButtons : [UIButton] = []
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        synopsisLabel.font = UIFont(name: "PingFangTC-Medium", size: SynopsisFontSize)
        synopsisLabel.textColor = UIColor(colorLiteralRed: 70/255, green: 78/255, blue: 80/255, alpha: 1)
        synopsisLabel.numberOfLines = 0
        self.addSubview(synopsisLabel)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func prepareView(_ sceneInfo:SceneInfo) -> CGFloat{
        
        if isToBeChoosen {
            synopsisLabel.frame.origin = CGPoint(x: 4, y: 0)
            synopsisLabel.frame.size = CGSize(width: width - 4, height: 40)
        }
        self.sceneInfo = sceneInfo
        print("\(sceneInfo.sceneNo).\(sceneInfo.synopsis)")
        synopsisLabel.text = "\(sceneInfo.sceneNo.number).\(sceneInfo.synopsis)"
        
        if sceneInfo.characters != nil {
            var count = 0
            for actor in sceneInfo.characters! {
                let button = UIButton.init()
                button.titleLabel?.font = UIFont(name: "PingFangTC-Medium", size: ButtonTitleSize)
                button.backgroundColor = actor.color
                button.setTitle(actor.acronym, for: UIControlState())
                charactersButtons.append(button)
                self.addSubview(button)
                count += 1
            }
        }
        
        height = calculateHeight()
        return height
    }
    
    
    func calculateHeight() -> CGFloat {
        synopsisLabel.frame.size = CGSize(width: width - 4, height: 1000)
        synopsisLabel.sizeToFit()
        let h = synopsisLabel.frame.size.height
        let height = h + ButtonTitleSize + distanceBetweenButtonAndLabel
        return height
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        synopsisLabel.frame.origin = CGPoint(x: 4, y: 0)
        
        if isToBeChoosen {
            var count :CGFloat = 0
            for characterButton in charactersButtons {
                characterButton.frame.origin = CGPoint(x: 4 + count*ButtonSize, y: 45 + ButtonSize)
                characterButton.frame.size = CGSize(width: ButtonSize, height: ButtonSize)
                count += 1
            }
        } else {
            
            var count :CGFloat = 0
            for characterButton in charactersButtons {
                characterButton.frame.origin = CGPoint(x: 4 + count*ButtonSize, y: height - ButtonSize)
                characterButton.frame.size = CGSize(width: ButtonSize, height: ButtonSize)
                count += 1
            }
        }
    }
}
