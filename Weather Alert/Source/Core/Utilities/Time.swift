//
//  Time.swift
//  Weather Alert
//
//  Created by Joey Clover on 22/03/2016.
//  Copyright © 2016 JustJoey. All rights reserved.
//

import Foundation


/** 
    Forecasts are every 3 hours starting from 00:00. This method will try to fetch the closest
    forecast index to the date/time given. For example 00:00 would return 1, 03:00 would return 2, etc.
 
    - parameter date: The date to find the closest forecast index for
    - returns: the closest forecast index to a given date/time
 */
func forecastIndexForDate(date:NSDate = NSDate()) -> Int {
    return Int(floor(Float(date.currentHour()) / Float(kForecastIntervalHours)))
}