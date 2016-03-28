//
//  ModifyCitiesViewController.swift
//  Weather Alert
//
//  Created by Joey Clover on 22/03/2016.
//  Copyright © 2016 JustJoey. All rights reserved.
//

import UIKit
import RealmSwift


class ModifyCitiesViewController : BaseVC {
    
    let datasource: ModifyCitiesDatasource
    var modifyView: ModifyCitiesView { return self.view as! ModifyCitiesView }
    
    
    init(cities:Results<City>) {
        self.datasource = ModifyCitiesDatasource(cities: cities)
        super.init()
    }

    required init() {
        fatalError("init() has not been implemented - use init(cities)")
    }
    
    override func loadView() {
        self.view =  ModifyCitiesView()
    }
    
    override func viewDidLoad() {
        title = "Cities".localized
        
        modifyView.tableView.registerClass(ModifyCityCell.self, forCellReuseIdentifier: kModificationCellIdentifier)
        modifyView.tableView.dataSource = datasource
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .Done, target: self, action: #selector(ModifyCitiesViewController.completeModify))
        modifyView.tableView.setEditing(true, animated: true)
    }
    
    func completeModify() {
        self.navigationController?.popToRootViewControllerAnimated(true)
    }
    
}