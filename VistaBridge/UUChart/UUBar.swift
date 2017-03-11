//
//  UUBar.swift
//  UUChartView-swift
//
//  Created by chen on 16/9/6.
//  Copyright © 2016年 jie. All rights reserved.
//

import UIKit
import Foundation



class UUBar: UIView {
    var gradePercent : CGFloat!
    var chartLine : CAShapeLayer!
    var barColor : UIColor!
    override init(frame: CGRect) {
        super.init(frame: frame)
        chartLine = CAShapeLayer()
        chartLine.lineCap = kCALineCapSquare
        chartLine.fillColor = UIColor.white.cgColor
        chartLine.lineWidth = self.frame.size.width
        chartLine.strokeEnd = 0.0
        self.layer .addSublayer(chartLine)
        self.clipsToBounds = true
        self.layer.cornerRadius = 2.0
    }
    
    func setGradePercent (_ gradePercent : CGFloat) {
        if gradePercent == 0 {
            return;
        }
        self.gradePercent = gradePercent
        let progressline :UIBezierPath! = UIBezierPath()
        
        progressline .move(to: CGPoint(x: self.frame.size.width / 2.0, y: self.frame.size.height + 30))
        progressline .addLine(to: CGPoint(x: self.frame.size.width / 2.0, y: (1 - gradePercent) * self.frame.size.height + 15))
        progressline .lineWidth = 1.0
        progressline .lineCapStyle = CGLineCap.square
        chartLine.path = progressline.cgPath
        chartLine.strokeColor = barColor != nil ? barColor.cgColor:UIColor.green.cgColor
        
        let pathAnimation:CABasicAnimation! = CABasicAnimation (keyPath: "strokeEnd")
        pathAnimation.duration = 1.5
        pathAnimation.timingFunction = CAMediaTimingFunction.init(name: kCAMediaTimingFunctionEaseInEaseOut)
        pathAnimation.fromValue = 0.0
        pathAnimation.toValue = 1.0
        pathAnimation.autoreverses = false
        chartLine .add(pathAnimation, forKey: "strokeEndAnimation")
        chartLine.strokeEnd = 2.0
        
    }
    
    func deawRect (_ rect:CGRect) {
        let content:CGContext! = UIGraphicsGetCurrentContext()
        content.setFillColor(UIColor.white.cgColor)
        content.fill(rect)
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        fatalError("init(coder:) has not been implemented")
    }
    
}
        
