//
//  UILabel+Extensions.swift
//  Weather Alert
//
//  Created by Joey Clover on 11/03/2016.
//  Copyright © 2016 JustJoey. All rights reserved.
//

import UIKit


extension UILabel {
    
    var centered: UILabel { self.textAlignment = .Center; return self }
    
    func applyOxygenFont(fontSize:CGFloat = 100) -> UILabel {
        self.font = UIFont(name: "Oxygen-Regular", size: fontSize);
        return self
    }
    
    func applyAutoSize(minFontSize:Float = 10, maxFontSize:Float = 100) -> UILabel {
        self.numberOfLines = 0
        self.lineBreakMode = .ByClipping
        self.adjustsFontSizeToFitWidth = true
        self.minimumScaleFactor = CGFloat(minFontSize / maxFontSize)
        
        return self
    }
    
    func applyColor(color:UIColor) -> UILabel { self.textColor = color; return self }
    
}