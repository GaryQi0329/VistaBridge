//
//  CallSheetSceneInfoHeaderCell.swift
//  VistaBridge
//
//  Created by 齐晴 on 16/10/23.
//  Copyright © 2016年 GaryQi. All rights reserved.
//

import UIKit

class CallSheetSceneInfoHeaderCell: UITableViewHeaderFooterView {
    
    var sceneNoLabel: UILabel!
    var atmosphereLabel: UILabel!
    var pagesLabel: UILabel!
    var sceneLabel: UILabel!
    var contentLabel: UILabel!
    var charactersLabel: UILabel!
    var remarkLabel: UILabel!
    var lineLabel: UILabel!
    
    var referenceK : CGFloat = 0
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        
//        contentView.backgroundColor = UIColor.clearColor()
        
        sceneNoLabel = UILabel()
        sceneNoLabel.text = "场次"
        sceneNoLabel.textAlignment = .center
        sceneNoLabel.font = UIFont(name: "PingFangTC-Medium", size: 18)
        sceneNoLabel.textColor = UIColor(red: 70/255, green: 78/255, blue: 80/255, alpha: 1)
        
        atmosphereLabel = UILabel()
        atmosphereLabel.text = "气氛"
        atmosphereLabel.textAlignment = .center
        atmosphereLabel.font = UIFont(name: "PingFangTC-Medium", size: 18)
        atmosphereLabel.textColor = UIColor(red: 70/255, green: 78/255, blue: 80/255, alpha: 1)
        
        pagesLabel = UILabel()
        pagesLabel.text = "页数"
        pagesLabel.textAlignment = .center
        pagesLabel.textColor = UIColor(red: 70/255, green: 78/255, blue: 80/255, alpha: 1)
        pagesLabel.font = UIFont(name: "PingFangTC-Medium", size: 18)
        
        sceneLabel = UILabel()
        sceneLabel.text = "场景"
        sceneLabel.textAlignment = .center
        sceneLabel.font = UIFont(name: "PingFangTC-Medium", size: 18)
        sceneLabel.textColor = UIColor(red: 70/255, green: 78/255, blue: 80/255, alpha: 1)
        
        contentLabel = UILabel()
        contentLabel.text = "内容"
        contentLabel.textAlignment = .center
        contentLabel.font = UIFont(name: "PingFangTC-Medium", size: 18)
        contentLabel.textColor = UIColor(red: 70/255, green: 78/255, blue: 80/255, alpha: 1)
        
        charactersLabel = UILabel()
        charactersLabel.text = "角色"
        charactersLabel.textAlignment = .center
        charactersLabel.font = UIFont(name: "PingFangTC-Medium", size: 18)
        charactersLabel.textColor = UIColor(red: 70/255, green: 78/255, blue: 80/255, alpha: 1)
        
        remarkLabel = UILabel()
        remarkLabel.text = "备注"
        remarkLabel.textAlignment = .center
        remarkLabel.font = UIFont(name: "PingFangTC-Medium", size: 18)
        remarkLabel.textColor = UIColor(red: 70/255, green: 78/255, blue: 80/255, alpha: 1)
        
        lineLabel = UILabel()
        lineLabel.text = "————————————————————————————————————————————————————————————————"
        lineLabel.textAlignment = .center
        lineLabel.font = UIFont(name: "PingFangTC-Medium", size: 18)
        lineLabel.textColor = UIColor(red: 70/255, green: 78/255, blue: 80/255, alpha: 1)
        
        contentView.addSubview(sceneNoLabel)    //k
        contentView.addSubview(atmosphereLabel) //k
        contentView.addSubview(pagesLabel)  //k
        contentView.addSubview(sceneLabel)  //2k
        contentView.addSubview(contentLabel)    //4k
        contentView.addSubview(charactersLabel) //4k
        contentView.addSubview(remarkLabel) //4k
        contentView.addSubview(lineLabel)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        referenceK = contentView.frame.size.width/17
        
        let arr1 = [0,1,2,3,5,9,13]  //计算相对位置的系数
        let arr2 = [1,1,1,2,4,4,4]  //计算宽度的系数
        
        var labels = [sceneNoLabel,atmosphereLabel,pagesLabel,sceneLabel,contentLabel,charactersLabel,remarkLabel,lineLabel]
        
        
        for i in 0...6 {
            labels[i]?.frame.origin.x = 0 + referenceK * CGFloat(arr1[i])
            labels[i]?.frame.size.width = referenceK * CGFloat(arr2[i])
            labels[i]?.frame.size.height = contentView.frame.height
        }
        
        labels[7]?.frame.origin.x = 0
        labels[7]?.frame.origin.y = 77
        labels[7]?.frame.size.width = 300
    }
    
    
}
