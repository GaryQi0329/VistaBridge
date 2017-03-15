//
//  VBChartView.swift
//  VistaBridge
//
//  Created by 齐晴 on 17/2/8.
//  Copyright © 2017年 GaryQi. All rights reserved.
//

import UIKit

//定义数据协议
protocol VBChartDataSource : NSObjectProtocol {
    //表标题
    func chartConfigTitle(_ chart : VBChartView) -> String
    //纵坐标单位标题
    func chartConfigAxisYTitle(_ chart : VBChartView) -> String
    //横坐标单位标题
    func chartConfigAxisXTitle(_ chart : VBChartView) -> String
    //横坐标标题数组
    func chartConfigAxisXLabel(_ chart : VBChartView) -> (NSArray)
    //数值多重数组
    func chartConfigAxisYValue(_ chart : VBChartView) -> (NSArray)
    //颜色数组
    func chartConfigColors(_ chart : VBChartView) -> (NSArray)
    //显示数值范围
    func chartRange(_ chart : VBChartView) -> (Range)
    //显示数值区域
    func chartHighlightRangeInLine(_ chart : VBChartView) -> (Range)
    //判断显示横线条
    func showHorizonLineAtIndex(_ chart : VBChartView, index : NSInteger) -> (ObjCBool)
    //判断显示最大最小值
    func showMaxMinAtIndex(_ chart : VBChartView, index : NSInteger) -> (ObjCBool)
    
    
}

class VBChartView: UIView , UUChartDataSource{
    
    var dataSource : VBChartDataSource!
    var uuChartView : UUChart!
    var titleView : UIView!
    var axisYTitleView : UIView!
    var axisXTitleView : UIView!
    
    var chartModeButtons : [UIButton]!  //存放切换的Button
    
    var controller : DailySheetViewController!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.white
        self.clipsToBounds = true
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func initWithFrame(_ rect : CGRect , dataSource : VBChartDataSource , ctl : DailySheetViewController) -> VBChartView {
        let v : VBChartView = VBChartView(frame: rect)
        
        //dataSouce
        v.dataSource = dataSource
        self.dataSource = dataSource
        self.controller = ctl
        
        //根据需求，创建UUChart的Frame矩形
        let UUChartRect = CGRect(x: rect.origin.x, y: rect.origin.y - VBChartTitleHeight, width: rect.size.width - UUYLabelwidth, height: rect.size.height - VBChartTitleHeight)
        let uChart : UUChart! = UUChart.init(frame:UUChartRect)
        
        //uuChartView
        let uRect = CGRect(x: uChart.bounds.origin.x, y: uChart.bounds.origin.y+VBChartTitleHeight, width: uChart.bounds.size.width, height: uChart.bounds.size.height)
        v.uuChartView = uChart.initWithFrame(uRect, dataSource: self, style: .uuChartStyleLine)
        
        //titleView
        v.titleView = UIView.init(frame: CGRect(x: rect.origin.x, y: rect.origin.y, width: rect.size.width, height: VBChartTitleHeight))
        
        //axisXTitleView
        let titleRect = v.titleView.frame     //axisXTitleView包含于titleView
        v.axisXTitleView = UIView.init(frame: CGRect(x: titleRect.origin.x, y: titleRect.size.height-VBChartAxisXTitleHeight, width: UUYLabelwidth, height: VBChartAxisXTitleHeight))
        
        //axisYTitleView
        v.axisYTitleView = UIView.init(frame: CGRect(x: rect.size.width - UUYLabelwidth, y: rect.size.height-VBChartAxisXTitleHeight, width: UUYLabelwidth, height:VBChartAxisXTitleHeight))
        
        
        //chartModeButtons
        var buttons : [UIButton] = []
        var ts = ["T","P","A"]
        for i in 0...2 {
            let tRect = v.titleView.bounds
            let iX = tRect.size.width - CGFloat(3-i)*VBChartButtonWidth
            let iRect = CGRect(x: iX, y: tRect.origin.y, width: VBChartButtonWidth, height: VBChartButtonWidth)
            let b = UIButton.init(frame: iRect)
            b.backgroundColor = COLORS[i]
//            b.setTitle(ts[i], for: UIControlState())
            b.setImage(UIImage(named:"dog"), for: UIControlState())
            b.addTarget(self, action: #selector(self.buttonPressed(_ :)), for: UIControlEvents.touchUpInside)
            buttons.append(b)
        }
        v.chartModeButtons = buttons
        
        
        return v
    }
    
    //
    func setUpChart() {
        
        //titleView
        let rect1 = titleView.bounds
        let titleLabel = UILabel.init(frame: rect1)
        titleLabel.text = dataSource.chartConfigTitle(self)
        titleLabel.textAlignment = .center
        titleView.addSubview(titleLabel)
        
        //axisXTitleView
        let rect2 = axisXTitleView.bounds
        let axisXTitleLabel = UILabel.init(frame: rect2)
        axisXTitleLabel.text = dataSource.chartConfigAxisXTitle(self)
        axisXTitleLabel.textAlignment = .center
        axisXTitleView.addSubview(axisXTitleLabel)
        
        //axisYTitleView
        let rect3 = axisYTitleView.bounds
        let axisYTitleLabel = UILabel.init(frame: rect3)
        axisYTitleLabel.text = dataSource.chartConfigAxisYTitle(self)
        axisYTitleLabel.textAlignment = .center
        axisYTitleView.addSubview(axisYTitleLabel)
        
        //
        titleView.addSubview(axisYTitleView)
        self.addSubview(titleView)
        self.addSubview(axisXTitleView)
        for b in chartModeButtons {
            titleView.addSubview(b)
        }
        
        uuChartView.showInView(self)
        
        
    }
    
    func showInView (_ view : UIView) {
        self.setUpChart()
        view.addSubview(self)
    }
    
    
    //UUChartDataSource Func
    
    //横坐标标题数组
    func chartConfigAxisXLabel(_ chart : UUChart) -> NSArray {
        return dataSource.chartConfigAxisXLabel(self)
    }
    
    //数值多重数组
    func chartConfigAxisYValue(_ chart : UUChart) -> (NSArray){
        return dataSource.chartConfigAxisYValue(self)
    }
    
    //颜色数组
    func chartConfigColors(_ chart : UUChart) -> (NSArray){
        return dataSource.chartConfigColors(self)
    }
    
    //显示数值范围
    func chartRange(_ chart : UUChart) -> (Range){
        
        return dataSource.chartRange(self)
    }
    
    //标记数值区域
    func chartHighlightRangeInLine(_ chart : UUChart) -> (Range){
        //        return Range(max: 1000, min: 0)
        print("chartHighlightRangeInLine:\(dataSource)")
        return dataSource.chartHighlightRangeInLine(self)
    }
    
    //判断显示横线条
    func showHorizonLineAtIndex(_ chart : UUChart, index : NSInteger) -> (ObjCBool){
        return dataSource.showHorizonLineAtIndex(self, index: index)
    }
    
    //判断显示最大最小值
    func showMaxMinAtIndex(_ chart : UUChart, index : NSInteger) -> (ObjCBool){
        return dataSource.showMaxMinAtIndex(self, index: index)
    }
    
    //buttonPressed
    func buttonPressed(_ button : UIButton){
        controller.chartIndex = 1
    }
    
}
