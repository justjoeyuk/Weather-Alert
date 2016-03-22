//
//  ModifyCitiesView.swift
//  Weather Alert
//
//  Created by Joey Clover on 22/03/2016.
//  Copyright © 2016 JustJoey. All rights reserved.
//

import UIKit


class ModifyCitiesView : BaseView {
    
    let tableView = UITableView()
    
    override func setup() {
        tableView.backgroundColor = UIColor.darkBackgroundColor()
        addSubview(tableView)
    }
    
}


extension ModifyCitiesView {
    
    override func setupConstraints() {
        tableView.snp_makeConstraints { make in
            make.edges.equalTo(self)
        }
    }
    
}