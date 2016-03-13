//
//  BaseCollectionViewCell.swift
//  Weather Alert
//
//  Created by Joey Clover on 12/03/2016.
//  Copyright © 2016 JustJoey. All rights reserved.
//

import UIKit


class BaseCollectionViewCell : UICollectionViewCell {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setup()
        setupConstraints()
    }
    
    required convenience init?(coder aDecoder: NSCoder) {
        self.init(frame: CGRectZero)
    }
    
    func setup() {
    }
    
}


extension BaseCollectionViewCell {
    
    func setupConstraints() {
    }
    
}