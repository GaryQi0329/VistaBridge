//
//  ConstantAboutSceneCard.swift
//  VistaBridge
//
//  Created by 齐晴 on 17/2/27.
//  Copyright © 2017年 GaryQi. All rights reserved.
//

import Foundation
import UIKit
var sceneNumberTextView_width : CGFloat = 120
var sceneNumberTextView_height : CGFloat = 0

var toolButtons_width : CGFloat = 15

var contentTextView_height : CGFloat = 0
var contentTextView_width : CGFloat = 0

var remarkTextField_height : CGFloat = 0
var remarkTextField_width : CGFloat = 0

var sceneCard_K : CGFloat = 0 {
didSet {
    
    sceneNumberTextView_height = 2*sceneCard_K
    
    contentTextView_height = 7*sceneCard_K
    contentTextView_width = 12*sceneCard_K
    
    remarkTextField_height = 7*sceneCard_K
    remarkTextField_width = 4*sceneCard_K

}
}
