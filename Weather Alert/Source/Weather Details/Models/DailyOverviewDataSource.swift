//
//  WeatherForecastDataSource.swift
//  Weather Alert
//
//  Created by Joey Clover on 13/03/2016.
//  Copyright © 2016 JustJoey. All rights reserved.
//

import UIKit
import RealmSwift

@objc class DailyOverviewDataSource : NSObject, UITableViewDataSource {
    
    let dayComponent = NSDateComponents()
    let calendar = NSCalendar.currentCalendar()
    let dateFormatter = NSDateFormatter()
    
    weak var realm:Realm?
    weak var city:City?
    
    
    init(city:City, realm:Realm) {
        self.realm = realm
        self.city = city
        
        super.init()
    }
    
    
    // MARK: UITableViewDelegate Methods
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("DailyOverviewCell") as! DailyOverviewTableViewCell
        
        guard let city = city, let realm = realm else { return cell }
        
        let today = NSDate()
        dayComponent.day = indexPath.row + 1
        dateFormatter.dateFormat = "EEEE' 'dd"
        
        let dateForCell = calendar.dateByAddingComponents(dayComponent, toDate:today , options: NSCalendarOptions(rawValue:0))
        cell.dayLabel.text = dateFormatter.stringFromDate(dateForCell!)
        
        guard let forecast = Forecast.getForecastForCity(city, forTime: dateForCell!, inRealm: realm) else { return cell }
        cell.updateWithForecast(forecast)
        
        return cell
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
}