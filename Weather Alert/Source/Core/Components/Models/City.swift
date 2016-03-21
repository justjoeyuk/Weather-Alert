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
    dynamic var longitude:Double = 0
    dynamic var latitude:Double = 0
    
    
    override static func primaryKey() -> String? {
        return "id"
    }

    required convenience init?(_ map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
        id <- map["id"]
        name <- map["name"]
        longitude <- map["coord.lon"]
        latitude <- map["coord.lat"]
    }
}