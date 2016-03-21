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
        
        cell.cityLabel.text = city.name
        cell.windSpeedLabel.text = "20 mph"
        cell.windStrengthLabel.text = windDescriptionFromSpeed(25)
        cell.windDirectionLabel.text = "SW"
        cell.windDirectionView.setWindDirection(210)
        
        cell.backgroundImageView.kf_setImageWithURL(NSURL(string: city.imageUrl)!)
        cell.animatedTurbineView.applyRotationAnimation(100.0/25)
        cell.updateWithModel(nil)
        
        return cell
    }
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.cityList.count
    }
    
}