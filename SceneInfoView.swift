//
//  SceneInfoView.swift
//  VistaBridge
//
//  Created by 齐晴 on 16/9/11.
//  Copyright © 2016年 GaryQi. All rights reserved.
//

import UIKit

class SceneInfoView: UIView {
    
    @IBOutlet weak var sceneInfoLabel: UILabel!
    
    let ButtonSize = 15
    var sceneInfo : SceneInfo?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        //根据这场戏的SceneInfo初始化View
        //        sceneInfoLabel = UILabel.init(frame: CGRect(origin: CGPointZero, size: CGSize(width: 60, height: 40)))
        //        actorButtonStack = UIStackView.init(frame: CGRect(origin: CGPoint(x: 0, y: 40), size: CGSize(width: 60, height: 25)))
    }
    
    
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    func prepareView(_ sceneInfos:SceneInfo){
        
        sceneInfo = sceneInfos
        sceneInfoLabel.text = sceneInfo!.synopsis
        
        if sceneInfo!.characters != nil {
            var count = 0
            for actor in sceneInfo!.characters! {
                let button = UIButton.init(frame: CGRect(origin: CGPoint(x: 0 + count*ButtonSize, y: 90), size: CGSize(width: ButtonSize, height: ButtonSize)))
                button.titleLabel?.font = UIFont.init(name:"PingFangTC-Medium", size: 15)
                button.titleLabel?.backgroundColor = actor.color
                button.setTitle(actor.acronym, for: UIControlState())
                self.addSubview(button)
                count += 1
            }
        }
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        sceneInfoLabel.frame = CGRect(x: 0.0, y: 0.0, width: self.frame.size.width, height: 90)
        
        
    }
}
