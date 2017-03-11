//
//  UUChart.swift
//  UUChartView-swift
//
//  Created by chen on 16/9/7.
//  Copyright © 2016年 jie. All rights reserved.
//

import UIKit
import Foundation
import ObjectiveC

enum UUChartStyle {
    case uuChartStyleLine
    case uuChartStyleBar
}

//定义一个协议
protocol UUChartDataSource : NSObjectProtocol{
    //横坐标标题数组
    func chartConfigAxisXLabel(_ chart : UUChart) -> (NSArray)
    //数值多重数组
    func chartConfigAxisYValue(_ chart : UUChart) -> (NSArray)
    //颜色数组
    func chartConfigColors(_ chart : UUChart) -> (NSArray)
    //显示数值范围
    func chartRange(_ chart : UUChart) -> (Range)
    
    //折线图专享功能
    //标记数值区域
    func chartHighlightRangeInLine(_ chart : UUChart) -> (Range)
    //判断显示横线条
    func showHorizonLineAtIndex(_ chart : UUChart, index : NSInteger) -> (ObjCBool)
    //判断显示最大最小值
    func showMaxMinAtIndex(_ chart : UUChart, index : NSInteger) -> (ObjCBool)
}

class UUChart : UIView {
    
    var chartStyle : UUChartStyle!
    var lineChart : UULineChart!
    var barChart : UUBarChart!
    var dataSource : UUChartDataSource!
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.white
        self.clipsToBounds = true
        
    }
    
    func initWithFrame(_ rect : CGRect,dataSource : UUChartDataSource,style : UUChartStyle) -> (UUChart){
        let View : UUChart = UUChart(frame : rect);
        View.dataSource = dataSource;
        View.chartStyle = style;
        return View
    }
    
    func setUpChart () {
        if self.chartStyle == UUChartStyle.uuChartStyleLine {
            if self.lineChart == nil {
                self.lineChart = UULineChart(frame : CGRect(x: 0, y: 0, width: self.frame.size.width, height: self.frame.size.height))
                self.addSubview(self.lineChart)
            }
            //选择标记范围
//            let RangeInLine : Bool = self.dataSource.respondsToSelector(Selector("chartHighlightRangeInLine:"))
            if (dataSource != nil) {
                self.lineChart.setMarkRanges((self.dataSource?.chartHighlightRangeInLine(self))!)
            }
            
            //选择显示范围
//            let Range : Bool = self.dataSource.respondsToSelector(Selector("chartRange:"))
            if (dataSource != nil) {
                self.lineChart.setChooseRange((self.dataSource?.chartRange(self))!)
            }
            
            //显示颜色
//            let Colors : Bool = self.dataSource.respondsToSelector(Selector("chartConfigColors:"))
            if (dataSource != nil) {
                self.lineChart.setColorss((self.dataSource?.chartConfigColors(self))!)
            }
            
            
            //显示横线
//            let zonLineAtIndex : Bool = self.dataSource.respondsToSelector(Selector("showHorizonLineAtIndex:"))
            if (dataSource != nil) {
                let showHorizonArray:NSMutableArray = NSMutableArray()
                for i in 0 ..< Int(UUYLineLevelCount) {
                    if self.dataSource.showHorizonLineAtIndex(self, index: i).boolValue {
                        showHorizonArray.add("1")
                    }else{
                        showHorizonArray.add("0")
                    }
                }
                self.lineChart.showHorizonLine = showHorizonArray
//                self.lineChart.setshowHorizonLine(showHorizonArray)
                
            }
            

            
            //判断显示最大最小值
//            let MaxMin : Bool = self.dataSource.respondsToSelector(Selector("showMaxMinAtIndex::"))
            if (dataSource != nil) {
                let showMaxMinArray:NSMutableArray = NSMutableArray()
                let y_values:NSArray = self.dataSource.chartConfigAxisYValue(self)
                if y_values.count > 0 {
                    for i in 0 ..< y_values.count {
                        if self.dataSource.showMaxMinAtIndex(self, index: i).boolValue {
                            showMaxMinArray.add("1")
                        }else{
                            showMaxMinArray.add("0")
                        }
                    }
                    self.lineChart.showMaxMinArray = showMaxMinArray;
                }
            }
            
            self.lineChart.setYValuess(self.dataSource.chartConfigAxisYValue(self))
            self.lineChart.setXLabelss(self.dataSource.chartConfigAxisXLabel(self))
            self.lineChart.strokeChart();
        }else if self.chartStyle == UUChartStyle.uuChartStyleBar {
            if self.barChart == nil {
                self.barChart = UUBarChart(frame : CGRect(x: 0, y: 0, width: self.frame.size.width, height: self.frame.size.height))
                self.addSubview(self.barChart)
            }
            if (dataSource != nil) {
                self.barChart.setChooseRange(self.dataSource.chartRange(self))
                
            }
            
            if (dataSource != nil) {
                self.barChart.setColorss(self.dataSource.chartConfigColors(self))
            }
            
            self.barChart.setYValuess(self.dataSource.chartConfigAxisYValue(self))
            self.barChart.setXLabelss(self.dataSource.chartConfigAxisXLabel(self))
            self.barChart.strokeChart()
        }
        
    }
    
    
    func showInView (_ view : UIView) {
        self.setUpChart()
        view.addSubview(self)
    }
    
    func strokeChart () {
        self.setUpChart()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    
    
    
    
    
    
    
    
}
