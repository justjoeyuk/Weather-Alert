//
//  WeatherCardTableViewDataSource.swift
//  Weather Alert
//
//  Created by Joey Clover on 11/03/2016.
//  Copyright © 2016 JustJoey. All rights reserved.
//

import UIKit
import RealmSwift
import Kingfisher


@objc class WeatherCardTableViewDataSource : NSObject, UITableViewDataSource {
    
    weak var tableView:UITableView?
    
    var cityList:Results<City>
    var realm: Realm
    var token: NotificationToken?
    
    
    override init() {
        do { self.realm = try Realm() } catch { fatalError("Could not create Realm \(error)") }
        cityList = realm.objects(City.self).sorted("priority", ascending: true)
        
        super.init()
        
        self.token = cityList.addNotificationBlock { results, error in
            guard let results = results else { return }
            self.cityList = results
            
            self.tableView?.reloadSections(NSIndexSet(index: 0), withRowAnimation: UITableViewRowAnimation.Automatic)
        }
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCellWithIdentifier("WeatherCardCell", forIndexPath: indexPath) as? WeatherCardTableViewCell else { return UITableViewCell() }
        
        let city = cityList[indexPath.row]
        guard let forecast = Forecast.getLatestForecastForCity(city, realm: realm) else { return cell }
        
        cell.updateWithCity(city, forecast: forecast)
        return cell
    }
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.cityList.count
    }
    
}