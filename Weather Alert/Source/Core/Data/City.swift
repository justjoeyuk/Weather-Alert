//
//  City.swift
//  Weather Alert
//
//  Created by Joey Clover on 18/03/2016.
//  Copyright © 2016 JustJoey. All rights reserved.
//

import Foundation
import RealmSwift

class City : Object {
    dynamic var id = 0
    dynamic var name = ""
    
    override static func primaryKey() -> String? {
        return "id"
    }
}