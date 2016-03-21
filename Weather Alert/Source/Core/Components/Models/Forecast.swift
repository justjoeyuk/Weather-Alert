//
//  Forecast.swift
//  Weather Alert
//
//  Created by Joey Clover on 21/03/2016.
//  Copyright © 2016 JustJoey. All rights reserved.
//

import Foundation
import RealmSwift
import ObjectMapper

class Forecast : Object, Mappable {
    
    dynamic var cityId:Int = 0
    dynamic var time:NSTimeInterval = 0
    dynamic var uniqueId:String = ""
    
    dynamic var windSpeed:Float = 0.0
    dynamic var windDirection:Float = 0.0
    
    
    required convenience init?(_ map: Map) {
        self.init()
    }
    
    override static func primaryKey() -> String? {
        return "uniqueId"
    }
    
    func mapping(map: Map) {
        time <- map["dt"]
        windSpeed <- map["wind.speed"]
        windDirection <- map["wind.deg"]
    }
    
}