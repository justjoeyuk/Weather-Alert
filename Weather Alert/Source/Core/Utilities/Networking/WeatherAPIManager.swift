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


enum WeatherAPIError: ErrorType {
    case FailedToCreateCity
    case FailedToUpdateImage
}


class WeatherAPIManager {
    
    private static let baseUrl = DiskConfiguration.defaultConfig().settingForKey(.WeatherAPIBaseUrlKey)
    private static let imageProvider = FlickrImageProvider()
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
            
            do {
                let realm = try Realm()
                
                guard let city = Mapper<City>().map(cityData) else { throw WeatherAPIError.FailedToCreateCity }
                city.lastForecast = NSDate()
                
                try realm.write {
                    realm.create(City.self, value: city, update: true)
                }
                
                WeatherAPIManager.updateLocationImage(city.id) { success, error in
                    callback(success, error)
                }
            }
            catch {
                print("*** ERROR IN FORECAST RESPONSE: \(error) ***")
                callback(false, error)
            }
        }
    }
    
    /**
     Searches our image provider for an image that matches the city with the given id. Also 
     updates the City in the DB with an URL that is an image matching the search query (location name)
    */
    static func updateLocationImage(locationId:Int, callback:BasicCallback) {
        do {
            let realm = try Realm()
            guard let city = realm.objectForPrimaryKey(City.self, key: locationId) else { throw WeatherAPIError.FailedToUpdateImage }
            
            self.imageProvider.fetchImageURLForCity(city) { url, error in
                if let url = url {
                    city.applyImageUrl(url.absoluteString)
                }
                else { print("*** ERROR: \(error) ***") }
                
                callback(true, nil)
            }
        }
        catch {
            print("Could not update image for location with ID: \(locationId). \(error)")
            callback(false, error)
        }
    }
    
}