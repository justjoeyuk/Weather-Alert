//
//  UIScrollView+Extensions.swift
//  Weather Alert
//
//  Created by Joey Clover on 17/03/2016.
//  Copyright © 2016 JustJoey. All rights reserved.
//

import UIKit


extension UIScrollView {
    
    func stopScrolling() {
        self.setContentOffset(self.contentOffset, animated: false)
    }
    
}