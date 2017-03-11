//
//  ButtonCell.swift
//  VistaBridge
//
//  Created by 齐晴 on 16/9/7.
//  Copyright © 2016年 GaryQi. All rights reserved.
//

import UIKit

struct ButtonIndexpath {
    let section : Int
    let row : Int
}

class ButtonCell: UICollectionViewCell {
    

    @IBOutlet weak var button: UIButton!
    
    var indexPath : ButtonIndexpath!
    var title : String = ""
    

    
    @IBAction func scheduleChanged(_ sender: UIButton) {
        //角色
        //characters[indexPath.row - 1]
        //日期
        //dates[indexPath.section - 1]
        
        var castID : Int = 0
        
        //找到演员
        for cast in  CAST {
            if cast.characterID == characters[indexPath.row - 1].ID {
                castID = cast.castID
            }
        }
        
        var actDates : [String]? = nil
        var cast : CastScheduleCell? = nil
        var index : Int = 0
        
        if castID != 0 {
            for castTmp in CastSchedule {
                if castTmp.castID == castID {
                    actDates = castTmp.availableDates
                    cast = castTmp
                    break
                }
                index += 1
            }
        }
        //寻找档期
        if actDates != nil {
            var i : Int = 0
            for d in actDates! {
                if d == dates[indexPath.section - 1] {
                    //找到档期
                    actDates!.remove(at: i)
                    button.tintColor = UIColor.red
                    CastSchedule[index].availableDates = actDates!
                    return
                }
                i += 1
            }
            
            //没有找到档期
            actDates!.append(dates[indexPath.section - 1])
            CastSchedule[index].availableDates = actDates!
            button.tintColor = characters[indexPath.row - 1].color
        }
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        button.setTitle(title, for: .normal)
        button.titleLabel?.textAlignment = .center
        button.titleLabel?.bounds.size = button.bounds.size
        button.sizeToFit()
    }
    
}
