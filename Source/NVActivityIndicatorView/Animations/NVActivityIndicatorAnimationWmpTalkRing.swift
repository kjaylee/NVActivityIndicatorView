//
//  NVActivityIndicatorAnimationWmpTalkRing.swift
//  NVActivityIndicatorView
//
//  Created by we on 2018. 5. 30..
//

import UIKit

class NVActivityIndicatorAnimationWmpTalkRing: NVActivityIndicatorAnimationDelegate {
    func setUpAnimation(in layer: CALayer, size: CGSize, color: UIColor) {
        let duration: CFTimeInterval = 0.75
        
        
        
        // Rotate animation
        let rotateAnimation = CAKeyframeAnimation(keyPath: "transform.rotation.z")
        
        rotateAnimation.keyTimes = [0, 0.5, 1]
        rotateAnimation.values = [0, Double.pi, 2 * Double.pi]
        
        // Animation
        let animation = CAAnimationGroup()
        
        animation.animations = [rotateAnimation]
        animation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionLinear)
        animation.duration = duration
        animation.repeatCount = HUGE
        animation.isRemovedOnCompletion = false
        
        
        // Draw circle
        
        let ring = NVActivityIndicatorShape.ring.layerWith(size: CGSize(width: size.width, height: size.height),
                                                           color: color)
        let frame = CGRect(x: (layer.bounds.size.width - size.width) / 2,
                           y: (layer.bounds.size.height - size.height) / 2,
                           width: size.width,
                           height: size.height)
        
        ring.frame = frame
        layer.addSublayer(ring)
        
        let circle = NVActivityIndicatorShape.ringHalf.layerWith(size: CGSize(width: size.width, height: size.height), color: UIColor(red:0.34, green:0.49, blue:0.83, alpha:1.00))
        circle.frame = frame
        circle.add(animation, forKey: "animation")
        layer.addSublayer(circle)
    }
}
