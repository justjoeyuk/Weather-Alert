//
//  WeatherAPIManager.swift
//  Weather Alert
//
//  Created by Joey Clover on 18/03/2016.
//  Copyright © 2016 JustJoey. All rights reserved.
//

import Foundation
import Alamofire
import ObjectMapper
import RealmSwift


class WeatherAPIManager {
    
    private static let baseUrl = DiskConfiguration.defaultConfig().settingForKey(.WeatherAPIBaseUrlKey)
    private static let appId = "dad87544773252d5799fc794a9d0a1f6"
    
    /**
     Gets a five day forecast (for every 3 hours) for a given location from the current time.
     
     - parameter location: The location to get the forecast for
     - parameter callback: The callback to be invoked upon completion/failure
    */
    static func gatherFiveDayForecast(location:String?, callback:BasicCallback) {
        guard let location = location else { callback(false, nil); return }
        
        let request = Alamofire.request(.GET, "\(baseUrl)/forecast", parameters: ["q": location, "appid":appId])
        
        request.responseJSON { response in
            guard let jsonValue = response.result.value as? NSDictionary else { callback(false, nil); return }
            guard let cityData = jsonValue["city"] as? NSDictionary else { callback(false, nil); return }
            
            print(cityData)
            let realm = try! Realm()
            let city = Mapper<City>().map(cityData)
            
            try! realm.write {
                realm.create(City.self, value: city!, update: true)
            }
            
            callback(true, nil)
        }
    }
    
}