//
//  DailySheetViewController.swift
//  VistaBridge
//
//  Created by 齐晴 on 16/9/27.
//  Copyright © 2016年 GaryQi. All rights reserved.
//

import UIKit

class DailySheetViewController: UIViewController , VBChartDataSource{
    
    @IBOutlet weak var chartView: UIView!
    @IBOutlet weak var timeAxisReferenceView: UIView!
    
    let NotificationName_DateNumberChange = "DateInfoViewController_DateNumberChanged"
    
    var chartIndex = 0 {
        didSet {
            prepareVBChart()
        }
    }
    
    var timeButtons : [UIButton] = []
    
    var date : String = "" {
        didSet {
            searchDailySheetByDate(date)
            prepareVBChart()
        }
    }
    
    var dailySheet : DailySheet? {
        didSet {
            refreshView()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tabBarController?.tabBar.isHidden = true
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        //为NavigationItem添加按钮，注意这个NavigationItem是谁的
        let item0 = UIBarButtonItem(title: "日", style: .plain, target: self, action: #selector(DailySheetViewController.segueToDailySheet))
        let item1 = UIBarButtonItem(title: "场", style: .plain, target: self, action: #selector(DailySheetViewController.segueToContinuitySheet))
        self.tabBarController?.tabBarController?.navigationItem.rightBarButtonItems = [item1,item0]
        
        date = "0711"
    }
    
    
    
    fileprivate func searchDailySheetByDate(_ date : String) {
        for dailySheet in DAILYSHEET {
            if dailySheet.date == date {
                self.dailySheet = dailySheet
            }
        }
    }
    
    fileprivate func refreshView(){
        let timeAxisView = DailySheetTimeAxisView()
        timeAxisView.frame = timeAxisReferenceView.frame
        timeAxisView.length = timeAxisReferenceView.frame.width - 100
        timeAxisView.x1 = timeAxisReferenceView.center.x - timeAxisView.length/2
        timeAxisView.backgroundColor = UIColor.white
        timeAxisView.y = timeAxisReferenceView.center.y
        timeAxisView.setNeedsDisplay()
        for sub in timeAxisReferenceView.subviews {
            sub.removeFromSuperview()
        }
        self.timeAxisReferenceView.addSubview(timeAxisView)
    }
    
    func segueToDailySheet() {
        self.tabBarController?.selectedIndex = 0
    }
    
    func segueToContinuitySheet() {
        self.tabBarController?.selectedIndex = 1
    }
    
    //  VBChartDataSource Func
    
    //
    func prepareVBChart() {
        
        for i in chartView.subviews {
            i.removeFromSuperview()
        }
        
        var vbChart = VBChartView.init(frame: chartView.bounds)
        vbChart = vbChart.initWithFrame(vbChart.frame, dataSource: self , ctl : self)
        vbChart.showInView(chartView)
    }
    
    //表标题
    func chartConfigTitle(_ chart : VBChartView) -> String {
        switch chartIndex {
        case 0:
            //工作时长
            return "工作时长"
        default:
            return "进度统计"
        }
    }
    
    //横坐标单位标题
    func chartConfigAxisYTitle(_ chart : VBChartView) -> String {
        switch chartIndex {
        case 0:
            //工作时长
            return "近7日"
        default:
            return "项目进度"
        }

    }
    
    //纵坐标单位标题
    func chartConfigAxisXTitle(_ chart : VBChartView) -> String {
        switch chartIndex {
        case 0:
            //工作时长
            return "时间(H)"
        default:
            return "项目完成度(P)"
        }

    }
    
    //横坐标标题数组
    func chartConfigAxisXLabel(_ chart : VBChartView) -> (NSArray) {
        switch chartIndex {
        case 0:
            //工作时长
            let dateInteger = (date as NSString).integerValue/10
            return ["\(dateInteger-3)" , "\(dateInteger-2)", "\(dateInteger-1)", "\(dateInteger)", "\(dateInteger+1)", "\(dateInteger+2)", "\(dateInteger+3)"]
        default:
            let dateInteger = (date as NSString).integerValue/10
            return ["\(dateInteger-3)" , "\(dateInteger-2)", "\(dateInteger-1)", "\(dateInteger)", "\(dateInteger+1)", "\(dateInteger+2)", "\(dateInteger+3)"]
        }
    }
    
    //数值多重数组
    func chartConfigAxisYValue(_ chart : VBChartView) -> (NSArray) {
        switch chartIndex {
        case 0:
            //工作时长
            return [["14" , "17", "24", "20", "19", "16", "22"]]
        default:
            return [["14" , "17", "24", "20", "19", "16", "22"],["15","30","45","60","75","90"]]
        }
    }
    
    //颜色数组
    func chartConfigColors(_ chart : VBChartView) -> (NSArray) {
        return [COLORS[3],COLORS[4],COLORS[5]]
    }
    
    //显示数值范围
    func chartRange(_ chart : VBChartView) -> (Range) {
        switch chartIndex {
        case 0:
            //工作时长
            return Range(max: 24, min: 0)
        default:
            return Range(max: 100, min: 0)
        }
    }
    
    //显示数值区域
    func chartHighlightRangeInLine(_ chart : VBChartView) -> (Range) {
        return Range(max: 1000, min: 0)
    }
    
    //判断显示横线条
    func showHorizonLineAtIndex(_ chart : VBChartView, index : NSInteger) -> (ObjCBool) {
        return true
    }
    
    //判断显示最大最小值
    func showMaxMinAtIndex(_ chart : VBChartView, index : NSInteger) -> (ObjCBool) {
        return true
    }
    
}
