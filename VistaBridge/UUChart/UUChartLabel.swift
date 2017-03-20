//
//  UUChartLabel.swift
//  UUChartView-swift
//
//  Created by chen on 16/9/6.
//  Copyright © 2016年 jie. All rights reserved.
//
import UIKit
import Foundation


class UUChartLabel: UILabel {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.lineBreakMode = NSLineBreakMode.byWordWrapping
        self.minimumScaleFactor = 5.0
        self.numberOfLines = 1
        self.font = UIFont(name: "Copperplate-Bold", size: 15)
        self.textColor = UIColor.darkGray
        self.textAlignment = NSTextAlignment.center
        self.backgroundColor = UIColor.clear
        self.isUserInteractionEnabled = false
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
