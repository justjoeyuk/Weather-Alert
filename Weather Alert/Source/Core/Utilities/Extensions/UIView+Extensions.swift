//
//  UIView+Extensions.swift
//  Weather Alert
//
//  Created by Joey Clover on 11/03/2016.
//  Copyright © 2016 JustJoey. All rights reserved.
//

import UIKit


extension UIView {
    
    /** Sets clipsToBounds to `true` */
    func applyClipping() -> Self { self.clipsToBounds = true; return self }
    
    /** Sets backgroundColor to the given color */
    func applyColor(color:UIColor) -> Self { self.backgroundColor = color; return self }
    
    /** Applies a permanent semi-transparent overlay above the view with the given color */
    func applyOverlay(color:UIColor = UIColor.darkTransparentColor()) -> Self {
        let overlay = UIView().applyColor(color)
        
        self.addSubview(overlay)
        overlay.snp_makeConstraints { make in make.edges.equalTo(self) }
        
        return self
    }
    
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
        rotation.removedOnCompletion = false
        
        layer.addAnimation(rotation, forKey: "Spin")
    }
    
    /**
     Stops the infinite rotation animation applied to a UIView
    */
    func stopRotationAnimation() {
        if let presentationLayer = layer.presentationLayer() {
            layer.transform = presentationLayer.transform
        }
        
        //layer.removeAnimationForKey("Spin")
    }
    
}