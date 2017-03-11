//
//  UUBarChart.swift
//  UUChartView-swift
//
//  Created by chen on 16/9/6.
//  Copyright © 2016年 jie. All rights reserved.
//


import UIKit
import Foundation

class UUBarChart: UIView {
    
    var xLabels:NSArray!
    var yLabels:NSArray!
    var yValues:NSArray!
    
    var colors:NSArray!
    
    var xLabelWidth:CGFloat!
    var yValueMax:CGFloat!
    var yValueMin:CGFloat!
    var chooseRange:Range!
    
    var myScrollView:UIScrollView!
    var chartLabelsForX:NSHashTable<AnyObject>!
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.clipsToBounds = false
        self.myScrollView = UIScrollView(frame:CGRect(x: UUYLabelwidth, y: 0, width: frame.size.width-UUYLabelwidth, height: frame.size.height))
        self .addSubview(self.myScrollView)
    }
    
    func setYValuess (_ yValues:NSArray) {
        self.yValues = yValues
        [self .setYLabelss(yValues)]
    }
    
    func setYLabelss (_ yLabels:NSArray) {
        var max:NSInteger = 0
        var min:NSInteger = 1000000000
        for ary in yLabels {
            let array:NSArray = ary as! NSArray
            for str in array {
                let valueString:NSString = str as! NSString
                let value:NSInteger = valueString.integerValue
                if value > max {
                    max = value
                }
                if value < min {
                    min = value
                }
            }
        }
        if max < 5 {
            max = 5
        }
        self.yValueMin = 0
        self.yValueMax = CGFloat(max)
        
        if self.chooseRange.max != self.chooseRange.min {
            self.yValueMax = self.chooseRange.max
            self.yValueMin = self.chooseRange.min
        }
        
        let level:CGFloat = (self.yValueMax - self.yValueMin) / 4.0
        let chartCavanHeight:CGFloat = self.frame.size.height - UULabelHeight * 3
        let levelHeight:CGFloat = chartCavanHeight / 4.0
        for index in 0...4 {
            let i = CGFloat(index)
            let label:UUChartLabel = UUChartLabel(frame : CGRect(x: 0.0,y: chartCavanHeight-(i*levelHeight)+5, width: UUYLabelwidth, height: UULabelHeight))
            label.text = String(format: "%.2f",(level * CGFloat(index) + self.yValueMin))
            self.addSubview(label)
        }
        
    }
    
    func setXLabelss (_ xLabels:NSArray) {
        if self.chartLabelsForX == nil {
            self.chartLabelsForX = NSHashTable.weakObjects()
        }
        self.xLabels = xLabels
        var num:NSInteger!
        if xLabels.count >= 8 {
            num = 8
        }else if xLabels.count <= 4 {
            num = 4
        }else{
            num = xLabels.count
        }
        self.xLabelWidth = self.myScrollView.frame.size.width/CGFloat(num)
        
        for i in 0 ..< xLabels.count {
            let label:UUChartLabel = UUChartLabel(frame : CGRect(x: (CGFloat(i) *  self.xLabelWidth ), y: self.frame.size.height - UULabelHeight, width: self.xLabelWidth, height: UULabelHeight))
            label.text = xLabels[i] as? String
            self.myScrollView .addSubview(label)
            self.chartLabelsForX .add(label)
        }
        
        let max:CGFloat = ((CGFloat(xLabels.count)-1)*self.xLabelWidth + chartMargin)+self.xLabelWidth
        if self.myScrollView.frame.size.width < max - 10 {
            self.myScrollView.contentSize = CGSize(width: max, height: self.frame.size.height)
        }
    }
    
    func setColorss (_ colors : NSArray) {
        self.colors = colors
    }
    
    func setChooseRange (_ chooseRange : Range) {
        self.chooseRange = chooseRange
    }
    
    func strokeChart () {
        let chartCavanHeight:CGFloat = self.frame.size.height - UULabelHeight*3
        for i in 0 ..< self.yValues.count {
            if i == 2 {
                return
            }
            let childAry:NSArray = self.yValues[i] as! NSArray
            for j in 0 ..< childAry.count {
                let valueString:NSString = childAry[j] as! NSString
                let value = valueString.floatValue
                let grade = (CGFloat(value) - self.yValueMin) / (self.yValueMax - self.yValueMin)
                let bar:UUBar = UUBar(frame:CGRect(x: (CGFloat(j) + (self.yValues.count == 1 ? 0.1 : 0.05)) * self.xLabelWidth + CGFloat(i) * self.xLabelWidth * 0.47 ,y: UULabelHeight ,width: self.xLabelWidth * (self.yValues.count == 1 ? 0.8 : 0.45) ,height: chartCavanHeight))
                bar.barColor = self.colors.object(at: i) as! UIColor
                bar.setGradePercent(grade)
                self.myScrollView.addSubview(bar)
            }
        }
    }
    
    func chartLabelsForXs () -> (NSArray) {
        return self.chartLabelsForX.allObjects as (NSArray)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
}
