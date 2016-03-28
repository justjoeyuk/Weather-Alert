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
        
        self.subscribeToCityChanges()
        self.updateOutdatedForecasts()
    }
    
    private func subscribeToCityChanges() {
        self.token = cityList.addNotificationBlock { results, error in
            guard let results = results else { return }
            self.cityList = results
            
            self.tableView?.reloadData()
        }
    }
    
    private func updateOutdatedForecasts() {
        cityList.forEach { city in
            city.updateForecasts {_,_ in}
        }
    }
    
    
    // MARK: UITableViewDataSource Methods
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCellWithIdentifier(kWeatherCardCellIdentifier, forIndexPath: indexPath) as? WeatherCardTableViewCell else { return UITableViewCell() }
        
        let city = cityList[indexPath.row]
        
        // Attempt to get the active forecast, else resort to the upcoming forecast. This is 
        // because when we have just added the city, we don't have the active forecast for it.
        let activeForecast = Forecast.getForecastForCity(city, forTime: NSDate(), inRealm: realm)
        let nextForecast = Forecast.getNextForecastForCity(city, realm: realm)
        
        cell.updateWithCity(city, forecast: activeForecast ?? nextForecast)
        return cell
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.cityList.count
    }
    
}