//
//  WindDirectionView.swift
//  Weather Alert
//
//  Created by Joey Clover on 17/03/2016.
//  Copyright © 2016 JustJoey. All rights reserved.
//

import UIKit


class WindDirectionView : UIImageView {
    
    convenience init() {
        self.init(frame:CGRectZero)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        image = UIImage.Asset.Arrow.image
        contentMode = .ScaleAspectFit
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    /**
      Sets the rotation of the view based on the given value.
      
      - parameter degrees: The direction of the wind, in degrees
    */
    func setWindDirection(degrees:Double) {
        let transform = CGAffineTransformRotate(CGAffineTransformIdentity, CGFloat(DegreesToRadians(degrees)));
        self.transform = transform;
    }
    
}