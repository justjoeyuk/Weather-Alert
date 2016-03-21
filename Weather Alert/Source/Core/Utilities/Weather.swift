//
//  Weather.swift
//  Weather Alert
//
//  Created by Joey Clover on 12/03/2016.
//  Copyright © 2016 JustJoey. All rights reserved.
//

import Foundation




/**
 Converts wind speed (mph) to a terminology users would be able to understand
 much easier. It uses the Beaufort Wind Scale from the official Weather.gov website:
 http://www.weather.gov/media/iwx/webpages/skywarn/Beaufort_Wind_Chart.pdf
 
 - parameter speed: The wind speed in miles per hour (mph)
 - return A localized understandable terminology for the given wind speed
 */
func windDescriptionFromSpeed(speed:Double) -> String {
    let speed = abs(round(speed))
    var windType:String = ""
    
    switch speed {
    case 0 :
        windType = "Calm".localized
    case 1...3:
        windType = "Light Air".localized
    case 4...7:
        windType = "Light Breeze".localized
    case 8...12:
        windType = "Gentle Breeze".localized
    case 13...18:
        windType = "Moderate Breeze".localized
    case 19...24:
        windType = "Fresh Breeze".localized
    case 25...31:
        windType = "Strong Breeze".localized
    case 32...38:
        windType = "Near Gale".localized
    case 39...46:
        windType = "Gale".localized
    case 47...54:
        windType = "Severe Gale".localized
    case 55...63:
        windType = "Storm".localized
    case 64...73:
        windType = "Violent Storm".localized
    case 74...95:
        windType = "Hurricane".localized
    default:
        windType = "Hurricane".localized
    }
    
    return windType
}