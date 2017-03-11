//
//  ContinuitySheetHeaderView.swift
//  VistaBridge
//
//  Created by 齐晴 on 16/11/9.
//  Copyright © 2016年 GaryQi. All rights reserved.
//

import UIKit

class ContinuitySheetHeaderView: UITableViewHeaderFooterView {
    
    var labels : [UILabel] = []//按顺序依次为：["演员","角色","出发时间","梳妆时间","服装时间","进场时间","备注"]
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        
        //             K     K    K    K    K    K     3K     K
        let titles = ["卷","文件","场","镜","次","评价","简介","视频"]
        
        for title in titles {
            let label = UILabel()
            label.text = title
            label.textAlignment = .center
            label.font = UIFont(name: "PingFangTC-Medium", size: 18)
            label.textColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.8)
            labels.append(label)
            contentView.addSubview(label)
        }
        
        contentView.backgroundColor = UIColor(red: 83/255, green: 219/255, blue: 64/255, alpha: 1.0)
    }
    
    override func layoutSubviews() {
        
        super.layoutSubviews()
        
        let arr1 = [0,1,2,3,4,5,6,9]  //计算相对位置的系数
        let arr2 = [1,1,1,1,1,1,3,1]  //计算宽度的系数
        
        let referenceK = contentView.frame.size.width/10
        
        for i in 0...7 {
            labels[i].frame.origin.x = 0 + referenceK * CGFloat(arr1[i])
            labels[i].frame.size.width = referenceK * CGFloat(arr2[i])
            labels[i].frame.size.height = contentView.frame.height
        }
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
