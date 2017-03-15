//
//  UULineChart.swift
//  UUChartView-swift
//
//  Created by chen on 16/9/6.
//  Copyright © 2016年 jie. All rights reserved.
//

import UIKit
import Foundation

class UULineChart: UIView {
    
    var xLabels:NSArray!
    var yLabels:NSArray!
    var yValues:NSArray!
    var colors:NSArray!
    
    var showHorizonLine:NSMutableArray!
    var showMaxMinArray:NSMutableArray!
    
    var xLabelWidth:CGFloat!
    var yValueMax:CGFloat!
    var yValueMin:CGFloat!
    
    var markRange:Range!
    var chooseRange:Range!
    
    var chartLabelsForX:NSHashTable<AnyObject>!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.clipsToBounds = false
//        self.setChooseRange(Range())
//        self.setMarkRanges(Range())
//        self.xLabels = NSArray()
//        self.yLabels = NSArray()
//        self.yValues = NSArray()
//        self.showHorizonLine = NSMutableArray()
//        self.showMaxMinArray = NSMutableArray()
    }
    
    func setYValuess (_ yValues:NSArray) {
        self.yValues = yValues
        self.setYLabelss(yValues)
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
        
        let level:CGFloat = (self.yValueMax - self.yValueMin) / UUYLabelLevelCount
        let chartCavanHeight:CGFloat = self.frame.size.height - UULabelHeight * 3
        let levelHeight:CGFloat = chartCavanHeight / UUYLabelLevelCount
        for index in 0..<Int(UUYLabelLevelCount+1) {
            let label:UUChartLabel = UUChartLabel(frame : CGRect(x: 0.0,y: chartCavanHeight-(CGFloat(index)*levelHeight)+5, width: UUYLabelwidth, height: UULabelHeight))
            label.text = String(format: "%.2f",(level * CGFloat(index) + self.yValueMin))
            self.addSubview(label)
        }
        
        if super.responds(to: Selector("setMarkRanges:")) {
            let view:UIView = UIView(frame : CGRect(x: UUYLabelwidth, y: (1 - (self.markRange.max - self.yValueMin) / (self.yValueMax - self.yValueMin)) * chartCavanHeight + UULabelHeight, width: self.frame.size.width - UUYLabelwidth, height: (self.markRange.max - self.markRange.min) / (self.yValueMax - self.yValueMin)*chartCavanHeight))
            view.backgroundColor = UIColor.gray.withAlphaComponent(0.1)
            self.addSubview(view)
        }
        
        for i in 0..<Int(UUYLineLevelCount) {
            if (self.showHorizonLine[i] as AnyObject).intValue > 0 {
                let shapeLayer:CAShapeLayer = CAShapeLayer()
                let path:UIBezierPath = UIBezierPath()
                path.move(to: CGPoint(x: UUYLabelwidth,y: UULabelHeight+CGFloat(i)*levelHeight))
                path.addLine(to: CGPoint(x: self.frame.size.width,y: UULabelHeight+CGFloat(i)*levelHeight))
                path.close()
                shapeLayer.path = path.cgPath
                shapeLayer.strokeColor = UIColor.black.withAlphaComponent(0.1).cgColor
                shapeLayer.fillColor = UIColor.white.cgColor
                shapeLayer.lineWidth = 1
                self.layer.addSublayer(shapeLayer)
            }
        }
        
    }
    
    func setXLabelss (_ xLabels:NSArray) {
        if self.chartLabelsForX == nil {
            self.chartLabelsForX = NSHashTable.weakObjects()
        }
        self.xLabels = xLabels
        var num:CGFloat = 0
        if xLabels.count >= 20 {
            num = 20.0
        }else if xLabels.count <= 1 {
            num = 1.0
        }else{
            num = CGFloat(xLabels.count)
        }
        self.xLabelWidth = (self.frame.size.width - UUYLabelwidth)/num
        
        for i in 0 ..< xLabels.count {
            let label:UUChartLabel = UUChartLabel(frame : CGRect(x: CGFloat(i) * self.xLabelWidth + UUYLabelwidth, y: self.frame.size.height - UULabelHeight, width: self.xLabelWidth, height: UULabelHeight))
            label.text = xLabels[i] as? String
            self.addSubview(label)
            self.chartLabelsForX .add(label)
        }
        
        //画竖线
        for i in 0..<xLabels.count + 1 {
            let shapeLayer:CAShapeLayer = CAShapeLayer()
            let path:UIBezierPath = UIBezierPath()
            path.move(to: CGPoint(x: UUYLabelwidth + CGFloat(i) * self.xLabelWidth,y: UULabelHeight))
            path.addLine(to: CGPoint(x: UUYLabelwidth + CGFloat(i) * self.xLabelWidth,y: self.frame.size.height - 2 * UULabelHeight))
            path.close()
            shapeLayer.path = path.cgPath
            shapeLayer.strokeColor = UIColor.black.withAlphaComponent(0.1).cgColor
            shapeLayer.fillColor = UIColor.white.cgColor
            shapeLayer.lineWidth = 1
            self.layer.addSublayer(shapeLayer)
        }
    }
    
    func setColorss (_ colors : NSArray) {
        self.colors = colors
    }
    
    func setMarkRanges (_ markRange : Range) {
        self.markRange = markRange
    }
    
    func setChooseRange (_ chooseRange : Range) {
        self.chooseRange = chooseRange
    }
    
    func setshowHorizonLine (_ showHorizonLine : NSMutableArray) {
        self.showHorizonLine = showHorizonLine
    }
    
    func strokeChart () {
//        let chartCavanHeight:CGFloat = self.frame.size.height - UULabelHeight*3
        for i in 0 ..< self.yValues.count {
            let childAry:NSArray = self.yValues[i] as! NSArray
            if childAry.count == 0 {
                return
            }
            var max:Float = (childAry[0] as! NSString).floatValue
            var min:Float = (childAry[0] as! NSString).floatValue
            var max_i = 0
            var min_i = 0
            
            for j in 0..<childAry.count {
                let num:Float = (childAry[j] as! NSString).floatValue
                if max <= num {
                    max = num
                    max_i = j
                }
                if min >= num {
                    min = num
                    min_i = j
                }
            }
            
            let chartLine:CAShapeLayer = CAShapeLayer()
            chartLine.lineCap = kCALineCapRound
            chartLine.lineJoin = kCALineJoinBevel
            chartLine.fillColor = UIColor.white.cgColor
            chartLine.lineWidth = 2.0
            chartLine.strokeEnd = 0.0
            self.layer.addSublayer(chartLine)
            
            let progressline:UIBezierPath = UIBezierPath()
            let firstValue  = (childAry.object(at: 0) as! NSString).floatValue
            let xPosition:CGFloat  = UUYLabelwidth + self.xLabelWidth / 2.0
            let chartCavanHeight:CGFloat  = self.frame.size.height - UULabelHeight*3
            
            let grade:CGFloat  = (CGFloat(firstValue) - CGFloat(self.yValueMin)) / (CGFloat(self.yValueMax)-CGFloat(self.yValueMin))
            
            //第一个点
            var isShowMaxAndMinPoint:Bool = true
            if self.showMaxMinArray != nil {
                if (self.showMaxMinArray[i] as! NSString).intValue > 0 {
                    isShowMaxAndMinPoint = (max_i == 0 || min_i == 0) ? false : true
                }else{
                    isShowMaxAndMinPoint = true
                }
            }
            self.addPoint(CGPoint(x: xPosition, y: chartCavanHeight - grade * chartCavanHeight+UULabelHeight), index: i, isHollow: isShowMaxAndMinPoint, value: CGFloat(firstValue))
            
            progressline.move(to: CGPoint(x: xPosition, y: chartCavanHeight - CGFloat(grade) * chartCavanHeight + UULabelHeight))
            progressline.lineWidth = 2.0
            progressline.lineCapStyle = CGLineCap.round
            progressline.lineJoinStyle = CGLineJoin.round
            
            var index:NSInteger = 0
            for str  in childAry {
                let valueString:NSString = str as! NSString
                let grade:Float = (valueString.floatValue - Float(self.yValueMin)) / Float(self.yValueMax - self.yValueMin)
                if index != 0 {
                    let point:CGPoint = CGPoint(x: xPosition + CGFloat(index) * self.xLabelWidth, y: chartCavanHeight - CGFloat(grade) * chartCavanHeight+UULabelHeight)
                    progressline.addLine(to: point)
                    var isShowMaxAndMinPoint:Bool = true
                    if self.showMaxMinArray != nil {
                        if (self.showMaxMinArray[i] as AnyObject).int32Value > 0 {
                            isShowMaxAndMinPoint = (max_i==index || min_i==index) ? false : true
                        }else{
                            isShowMaxAndMinPoint = true
                        }
                        progressline.move(to: point)
                        self.addPoint(point, index: i, isHollow: isShowMaxAndMinPoint, value: CGFloat(valueString.floatValue))
                    }
                }
                index += 1
            }
            
            chartLine.path = progressline.cgPath
            if (self.colors.object(at: i) as AnyObject).cgColor != nil {
                chartLine.strokeColor = (self.colors.object(at: i) as AnyObject).cgColor
            }else{
                chartLine.strokeColor = UIColor.green.cgColor
            }
            
            let childAryCount:TimeInterval = TimeInterval(childAry.count)
            let pathAnimation:CABasicAnimation! = CABasicAnimation (keyPath: "strokeEnd")
            pathAnimation.duration = childAryCount * 0.4
            pathAnimation.timingFunction = CAMediaTimingFunction.init(name: kCAMediaTimingFunctionEaseInEaseOut)
            pathAnimation.fromValue = 0.0
            pathAnimation.toValue = 1.0
            pathAnimation.autoreverses = false
            chartLine .add(pathAnimation, forKey: "strokeEndAnimation")
            chartLine.strokeEnd = 1.0
            
        }
    }
    
    func addPoint(_ point:CGPoint,index:NSInteger,isHollow:Bool,value:CGFloat) {
        let view:UIView = UIView(frame :CGRect(x: 5, y: 5, width: 8, height: 8))
        view.center = point;
        view.layer.masksToBounds = true;
        view.layer.cornerRadius = 4;
        view.layer.borderWidth = 2;
        view.layer.borderColor = (self.colors.object(at: index) as AnyObject).cgColor != nil ? (self.colors.object(at: index) as AnyObject).cgColor : UUChartConst.green().cgColor
        
        if (isHollow) {
            view.backgroundColor = UIColor.white
        }else{
            view.backgroundColor = (self.colors.object(at: index) as AnyObject).cgColor != nil ? (self.colors.object(at: index) as! UIColor) : (UUChartConst.green());
            let label:UILabel = UILabel(frame : CGRect(x: point.x-UUTagLabelwidth/2.0, y: point.y-UULabelHeight*2, width: UUTagLabelwidth, height: UULabelHeight))
            label.font = UIFont.systemFont(ofSize: 10)
            label.textAlignment = NSTextAlignment.center
            label.textColor = view.backgroundColor
            label.text = String(format: "%d",Int(value))
            self.addSubview(label)
        }
        self.addSubview(view)
    }
    
    func chartLabelsForXs () -> (NSArray) {
        return self.chartLabelsForX.allObjects as (NSArray)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        fatalError("init(coder:) has not been implemented")
    }

}
