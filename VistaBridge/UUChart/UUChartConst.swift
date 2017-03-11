//
//  UUChartConst.swift
//  UUChartView-swift
//
//  Created by chen on 16/9/5.
//  Copyright © 2016年 jie. All rights reserved.
//

import UIKit
import Foundation



struct Range {
    var max:CGFloat!
    var min:CGFloat!
}

func CGRangeMake (_ max : CGFloat, min : CGFloat) -> (Range){
    var p:Range! = Range()
    p.max = max
    p.min = min
    return p
}



let chartMargin:CGFloat! = 10.0
let xLabelMargin:CGFloat! = 15.0
let yLabelMargin:CGFloat! = 15.0
let UULabelHeight:CGFloat! = 10.0

let UUYLabelLevelCount:CGFloat! = 6.0   //横坐标有几个
let UUYLineLevelCount:CGFloat! = 9.0   //横线有几个
let UUTagLabelwidth:CGFloat! = 80.0

class UUChartConst: UIColor {
    
    class func randomColor () -> (UIColor){
        return UIColor(red: CGFloat(CGFloat(arc4random()%255)/CGFloat(RAND_MAX)), green: CGFloat(CGFloat(arc4random()%255)/CGFloat(RAND_MAX)), blue: CGFloat(CGFloat(arc4random()%255)/CGFloat(RAND_MAX)), alpha: 1.0)
    }
    
    class func randomColorDeep () -> (UIColor){
        return UIColor(red: CGFloat(CGFloat(arc4random()%100 + 55)/CGFloat(RAND_MAX)), green: CGFloat(CGFloat(arc4random()%100 + 55)/CGFloat(RAND_MAX)), blue: CGFloat(CGFloat(arc4random()%100 + 55)/CGFloat(RAND_MAX)), alpha: 1.0)
    }
    
    class func randomColorlight () -> (UIColor) {
        return UIColor(red: CGFloat(CGFloat(arc4random()%155 + 55)/CGFloat(RAND_MAX)), green: CGFloat(CGFloat(arc4random()%155 + 55)/CGFloat(RAND_MAX)), blue: CGFloat(CGFloat(arc4random()%155 + 55)/CGFloat(RAND_MAX)), alpha: 1.0)
    }
    
    class func red () -> (UIColor) {
        return UIColor(red: 245.0/255.0, green: 94.0/255.0, blue: 78.0/255.0, alpha: 1.0)
    }
    
    class func green () -> (UIColor) {
        return UIColor(red: 77.0/255.0, green: 186.0/255.0, blue: 122.0/255.0, alpha: 1.0)
    }
    
    class func brown () -> (UIColor) {
        return UIColor(red: 119.0/255.0, green: 107.0/255.0, blue: 95.0/255.0, alpha: 1.0)
    }
    
    class func getRandomByNum (_ num : Int) -> (CGFloat) {
        return CGFloat(CGFloat(arc4random()%6 + 100)/CGFloat(RAND_MAX))
    }
}
