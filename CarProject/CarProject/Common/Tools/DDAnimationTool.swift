//
//  DDAnimationTool.swift
//  Mythsbears
//
//  Created by HJQ on 2017/11/11.
//  Copyright © 2017年 HJQ. All rights reserved.
//

import UIKit

// 动画工具
class DDAnimationTool: NSObject {

    static let shared = DDAnimationTool()
    private override init() {}
    
    private typealias  DDAnimationToolAnimationFinsh = () -> ()
    private var animationToolAnimationFinsh: DDAnimationToolAnimationFinsh?
    
    // 弹性动画显示和隐藏
    func showBoundsAnimation(containerView: UIView) {
        let animation = CAKeyframeAnimation.init(keyPath: "transform.scale")
        animation.values = [0.01, 1.2, 0.9, 1]
        animation.keyTimes = [0, 0.4, 0.6, 1]
        animation.timingFunctions = [
            CAMediaTimingFunction.init(name: kCAMediaTimingFunctionLinear),
            CAMediaTimingFunction.init(name: kCAMediaTimingFunctionLinear),
            CAMediaTimingFunction.init(name: kCAMediaTimingFunctionEaseOut)
        ]
        animation.duration = 5.0
        containerView.layer.add(animation, forKey: "bouce")
    }
    
    func hideBoundsAnimation(containerView: UIView, animationFinishBlock: (()->())?) {
        animationToolAnimationFinsh = animationFinishBlock
        let animation = CAKeyframeAnimation.init(keyPath: "transform.scale")
        animation.values = [1, 1.2, 0.01]
        animation.keyTimes = [0, 0.4, 1]
        animation.timingFunctions = [
            CAMediaTimingFunction.init(name: kCAMediaTimingFunctionEaseInEaseOut),
            CAMediaTimingFunction.init(name: kCAMediaTimingFunctionEaseOut)
        ]
        animation.delegate = self
        animation.duration = 0.35
        containerView.layer.add(animation, forKey: "bouce")
        containerView.transform = CGAffineTransform.init(scaleX: 0.01, y: 0.01)
    }
    
    
    // 从上掉下的动画
    func showFormTopDropdownAnimation(superView: UIView, containerView: UIView) {
        
        let y = containerView.center.y
        let animation = CAKeyframeAnimation.init(keyPath: "position.y")
        animation.values = [(y - superView.bounds.height), (y + 20), (y - 10), y]
        animation.keyTimes = [0, 0.5, 0.75, 1]
        animation.timingFunctions = [
            CAMediaTimingFunction.init(name: kCAMediaTimingFunctionEaseInEaseOut),
            CAMediaTimingFunction.init(name: kCAMediaTimingFunctionLinear),
            CAMediaTimingFunction.init(name: kCAMediaTimingFunctionEaseOut)
        ]
        animation.duration = 0.4
        containerView.layer.add(animation, forKey: "dropdown")
    }
    
    func hideFormTopDropdownAnimation(superView: UIView, containerView: UIView, animationFinishBlock: (()->())?) {
        var point = containerView.center
        point.y += superView.bounds.height
        
        UIView.animate(withDuration: 0.3, delay: 0, options: UIViewAnimationOptions.curveEaseIn, animations: {
            containerView.center = point
            let angle = (arc4random_uniform(100) - 50) / 100
            containerView.transform = CGAffineTransform.init(rotationAngle: CGFloat(angle))
        }) { (_) in
            if let _ = animationFinishBlock {
                animationFinishBlock!()
            }
        }
    }
}

// MARK: - CAAnimationDelegate
extension DDAnimationTool: CAAnimationDelegate {
    func animationDidStop(_ anim: CAAnimation, finished flag: Bool) {
        if let _ = animationToolAnimationFinsh {
            animationToolAnimationFinsh!()
        }
        
    }
}

