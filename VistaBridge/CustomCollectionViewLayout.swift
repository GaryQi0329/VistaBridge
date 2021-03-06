//
//  CustomCollectionViewLayout.swift
//  CustomCollectionLayout
//
//  Created by JOSE MARTINEZ on 15/12/2014.
//  Copyright (c) 2014 brightec. All rights reserved.
//

import UIKit

class CustomCollectionViewLayout: UICollectionViewLayout {
    
    let numberOfColumns = characters.count + 1
    var itemAttributes : NSMutableArray!
    var itemsSize : NSMutableArray!
    var contentSize : CGSize!
    
    override func prepare() {
        if self.collectionView?.numberOfSections == 0 {
            return
        }
        
        if (self.itemAttributes != nil && self.itemAttributes.count > 0) {
            for section in 0..<self.collectionView!.numberOfSections {
                let numberOfItems : Int = self.collectionView!.numberOfItems(inSection: section)
                for index in 0..<numberOfItems {
                    if section != 0 && index != 0 {
                        continue
                    }
                    
                    let attributes : UICollectionViewLayoutAttributes = self.layoutAttributesForItem(at: IndexPath(item: index, section: section))
                    if section == 0 {
                        var frame = attributes.frame
                        frame.origin.y = self.collectionView!.contentOffset.y   //从这里可以看出，colectionView的滑动，是外面的框在滑动！所以此时显示在左上的点的坐标是 contentoffset.y!
                        attributes.frame = frame
                    }
                    
                    if index == 0 {
                        var frame = attributes.frame
                        frame.origin.x = self.collectionView!.contentOffset.x
                        attributes.frame = frame
                    }
                }
            }
            return
        }
        
        if (self.itemsSize == nil || self.itemsSize.count != numberOfColumns) {
            self.calculateItemsSize()
        }
        
        var column = 0
        var xOffset : CGFloat = 0
        var yOffset : CGFloat = 0
        var contentWidth : CGFloat = 0
        var contentHeight : CGFloat = 0
        
        for section in 0..<self.collectionView!.numberOfSections {
            let sectionAttributes = NSMutableArray()
            
            for index in 0..<numberOfColumns {
                let itemSize = (self.itemsSize[index] as AnyObject).cgSizeValue
                let indexPath = IndexPath(item: index, section: section)
                let attributes = UICollectionViewLayoutAttributes(forCellWith: indexPath)
                attributes.frame = CGRect(x: xOffset, y: yOffset, width: (itemSize?.width)!, height: (itemSize?.height)!).integral
                
                if section == 0 && index == 0 {
                    attributes.zIndex = 1024;
                } else  if section == 0 || index == 0 {
                    attributes.zIndex = 1023
                }
                
                if section == 0 {
                    var frame = attributes.frame
                    frame.origin.y = self.collectionView!.contentOffset.y
                    //                    frame.origin.y += frame.origin.y - 400
                    attributes.frame = frame
                }
                if index == 0 {
                    var frame = attributes.frame
                    frame.origin.x = self.collectionView!.contentOffset.x
                    attributes.frame = frame
                }
                
                sectionAttributes.add(attributes)
                
                xOffset += (itemSize?.width)!
                column += 1
                
                if column == numberOfColumns {
                    if xOffset > contentWidth {
                        contentWidth = xOffset
                    }
                    
                    column = 0
                    xOffset = 0
                    yOffset += (itemSize?.height)!
                    
                }
                
            }
            if (self.itemAttributes == nil) {
                self.itemAttributes = NSMutableArray(capacity: self.collectionView!.numberOfSections)
            }
            self.itemAttributes .add(sectionAttributes)
        }
        
        let attributes : UICollectionViewLayoutAttributes = (self.itemAttributes.lastObject as AnyObject).lastObject as! UICollectionViewLayoutAttributes
        contentHeight = attributes.frame.origin.y + attributes.frame.size.height
        self.contentSize = CGSize(width: contentWidth, height: contentHeight)
    }
    
    override var collectionViewContentSize : CGSize {
        return self.contentSize
    }
    
    override func layoutAttributesForItem(at indexPath: IndexPath) -> UICollectionViewLayoutAttributes {
        
        let tempt = self.itemAttributes[indexPath.section] as! [UICollectionViewLayoutAttributes]
        
        return tempt[indexPath.row] as! UICollectionViewLayoutAttributes
    }
    
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        var attributes = [UICollectionViewLayoutAttributes]()
        if self.itemAttributes != nil {
            for section in self.itemAttributes {
                
                let filteredArray  =  (section as! NSArray).filtered(using: NSPredicate(block: {(evaluatedObject, bindings) -> Bool in
                        return rect.intersects((evaluatedObject as! UICollectionViewLayoutAttributes).frame)})
                    ) as! [UICollectionViewLayoutAttributes]
                
                
                attributes.append(contentsOf: filteredArray)
                
            }
        }
        
        return attributes
    }
    
    override func shouldInvalidateLayout(forBoundsChange newBounds: CGRect) -> Bool {
        return true
    }
    
    func sizeForItemWithColumnIndex(_ columnIndex: Int) -> CGSize {
        var text : String = ""
        switch (columnIndex) {
        case 0:
            text = "Col 0"
        case 1:
            text = "Col 1"
        case 2:
            text = "Col 2"
        case 3:
            text = "Col 3"
        case 4:
            text = "Col 4"
        case 5:
            text = "Col 5"
        case 6:
            text = "Col 6"
        default:
            text = "Col 7"
        }
        
        
        //计算每个Item的大小
        let size : CGSize = (text as NSString).size(attributes: [NSFontAttributeName: UIFont.systemFont(ofSize: 17.0)])
        let width2 = UIScreen.main.bounds.width/20
        let width : CGFloat = size.width + 40
        let height = UIScreen.main.bounds.height/15
        
        if columnIndex != 0 {
            return CGSize(width: width2, height: height)
        }
        return CGSize(width: width,height: height)
    }
    
    func calculateItemsSize() {
        self.itemsSize = NSMutableArray(capacity: numberOfColumns)
        for index in 0..<numberOfColumns {
            self.itemsSize.add(NSValue(cgSize: self.sizeForItemWithColumnIndex(index)))
        }
    }
}
