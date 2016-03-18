//
//  AnimatedTurbineView.swift
//  Weather Alert
//
//  Created by Joey Clover on 17/03/2016.
//  Copyright © 2016 JustJoey. All rights reserved.
//

import UIKit


class AnimatedTurbineView : UIImageView {
    
    convenience init() {
        self.init(frame:CGRectZero)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        image = UIImage.Asset.Turbine.image
        contentMode = .ScaleAspectFit
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}