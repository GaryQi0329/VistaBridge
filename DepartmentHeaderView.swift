//
//  DepartmentHeaderView.swift
//  VistaBridge
//
//  Created by 齐晴 on 17/3/9.
//  Copyright © 2017年 GaryQi. All rights reserved.
//

import UIKit

class DepartmentHeaderView: UICollectionReusableView {
    
    var departmentLabel : UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        departmentLabel = UILabel()
        departmentLabel.textAlignment = .center
        departmentLabel.font = UIFont(name: "PingFangTC-Medium", size: 30)
        departmentLabel.textColor = UIColor(red: 78/255, green: 80/255, blue: 82/255, alpha: 0.9)
        departmentLabel.frame = self.bounds
        self.addSubview(departmentLabel)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        departmentLabel.frame = self.bounds
    }
    
}
