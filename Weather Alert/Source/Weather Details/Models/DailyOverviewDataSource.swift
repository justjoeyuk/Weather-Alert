//
//  WeatherForecastDataSource.swift
//  Weather Alert
//
//  Created by Joey Clover on 13/03/2016.
//  Copyright © 2016 JustJoey. All rights reserved.
//

import UIKit

@objc class DailyOverviewDataSource : NSObject, UITableViewDataSource {
    
    let dayComponent = NSDateComponents()
    let calendar = NSCalendar.currentCalendar()
    let dateFormatter = NSDateFormatter()
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("DailyOverviewCell") as! DailyOverviewTableViewCell
        let today = NSDate()
        
        dayComponent.day = indexPath.row + 1
        dateFormatter.dateFormat = "EEEE' 'dd"
        
        let dateForCell = calendar.dateByAddingComponents(dayComponent, toDate:today , options: NSCalendarOptions(rawValue:0))
        
        cell.dayLabel.text = dateFormatter.stringFromDate(dateForCell!)
        
        return cell
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 13
    }
    
}