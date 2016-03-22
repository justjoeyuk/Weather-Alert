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
    case InvalidJSON
    case FailedToGenerateForecasts
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
        
        let request = Alamofire.request(.GET, "\(baseUrl)/forecast", parameters: ["q": location, "units":"imperial", "appid":appId])
        
        request.responseJSON { response in
            guard
                let jsonValue = response.result.value as? NSDictionary,
                let cityData = jsonValue["city"] as? NSDictionary,
                let forecastList = jsonValue["list"] as? NSArray
            else {
                callback(false, WeatherAPIError.InvalidJSON); return
            }
            
            do {
                let realm = try Realm()
                
                let city = try generateCityWithData(cityData, realm: realm)
                try generateForecastWithData(forecastList, forCity:city, realm: realm)
                
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
    
    private static func generateCityWithData(cityData:NSDictionary, realm:Realm) throws -> City {
        guard let city = Mapper<City>().map(cityData) else { throw WeatherAPIError.FailedToCreateCity }
        
        // If the city does not exist, we give it a new priority (end of list)
        if realm.objectForPrimaryKey(City.self, key: city.id) == nil {
            let count = realm.objects(City.self).count
            city.priority = count
        }
        
        city.lastForecast = NSDate()
        
        try realm.write {
            realm.create(City.self, value: city, update: true)
        }
        return city
    }
    
    private static func generateForecastWithData(forecasts:NSArray, forCity city:City, realm:Realm) throws {
        try forecasts.forEach { forecast in
            guard let forecast = forecast as? NSDictionary else {
                throw WeatherAPIError.FailedToGenerateForecasts
            }
            
            guard let forecastObject = Mapper<Forecast>().map(forecast) else { throw WeatherAPIError.FailedToGenerateForecasts }
            
            try realm.write {
                // Used to generate the primary key for the forecast
                forecastObject.cityId = city.id
                forecastObject.uniqueId = "\(forecastObject.cityId)-\(forecastObject.time)"
                
                realm.create(Forecast.self, value: forecastObject, update: true)
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