//
//  FlickrImageProvider.swift
//  Weather Alert
//
//  Created by Joey Clover on 20/03/2016.
//  Copyright © 2016 JustJoey. All rights reserved.
//

import Foundation
import Alamofire
import RealmSwift


enum FlickrErrors : ErrorType {
    case NotValidJSON
    case FailedToGenerateURL
}


class FlickrImageProvider : ImageProvider {
    
    private let apiKey = "a4742551ca2ec07b31f8032c8af6135a"
    private let baseEndpoint = "https://api.flickr.com/services/rest/"
    
    
    func fetchImageURLForCity(city:City, callback:ImageProviderCallback) {
        
        let method = "flickr.photos.search"
        let params: [String:AnyObject] = ["format":"json", "method": method, "api_key":apiKey, "safe_search":1, "content_type":1, "lat":city.latitude, "lon":city.longitude, "radius":30, "per_page":1, "nojsoncallback":1]
        
        let request = Alamofire.request(.GET, baseEndpoint, parameters: params)
        request.responseJSON { response in
            print(response.request?.URLString)
            
            guard let jsonData = response.result.value as? NSDictionary,
                let photoList = jsonData.valueForKeyPath("photos.photo") as? NSArray where photoList.count > 0,
                let photoData = photoList[0] as? NSDictionary
            else { callback(nil, FlickrErrors.NotValidJSON); return }
            
            if let url = self.generatePhotoUrlWithData(photoData) {
                callback(url, nil)
            }
            else {
                callback(nil, FlickrErrors.FailedToGenerateURL)
            }
        }
    }
    
    private func generatePhotoUrlWithData(photoData:NSDictionary) -> NSURL? {
        let template = "https://farm{farm}.staticflickr.com/{server}/{photo-id}_{photo-secret}.jpg"
        
        guard let farm = photoData["farm"] as? Int,
            let photoId = photoData["id"] as? String,
            let serverId = photoData["server"] as? String,
            let photoSecret = photoData["secret"] as? String
        else {
            return nil
        }
        
        let urlString = template
            .replace("{farm}", withString: String(farm))
            .replace("{server}", withString: String(serverId))
            .replace("{photo-id}", withString: String(photoId))
            .replace("{photo-secret}", withString: photoSecret)
        
        return NSURL(string: urlString)
    }
    
}