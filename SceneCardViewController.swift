//
//  SceneCardViewController.swift
//  VistaBridge
//
//  Created by 齐晴 on 17/2/27.
//  Copyright © 2017年 GaryQi. All rights reserved.
//

import UIKit

class SceneCardViewController: UIViewController {
    
    var sceneNo = 0
    var screenplay_content : NSMutableAttributedString?
    var location = 0
    
    var sceneNumberTextView : UILabel = UILabel()
    var toolButtons : [UIButton] = []
    var contentTextView : UITextView = UITextView()
    var remarkTextField : UITextField = UITextField()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.frame.size = CGSize(width: 320, height: 180)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        if toolButtons.count != 0 {
            
            print(self.view.frame)
            
            let sFrame = self.view.frame
            sceneCard_K = sFrame.size.width / 16
            
            let sLabelFrame = CGRect(x: 0, y: 0, width: sceneNumberTextView_width, height: sceneNumberTextView_height)
            sceneNumberTextView.frame = sLabelFrame
            
            let cFrame = CGRect(x: 0, y: 2*sceneCard_K, width: contentTextView_width, height: contentTextView_height)
            contentTextView.frame = cFrame
            
            let rFrame = CGRect(x: 12*sceneCard_K, y: 2*sceneCard_K, width: remarkTextField_width, height: remarkTextField_height)
            remarkTextField.frame = rFrame
            
            var i : CGFloat = 0
            for j in 0...toolButtons.count-1 {
                let iX = 12*sceneCard_K + i*toolButtons_width
                let iY = 1*sceneCard_K
                let iFrame = CGRect(x: iX, y: iY, width: toolButtons_width, height: toolButtons_width)
                
                toolButtons[j].frame = iFrame
                i += 1
            }
            
        }
        
        
    }
    
    func prepareSceneCard(sceneNo : Int) {
        self.sceneNo = sceneNo
        let colors = [UIColor.green,UIColor.yellow,UIColor.red,UIColor.blue]
        
        sceneNumberTextView.text = "第 \(sceneNo) 场"
        screenplay_content = NSMutableAttributedString(string : getScreenplayContentBySceneNo(sceneNo : sceneNo))
        contentTextView.attributedText = screenplay_content
        remarkTextField.placeholder = "备注:"
        
        for i in 0...3 {
            let button = UIButton()
            button.tag = i
            button.addTarget(self, action: #selector(self.buttonTapped(sender:)), for: .touchUpInside)
            button.backgroundColor = colors[i]
            toolButtons.append(button)
        }
        
        self.view.addSubview(sceneNumberTextView)
        self.view.addSubview(contentTextView)
        self.view.addSubview(remarkTextField)
        for b in toolButtons {
            self.view.addSubview(b)
        }
    }
    
    private func getScreenplayContentBySceneNo(sceneNo : Int) -> String{
        
        let s = ScreenplayAssistant.init()
        
        let sceneInfo = "\(sceneNo)."
        let range1 = s.text_refScreenplay.range(of: sceneInfo)
        
        let nextSceneNo = sceneNo + 1
        let nextSceneInfo = "\(nextSceneNo)."
        let range2 = s.text_refScreenplay.range(of: nextSceneInfo)
        let range3 = NSRange.init(location: range1.location, length: range2.location-range1.location)
        print(range3.location)
        self.location = range1.location
        return s.text_refScreenplay.substring(with: range3)
    }
    
    func buttonTapped(sender : UIButton) {
        let tag = sender.tag
        switch tag {
        case 0 :
            //green
            setStatusForSceneNo(sceneNo:sceneNo, status:.green)
        case 1:
            //yellow
            setStatusForSceneNo(sceneNo:sceneNo, status:.yellow)
        case 2:
            //red
            setStatusForSceneNo(sceneNo:sceneNo, status:.red)
        default :
            //划掉
            let range = contentTextView.selectedRange
            if range.length != 0 {
                screenplay_content?.addAttribute(NSStrikethroughStyleAttributeName, value: 1.0, range: NSMakeRange(range.location, range.length))
                contentTextView.attributedText = screenplay_content
                screenplay_strike.append(VB_Range(location: range.location + self.location, length: range.length))
                
            }
            
            
        }
    }
    
    private func setStatusForSceneNo(sceneNo : Int , status : ShootingStatus) {
        for index in 0...SCENE_INFOS.count-1 {
            if SCENE_INFOS[index].sceneNo.number == sceneNo {
                SCENE_INFOS[index].sceneNo.status = status
                
                if status == .yellow {
                    var isExistInArry = false
                    
                    for sNo in ToBeChoosenScenesNo {
                        if sNo == sceneNo {
                            isExistInArry = true
                            break
                        }
                        
                    }
                    if isExistInArry == false {
                    ToBeChoosenScenesNo.append(sceneNo)
                    }
                }
                
                break
            }
            
            
        }
    }
    
}
