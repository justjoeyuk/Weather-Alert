//
//  TodayForecaseDatasource.swift
//  Weather Alert
//
//  Created by Joey Clover on 12/03/2016.
//  Copyright © 2016 JustJoey. All rights reserved.
//

import UIKit
import RealmSwift


@objc class TodayForecastDataSource : NSObject, UICollectionViewDataSource {
    
    let realm:Realm
    weak var city:City?
    
    
    init(city:City) {
        do { self.realm = try Realm() } catch { fatalError("Could not create Realm \(error)") }
        self.city = city
        super.init()
    }
    
    
    // MARK: UICollectionViewDatasource
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        // TODO: CLEAN THIS METHOD
        
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("Cell", forIndexPath: indexPath) as! TodayForecastCollectionViewCell
        guard let city = city else {
            print("*** ERROR: Could not use city for daily overview ***")
            return cell
        }
        
        let cellHour = indexPath.row * kForecastIntervalHours
        let cellDate = roundDateToForecastIndex(NSDate(), index: indexPath.row)
        let timeText = String(format: "%02d:00", cellHour)
        
        cell.backgroundColor = indexPath.row == forecastIndexForDate() ? UIColor.blackColor() : UIColor.darkBackgroundColor()
        
        guard let forecast = Forecast.getForecastForCity(city, forTime: cellDate, inRealm: self.realm) else {
            // TODO: This is poor handling, it should only show cells we have a forecast for, but time restrictions...
            cell.timeLabel.text = "--:--"
            cell.windSpeedLabel.text = "-.- mph"
            cell.windDirectionView.hidden = true
            return cell
        }
        
        // TODO: Extract into cells update method
        cell.timeLabel.text = timeText
        cell.windSpeedLabel.text = String(format: "%.1f mph", forecast.windSpeed)
        
        cell.windDirectionView.hidden = false
        cell.windDirectionView.setWindDirection(Double(forecast.windDirection))
        
        return cell
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 8
    }
    
}