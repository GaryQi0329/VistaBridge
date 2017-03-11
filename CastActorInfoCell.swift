//
//  CastActorInfoCell.swift
//  VistaBridge
//
//  Created by 齐晴 on 16/9/21.
//  Copyright © 2016年 GaryQi. All rights reserved.
//

import UIKit

class CastActorInfoCell: UITableViewCell {

    @IBOutlet weak var actorNameLabel: UILabel!
    @IBOutlet weak var actorMakeupButton: UIButton!
    @IBOutlet weak var actorWardrobeButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
