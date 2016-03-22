//
//  ModifyCitiesDatasource.swift
//  Weather Alert
//
//  Created by Joey Clover on 22/03/2016.
//  Copyright © 2016 JustJoey. All rights reserved.
//

import UIKit
import RealmSwift


@objc class ModifyCitiesDatasource : NSObject, UITableViewDataSource {
    
    let cities:Results<City>
    
    init(cities:Results<City>) {
        self.cities = cities
        super.init()
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCellWithIdentifier("ModifyCityCell", forIndexPath: indexPath) as? ModifyCityCell
        else { return UITableViewCell() }
        
        let city = cities[indexPath.row]
        
        cell.textLabel?.text = city.name
        
        return cell
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cities.count
    }
    
    func tableView(tableView: UITableView, moveRowAtIndexPath sourceIndexPath: NSIndexPath, toIndexPath destinationIndexPath: NSIndexPath) {
        
    }
    
    func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    
    func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    
}