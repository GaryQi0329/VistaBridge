//
//  CallSheetCastInfoHeaderCell.swift
//  VistaBridge
//
//  Created by 齐晴 on 16/10/24.
//  Copyright © 2016年 GaryQi. All rights reserved.
//

import UIKit

class CallSheetCastInfoHeaderCell: UITableViewHeaderFooterView {

    var labels : [UILabel] = []//按顺序依次为：["演员","角色","出发时间","梳妆时间","服装时间","进场时间","备注"]
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        
        //             2.5K  2.5K     2K        2K       2K       2K       4K
        let titles = ["演员","角色","出发时间","梳妆时间","服装时间","进场时间","备注"]
        
        for title in titles {
            let label = UILabel()
            label.text = title
            label.textAlignment = .center
            label.font = UIFont(name: "PingFangTC-Medium", size: 18)
            label.textColor = UIColor(red: 70/255, green: 78/255, blue: 80/255, alpha: 1)
            labels.append(label)
            contentView.addSubview(label)
        }
    }

    override func layoutSubviews() {
        
        super.layoutSubviews()
        
        let arr1 = [0,2.5,5,7,9,11,13]  //计算相对位置的系数
        let arr2 = [2.5,2.5,2,2,2,2,4]  //计算宽度的系数
        
        let referenceK = contentView.frame.size.width/17
        
        for i in 0...6 {
            labels[i].frame.origin.x = 0 + referenceK * CGFloat(arr1[i])
            labels[i].frame.size.width = referenceK * CGFloat(arr2[i])
            labels[i].frame.size.height = contentView.frame.height
        }
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
