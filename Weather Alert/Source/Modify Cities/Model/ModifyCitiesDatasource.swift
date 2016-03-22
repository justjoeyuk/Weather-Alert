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
    let realm:Realm
    
    init(cities:Results<City>) {
        do { self.realm = try Realm() } catch { fatalError("Could not create Realm \(error)") }
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
        let sourcePriority = sourceIndexPath.row
        let destPriority = destinationIndexPath.row
        
        let sourceCity = cities[sourcePriority]
        let destCity = cities[destPriority]
        
        do {
            try realm.write {
                sourceCity.priority = destPriority
                destCity.priority = sourcePriority
            }
        }
        catch { print("Problem changing priority of cities \(error)") }
    }
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        guard editingStyle == .Delete else { return }
        let cityToDelete = cities[indexPath.row]
        
        let lowerCities = realm.objects(City.self).filter("priority > %d", cityToDelete.priority)
        
        do {
            try realm.write {
                lowerCities.forEach { city in
                    city.priority -= 1
                }
                
                realm.delete(realm.objects(Forecast.self).filter("cityId == %@", cityToDelete.id))
                realm.delete(cityToDelete)
            }
        }
        catch { print("Problem deleting city \(error)") }
        
        tableView.reloadData()
    }
    
    func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    
    func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    
}