//
//  City.swift
//  Weather Alert
//
//  Created by Joey Clover on 18/03/2016.
//  Copyright © 2016 JustJoey. All rights reserved.
//

import Foundation
import RealmSwift
import ObjectMapper


class City : Object, Mappable {
    dynamic var id = 0
    dynamic var name = ""
    dynamic var lastForecast = NSDate()
    dynamic var imageUrl = ""
    dynamic var priority:Int = 0
    dynamic var longitude:Double = 0
    dynamic var latitude:Double = 0
    
    
    override static func primaryKey() -> String? {
        return "id"
    }

    required convenience init?(_ map: Map) {
        self.init()
    }
    
    func applyImageUrl(url:String) {
        do {
            let realm = try Realm()

            try realm.write {
                self.imageUrl = url
            }
        }
        catch {
            print("Error trying to save image URL to city. \(error)")
        }
    }
    
    /**
     Removes old forecasts and downloads a new 5 day forecast for the city
    */
    func updateForecasts(callback:BasicCallback) {
        let lastUpdate = self.lastForecast.timeIntervalSince1970
        let now = NSDate().timeIntervalSince1970
        
        if lastUpdate < now - kForecastIntervalSeconds {
            removeOldForecasts()
            WeatherAPIManager.gatherFiveDayForecastWithCity(self, callback: callback)
        }
        else {
            callback(true, nil)
        }
    }
    
    func removeOldForecasts(since:NSDate = NSDate()) {
        do {
            let realm = try Realm()
            
            let forecastsPerDay = Double(24 / kForecastIntervalHours)
            let minimumForecastDate = NSDate().timeIntervalSince1970 - (kForecastIntervalSeconds * forecastsPerDay)
            
            let cities = realm.objects(Forecast.self).filter("time < %d", minimumForecastDate)
            try realm.write { realm.delete(cities) }
        }
        catch {
            print("*** ERROR \(error) ***")
        }
    }
    
    func mapping(map: Map) {
        id <- map["id"]
        name <- map["name"]
        longitude <- map["coord.lon"]
        latitude <- map["coord.lat"]
    }
}