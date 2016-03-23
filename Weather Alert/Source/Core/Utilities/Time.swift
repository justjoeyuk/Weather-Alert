//
//  Time.swift
//  Weather Alert
//
//  Created by Joey Clover on 22/03/2016.
//  Copyright © 2016 JustJoey. All rights reserved.
//

import Foundation

let gregorianCalendar = NSCalendar(calendarIdentifier: NSCalendarIdentifierGregorian)!


/** 
    Forecasts are every 3 hours starting from 00:00. This method will try to fetch the closest 
    forecast index to the date/time given. A forecast index is a block of time that is equivalent to the interval of 
    forecasts. Given a forecast index of 2, the equivalent time would be between 06:00 and 08:59. For example 00:00 would 
    return 0, 03:00 would return 1, etc.
 
    - parameter date: The date to find the closest forecast index for
    - returns: the closest forecast index to a given date/time
 */
func forecastIndexForDate(date:NSDate = NSDate()) -> Int {
    return Int(floor(Float(date.currentHour()) / Float(kForecastIntervalHours)))
}

/**
 Forecasts are every 3 hours starting from 00:00. This method will round the given dates hour component to 
 the given forecast index. A forecast index is a block of time that is equivalent to the interval of forecasts.
 Given a forecast index of 2, the equivalent time would be between 06:00 and 08:59.
 
 - parameter date: The date to round to the closest forecast index
 - parameter index: The index to round the date too
 - returns: the rounded date
 */
func roundDateToForecastIndex(date:NSDate, index:Int) -> NSDate {
    let dateComponents = gregorianCalendar.components([.Year, .Month, .Day, .Hour], fromDate: date)
    dateComponents.hour = index * kForecastIntervalHours
    
    return gregorianCalendar.dateFromComponents(dateComponents)!
}