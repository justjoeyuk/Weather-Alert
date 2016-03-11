//
//  UIView+Extensions.swift
//  Weather Alert
//
//  Created by Joey Clover on 11/03/2016.
//  Copyright © 2016 JustJoey. All rights reserved.
//

import UIKit


extension UIView {
    
    /**
     Applies an infinite rotation animation to the UIView that takes the given amount of time to complete
     
     - parameter timePerSpin: The amount of time (in seconds) for animation to complete one loop
    */
    func applyRotationAnimation(timePerSpin:CFTimeInterval) {
        stopRotationAnimation()
        
        let rotation = CABasicAnimation(keyPath: "transform.rotation")
        rotation.fromValue = NSNumber(float:0)
        rotation.toValue = NSNumber(double: 2 * M_PI)
        rotation.duration = timePerSpin
        rotation.repeatCount = Float.infinity
        
        layer.addAnimation(rotation, forKey: "Spin")
    }
    
    /**
     Stops the infinite rotation animation applied to a UIView
    */
    func stopRotationAnimation() {
        if let presentationLayer = layer.presentationLayer() {
            layer.transform = presentationLayer.transform
        }
        
        layer.removeAnimationForKey("Spin")
    }
    
}