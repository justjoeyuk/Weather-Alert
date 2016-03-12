//
//  WeatherCardTableViewDataSource.swift
//  Weather Alert
//
//  Created by Joey Clover on 11/03/2016.
//  Copyright © 2016 JustJoey. All rights reserved.
//

import UIKit


@objc class WeatherCardTableViewDataSource : NSObject, UITableViewDataSource {
    
    let cities = ["Manchester", "London", "New York", "Lisbon", "Llanfairpwllgwyngyllgogerychwyrndrobwllllantysilio", "Derby"]
    let weathers = ["Calm", "Windy", "Very Windy", "Calm", "Windy", "Calm"]
    let speeds = [12.0, 30.0, 50.0, 15.0, 25.0, 10.0]
    
    let direction = ["SW", "NW", "N", "E", "NE", "W"]
    let degs = [225.0, 315.0, 360.0, 90.0, 45.0, 270.0]
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCellWithIdentifier("WeatherCardCell", forIndexPath: indexPath) as? WeatherCardTableViewCell else { return UITableViewCell() }
        
        cell.cityLabel.text = cities[indexPath.row]
        cell.windSpeedLabel.text = "\(Int(speeds[indexPath.row]))mph"
        cell.windStrengthLabel.text = weathers[indexPath.row]
        cell.windDirectionLabel.text = direction[indexPath.row]
        
        let transform = CGAffineTransformRotate(CGAffineTransformIdentity, CGFloat(DegreesToRadians(degs[indexPath.row])));
        cell.windDirectionView.transform = transform;
        
        cell.animatedTurbineView.applyRotationAnimation(100.0/speeds[indexPath.row])
        
        cell.updateWithModel(nil)
        
        return cell
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
    }
    
}