//
//  ModifyCityCell.swift
//  Weather Alert
//
//  Created by Joey Clover on 22/03/2016.
//  Copyright © 2016 JustJoey. All rights reserved.
//

import UIKit

class ModifyCityCell : BaseTableViewCell {
    
    override var alpha: CGFloat { didSet { super.alpha = 1 } }
    
    override func setup() {
        self.backgroundView = UIView()
        self.backgroundView?.backgroundColor = UIColor.whiteColor()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.setEditing(false, animated: false)
    }
    
}