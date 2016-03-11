//
//  BaseTableViewCell.swift
//  Weather Alert
//
//  Created by Joey Clover on 11/03/2016.
//  Copyright © 2016 JustJoey. All rights reserved.
//

import UIKit


class BaseTableViewCell : UITableViewCell {
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setup()
        setupConstraints()
    }
    
    required convenience init?(coder aDecoder: NSCoder) {
        self.init(style: .Default, reuseIdentifier:"Cell")
    }
    
    func setup() {
    }
    
}


extension BaseTableViewCell {
    
    func setupConstraints() {
    }
    
}