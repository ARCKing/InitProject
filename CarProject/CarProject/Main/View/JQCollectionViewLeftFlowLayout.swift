//
//  JQCollectionViewLeftFlowLayout.swift
//  Mythsbears
//
//  Created by HJQ on 2017/11/6.
//  Copyright © 2017年 HJQ. All rights reserved.
//

import UIKit

class JQCollectionViewLeftFlowLayout: UICollectionViewFlowLayout {
    // 需要外部设置才起作用 直接
    var jqminimumInteritemSpacing: CGFloat = 0.0
    
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        guard let attrsArry = super.layoutAttributesForElements(in: rect) else {
            return nil
        }
        for i in 0..<attrsArry.count {
            if i != attrsArry.count-1 {
                let curAttr = attrsArry[i] //当前attr
                let nextAttr = attrsArry[i + 1]  //下一个attr
                //如果下一个在同一行则调整，不在同一行则跳过
                if curAttr.frame.minY == nextAttr.frame.minY {
                    if nextAttr.frame.minX - curAttr.frame.minX > minimumInteritemSpacing{//
                        var frame = nextAttr.frame
                        let x = curAttr.frame.maxX + jqminimumInteritemSpacing
                        frame = CGRect(x: x, y: frame.minY, width: frame.width, height: frame.height)
                        nextAttr.frame = frame
                    }
                }
            }
        }
        return attrsArry
    }
}
