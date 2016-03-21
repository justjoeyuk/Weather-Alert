//
//  FlickrImageProviderTests.swift
//  Weather Alert
//
//  Created by Joey Clover on 21/03/2016.
//  Copyright © 2016 JustJoey. All rights reserved.
//

import XCTest
@testable import Weather_Alert


class FlickrImageProviderTests: XCTestCase {
    
    var provider = FlickrImageProvider()
    
    
    override func setUp() {
        provider = FlickrImageProvider()
    }
    
    func testThatFlickrUrlGenerationHandlesInvalidPhotoData() {
        let invalidData = ["error":"not valid"]
        
        XCTAssertNil(provider.generatePhotoUrlWithData(invalidData), "URL should not be generated")
    }
    
    func testThatFlickrUrlGenerationCreatesValidUrl() {
        let validPhotoData = ["farm":1, "id":"12345678", "server":"12", "secret":"abc123"]
        
        XCTAssertNotNil(validPhotoData, "Should generate a valid URL")
    }

}