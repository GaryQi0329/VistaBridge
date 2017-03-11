//
//  DateHeaderView.swift
//  VistaBridge
//
//  Created by 齐晴 on 16/10/28.
//  Copyright © 2016年 GaryQi. All rights reserved.
//

import UIKit

class DateHeaderView: UICollectionReusableView {
    
    var monthLabel : UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        monthLabel = UILabel()
        monthLabel.textAlignment = .center
        monthLabel.font = UIFont(name: "PingFangTC-Medium", size: 30)
        monthLabel.textColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.9)
        
        self.addSubview(monthLabel)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        monthLabel.frame = self.bounds
    }
}
