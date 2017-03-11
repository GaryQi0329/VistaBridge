//
//  ContinuitySheetCell.swift
//  VistaBridge
//
//  Created by 齐晴 on 16/9/19.
//  Copyright © 2016年 GaryQi. All rights reserved.
//

import UIKit

class ContinuitySheetCell: UITableViewCell {
    
    @IBOutlet weak var rollNumberLabel: UILabel!
    @IBOutlet weak var fileNumberLabel: UILabel!
    @IBOutlet weak var sceneNumberLabel: UILabel!
    @IBOutlet weak var shotNumberLabel: UILabel!
    @IBOutlet weak var takeNumberLabel: UILabel!
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var synopsisLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    func prepareContinuitySheetCell(_ infos:ContinuitySheetRecording) {
        rollNumberLabel.text = infos.rollNumber
        fileNumberLabel.text = infos.fileNumber
        sceneNumberLabel.text = String(infos.sceneNumber)
        shotNumberLabel.text = String(infos.shotNumber)
        takeNumberLabel.text = String(infos.takeNumber)
        resultLabel.text = shootingResultToString(infos.result)
        synopsisLabel.text = getSynopsis(infos)
    }
    
    func prepareContinuitySheetCell() {
        rollNumberLabel.text = "卷"
        fileNumberLabel.text = "文件"
        sceneNumberLabel.text = "场"
        shotNumberLabel.text = "镜"
        takeNumberLabel.text = "次"
        resultLabel.text = "评价"
        synopsisLabel.text = "简介"
    }
    
    fileprivate func shootingResultToString(_ result:ShootingResult) -> String{
        switch result {
        case .ok : return "OK"
        case .ng : return "NG"
        case .kp : return "KP"
        }
    }
    
    fileprivate func getSynopsis(_ infos:ContinuitySheetRecording) ->String{
        //得到synopsis
        if infos.shotSize != nil {
            if infos.synopsis != nil {
                return synopsisCombineShotSize(infos.shotSize!, synopsis: infos.synopsis!)
            } else {
                return getShotSize(infos.shotSize!)
            }
            
        }
        
        if infos.synopsis != nil {
            return infos.synopsis!
        } else {
            return ""
        }
    }
    
    fileprivate func getShotSize(_ shotSize:ShotSize) -> String {
        //转化shotSize为String
        switch shotSize {
        case .xls : return "远 - "
        case .vls : return "大全 - "
        case .ls : return "全 - "
        case .mls : return "中 - "
        case .ms : return "中近 - "
        case .mcu : return "近 - "
        case .cu : return "特 - "
        case .bcu : return "大特 - "
        case .ecu : return "局部大特 - "
            
        }
    }
    
    fileprivate func synopsisCombineShotSize(_ shotSize:ShotSize,synopsis:String) -> String{
        //得到synopsis的子方法
        switch shotSize {
        case .xls : return getShotSize(shotSize) + synopsis
        case .vls : return getShotSize(shotSize) + synopsis
        case .ls : return getShotSize(shotSize) + synopsis
        case .mls : return getShotSize(shotSize) + synopsis
        case .ms : return getShotSize(shotSize) + synopsis
        case .mcu : return getShotSize(shotSize) + synopsis
        case .cu : return getShotSize(shotSize) + synopsis
        case .bcu : return getShotSize(shotSize) + synopsis
        case .ecu : return getShotSize(shotSize) + synopsis
        }
    }
    
}
