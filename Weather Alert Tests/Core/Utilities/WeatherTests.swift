//
//  WeatherTests.swift
//  Weather Alert
//
//  Created by Joey Clover on 12/03/2016.
//  Copyright © 2016 JustJoey. All rights reserved.
//

import XCTest
@testable import Weather_Alert


class WeatherTests : XCTestCase {
    
    override func setUp() {
        
    }
    
    override func tearDown() {
        
    }
    
    func testThatSpeedToWindDescriptionConversionWorks() {
        let calm = 0.0
        
        let lightAirHigh = 3.4
        let lightAirLow = 0.5
        let lightBreezeHigh = 7.4
        let lightBreezeLow = 3.5
        let gentleBreezeHigh = 12.4
        let gentleBreezeLow = 7.5
        let moderateBreezeHigh = 18.4
        let moderateBreezeLow = 12.5
        let freshBreezeLow = 18.5
        let freshBreezeHigh = 24.4
        let strongBreezeLow = 24.5
        let strongBreezeHigh = 31.4
        let nearGaleLow = 31.5
        let nearGaleHigh = 38.4
        let galeLow = 38.5
        let galeHigh = 46.4
        let severeGaleLow = 46.5
        let severeGaleHigh = 54.4
        let stormLow = 54.5
        let stormHigh = 63.4
        let violentStormLow = 63.5
        let violentStormHigh = 73.4
        let hurricaneLow = 73.5
        let hurricanHigh = 95.4
        
        XCTAssertEqual("Calm".localized, windDescriptionFromSpeed(calm))
        XCTAssertEqual("Light Air".localized, windDescriptionFromSpeed(lightAirLow))
        XCTAssertEqual("Light Air".localized, windDescriptionFromSpeed(lightAirHigh))
        
        XCTAssertEqual("Light Breeze".localized, windDescriptionFromSpeed(lightBreezeLow))
        XCTAssertEqual("Light Breeze".localized, windDescriptionFromSpeed(lightBreezeHigh))
        
        XCTAssertEqual("Gentle Breeze".localized, windDescriptionFromSpeed(gentleBreezeLow))
        XCTAssertEqual("Gentle Breeze".localized, windDescriptionFromSpeed(gentleBreezeHigh))
        
        XCTAssertEqual("Moderate Breeze".localized, windDescriptionFromSpeed(moderateBreezeLow))
        XCTAssertEqual("Moderate Breeze".localized, windDescriptionFromSpeed(moderateBreezeHigh))
        
        XCTAssertEqual("Fresh Breeze".localized, windDescriptionFromSpeed(freshBreezeLow))
        XCTAssertEqual("Fresh Breeze".localized, windDescriptionFromSpeed(freshBreezeHigh))
        
        XCTAssertEqual("Strong Breeze".localized, windDescriptionFromSpeed(strongBreezeLow))
        XCTAssertEqual("Strong Breeze".localized, windDescriptionFromSpeed(strongBreezeHigh))
        
        XCTAssertEqual("Near Gale".localized, windDescriptionFromSpeed(nearGaleLow))
        XCTAssertEqual("Near Gale".localized, windDescriptionFromSpeed(nearGaleHigh))
        
        XCTAssertEqual("Gale".localized, windDescriptionFromSpeed(galeLow))
        XCTAssertEqual("Gale".localized, windDescriptionFromSpeed(galeHigh))
        
        XCTAssertEqual("Severe Gale".localized, windDescriptionFromSpeed(severeGaleLow))
        XCTAssertEqual("Severe Gale".localized, windDescriptionFromSpeed(severeGaleHigh))
        
        XCTAssertEqual("Storm".localized, windDescriptionFromSpeed(stormLow))
        XCTAssertEqual("Storm".localized, windDescriptionFromSpeed(stormHigh))
        
        XCTAssertEqual("Violent Storm".localized, windDescriptionFromSpeed(violentStormLow))
        XCTAssertEqual("Violent Storm".localized, windDescriptionFromSpeed(violentStormHigh))
        
        XCTAssertEqual("Hurricane".localized, windDescriptionFromSpeed(hurricaneLow))
        XCTAssertEqual("Hurricane".localized, windDescriptionFromSpeed(hurricanHigh))
    }
    
    func testThatSpeedToWindDescriptionHandlesNegativeValues() {
        XCTAssertEqual("Light Air".localized, windDescriptionFromSpeed(-0.5))
        XCTAssertEqual("Light Air".localized, windDescriptionFromSpeed(-3.4))
    }
    
}