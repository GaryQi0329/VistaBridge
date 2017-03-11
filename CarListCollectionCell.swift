//
//  CarListCollectionCell.swift
//  VistaBridge
//
//  Created by 齐晴 on 17/3/9.
//  Copyright © 2017年 GaryQi. All rights reserved.
//

import UIKit

class CarListCollectionCell: UICollectionViewCell {
    
    @IBOutlet weak var driverName: UILabel!
    @IBOutlet weak var carName: UILabel!
    @IBOutlet weak var plateNumber: UILabel!
    
    var driverTel : String?
}
