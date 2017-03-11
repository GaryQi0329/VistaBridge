//
//  SetDressingCell.swift
//  VistaBridge
//
//  Created by 齐晴 on 16/12/31.
//  Copyright © 2016年 GaryQi. All rights reserved.
//

import UIKit

class SetDressingCell: UITableViewCell {
    
    @IBOutlet weak var label_setName: UILabel!
    @IBOutlet weak var label_setCompletionDate: UILabel!
    @IBOutlet weak var rightView: UIView!
    
    var images : [String] = []
    let containerView = UIView()
    let NotificationName_ZoomInImage = "NotificationName_ZoomInImage"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    func prepareScrollViewForImages(_ setID : Int){
        
        let refFrame = rightView.frame
        let scrFrame = CGRect(x: 20, y: 20, width: refFrame.size.width - 40, height: refFrame.size.height - 50)
        let scrView = UIScrollView(frame: scrFrame)
        
        for set in sets {
            if set.ID == setID {
                images = set.images
            }
            
            if images != [] {
                
                var point_x : CGFloat = 0
                let point_y : CGFloat = 0
                let size_width : CGFloat = 120.0
                let size_height = scrView.frame.size.height
                
                let n = images.count
                
                containerView.frame =  CGRect(x: 0, y: 0, width: size_width * CGFloat(n), height: size_height)
                
                for imageName in images {
                    let image = UIImage(named: imageName)
                    let imageView = UIImageView(image: image)
                    imageView.frame = CGRect(x: point_x, y: point_y, width: size_width, height: size_height)
                    
                    //Add GestureRecognizers
                    imageView.isUserInteractionEnabled = true
                    let tapGesture = UITapGestureRecognizer(target: self, action: #selector(SetDressingCell.imageTaped(_:)))
                    imageView.addGestureRecognizer(tapGesture)
                    
                    containerView.addSubview(imageView)
                    point_x += 120
                    
                }
                
                scrView.contentSize = containerView.frame.size
                scrView.addSubview(containerView)
            }
            
            rightView.addSubview(scrView)
        }
        
    }
    
    func imageTaped(_ gesture: UITapGestureRecognizer) {
        let point = gesture.location(in: containerView)
        let index = Int(point.x/120)
        NotificationCenter.default.post(name: Notification.Name(rawValue: NotificationName_ZoomInImage), object: self, userInfo: ["ImageName" : images[index]])
        print(images)
    }
    
}
