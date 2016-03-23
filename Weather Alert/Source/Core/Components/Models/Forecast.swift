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
    
    /** 
     Fetches a forecast that lies within the given time. The forecast returned will be the forecast that is just 
     before the given time.
     
     - parameter city: The city to fetch forecast for
    - parameter realm: The realm in which to search
     - parameter time: The time to fetch the forecast for
     - returns: A forecast object
     */
    static func getForecastForCity(city:City, forTime time:NSDate, inRealm realm:Realm) -> Forecast? {
        let epoch = time.timeIntervalSince1970
        let offsetFilterMin = epoch - (kForecastIntervalSeconds - 1)
        
        return realm.objects(Forecast.self).filter("cityId = %@ AND time < %d AND time > %d", city.id, epoch, offsetFilterMin).first
    }
    
    /**
     Fetches a forecast that is the upcoming forecast for a city. This is used as the default method as we are 
     unable to get the forecast for the current time, only from the next forecast.
    
     - parameter city: The city to fetch forecast for
     - parameter realm: The realm in which to search
     - returns: A forecast object
    */
    static func getNextForecastForCity(city:City, realm:Realm) -> Forecast? {
        let epoch = NSDate().timeIntervalSince1970
        let offsetFilterMax = epoch + (kForecastIntervalSeconds - 1)
        
        return realm.objects(Forecast.self).filter("cityId = %@ AND time < %d AND time > %d", city.id, offsetFilterMax, epoch).first
    }
    
}