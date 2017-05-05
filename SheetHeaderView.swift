//
//  SheetHeaderView.swift
//  VistaBridge
//
//  Created by 齐晴 on 17/5/5.
//  Copyright © 2017年 GaryQi. All rights reserved.
//

import UIKit

class SheetHeaderView: UITableViewHeaderFooterView {
    
    var dateLabel : UILabel//按顺序依次为：["演员","角色","出发时间","梳妆时间","服装时间","进场时间","备注"]
    
    override init(reuseIdentifier : String?) {
        
        dateLabel = UILabel()
        
        super.init(reuseIdentifier: reuseIdentifier)
        
        dateLabel.text = ""
        dateLabel.textAlignment = .center
        dateLabel.font = UIFont(name: "PingFangTC-Medium", size: 18)
        dateLabel.textColor = UIColor(red: 70/255, green: 78/255, blue: 80/255, alpha: 1)
        self.contentView.addSubview(dateLabel)
        
    }
    
    override func layoutSubviews() {
        
        super.layoutSubviews()
        
        let arr1 = [0,0.1,2,3,4,5,6,9]  //计算相对位置的系数
        let arr2 = [0.2,3,1,1,1,1,3,1]  //计算宽度的系数
        
        let referenceK = self.contentView.frame.size.width/10
        
        print("adsdsadas,\(self.contentView.frame.size.width)")
        
        
        dateLabel.frame.origin.x = 0 + referenceK * CGFloat(arr1[1])
        dateLabel.frame.size.width = referenceK * CGFloat(arr2[1])
        dateLabel.frame.size.height = self.contentView.frame.height
    }
    
    func updateDateLabel(date : String) {
        
        dateLabel.text = "记录日期：\(date)"
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
