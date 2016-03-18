//
//  NSDate+Extensions.swift
//  Weather Alert
//
//  Created by Joey Clover on 17/03/2016.
//  Copyright © 2016 JustJoey. All rights reserved.
//

import Foundation

extension NSDate {
    
    /**
     - returns: The numeric hour of the day (0-23)
    */
    func currentHour() -> Int {
        return NSCalendar.currentCalendar().component(.Hour, fromDate: self)
    }
    
    /**
      - returns: The numeric day of the month
    */
    func currentDay() -> Int {
        return NSCalendar.currentCalendar().component(.Day, fromDate: self)
    }
    
}