//
//  Time.swift
//  Weather Alert
//
//  Created by Joey Clover on 22/03/2016.
//  Copyright © 2016 JustJoey. All rights reserved.
//

import XCTest
@testable import Weather_Alert


class TimeTests: XCTestCase {
    
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testThatGettingNearestForecastIndexWorks() {
        let numberOfIndexes = Int(24 / kForecastIntervalHours)
        
        for i in 0...numberOfIndexes - 1 {
            let indexDbl = Double(i)
            let indexDate = NSDate(timeIntervalSince1970: kForecastIntervalSeconds * indexDbl)
            
            XCTAssertEqual(forecastIndexForDate(indexDate), i)
        }
        
        let zeroDate = NSDate(timeIntervalSince1970: kForecastIntervalSeconds * Double(numberOfIndexes))
        let zeroHour = forecastIndexForDate(zeroDate)
        XCTAssertEqual(zeroHour, 0)
    }
}