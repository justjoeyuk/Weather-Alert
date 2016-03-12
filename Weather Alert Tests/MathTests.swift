//
//  Weather_Alert_Tests.swift
//  Weather Alert Tests
//
//  Created by Joey Clover on 12/03/2016.
//  Copyright © 2016 JustJoey. All rights reserved.
//

import XCTest
@testable import Weather_Alert


class MathTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testThatConversionFromDegreesToRadiansWorks() {
        let highNorthDeg = 360.0
        let lowNorthDeg = 0.0
        
        let eastDeg = 90.0
        let southDeg = 180.0
        let westDeg = 270.0
        
        XCTAssertEqualWithAccuracy(DegreesToRadians(highNorthDeg), 6.28319, accuracy: 0.001)
        XCTAssertEqualWithAccuracy(DegreesToRadians(lowNorthDeg), 0.0, accuracy: 0.001)
        XCTAssertEqualWithAccuracy(DegreesToRadians(eastDeg), 1.5708, accuracy: 0.001)
        XCTAssertEqualWithAccuracy(DegreesToRadians(southDeg), M_PI, accuracy: 0.001)
        XCTAssertEqualWithAccuracy(DegreesToRadians(westDeg), 4.71239, accuracy: 0.001)
    }
    
    func testThatConversionFromRadiansToDegreesWorks() {
        let highNorthRad = 6.28319
        let lowNorthRad = 0.0
        
        let eastRad = 1.5708
        let southRad = M_PI
        let westRad = 4.71239
        
        XCTAssertEqualWithAccuracy(RadiansToDegrees(highNorthRad), 360.0, accuracy: 0.001)
        XCTAssertEqualWithAccuracy(RadiansToDegrees(lowNorthRad), 0.0, accuracy: 0.001)
        XCTAssertEqualWithAccuracy(RadiansToDegrees(eastRad), 90.0, accuracy: 0.001)
        XCTAssertEqualWithAccuracy(RadiansToDegrees(southRad), 180.0, accuracy: 0.001)
        XCTAssertEqualWithAccuracy(RadiansToDegrees(westRad), 270.0, accuracy: 0.001)
    }
    
}
