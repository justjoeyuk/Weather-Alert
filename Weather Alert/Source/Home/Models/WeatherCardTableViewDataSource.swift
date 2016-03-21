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
        realm = try! Realm()
        cityList = realm.objects(City.self)
        
        super.init()
        
        self.token = realm.objects(City.self).addNotificationBlock { results, error in
            guard let results = results else { return }
            self.cityList = results
            
            self.tableView?.reloadData()
        }
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCellWithIdentifier("WeatherCardCell", forIndexPath: indexPath) as? WeatherCardTableViewCell else { return UITableViewCell() }
        let city = cityList[indexPath.row]
    
        let currentTime = NSDate().timeIntervalSince1970
        let maxOffset:Double = 10800
        let offsetFilterMax = currentTime + (maxOffset - 1)
        
        // This could have been done in a more efficient manner, but for the sake of time, it wasn't.
        guard let forecast = realm.objects(Forecast.self).filter("cityId = %@ AND time < %d AND time > %d", city.id, offsetFilterMax, currentTime).first else { return cell }
        let windDirection = Double(forecast.windDirection)
        let windSpeed = Double(forecast.windSpeed)
        
        cell.cityLabel.text = city.name
        cell.windSpeedLabel.text = "\(windSpeed) mph"
        cell.windStrengthLabel.text = windDescriptionFromSpeed(windSpeed)
        cell.windDirectionLabel.text = "SW"
        cell.windDirectionView.setWindDirection(windDirection)
        
        cell.backgroundImageView.kf_setImageWithURL(NSURL(string: city.imageUrl)!, placeholderImage: cityPlaceholderImage)
        
        cell.animatedTurbineView.applyRotationAnimation(100.0/25)
        cell.updateWithModel(nil)
        
        return cell
    }
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.cityList.count
    }
    
}