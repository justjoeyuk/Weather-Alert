//
//  Constants.swift
//  Weather Alert
//
//  Created by Joey Clover on 18/03/2016.
//  Copyright © 2016 JustJoey. All rights reserved.
//

import Foundation
import UIKit

typealias BasicCallback = (Bool, ErrorType?)->()
typealias EmptyCallback = ()->()


// MARK: Constant Values

// Number of hours between forecasts (should be an integer when divided with 24)
let kForecastIntervalHours = 3
let kForecastIntervalSeconds:NSTimeInterval = Double(kForecastIntervalHours * 60 * 60)

// Placeholder image for a city
let kCityPlaceholderImage = UIImage.Asset.Placeholder_City.image

let kWeatherCardCellHeight = CGFloat(150)
let kWeatherCardCellIdentifier = "WeatherCardCell"
let kModificationCellIdentifier = "ModifyCityCell"


// MARK: Global Methods

/** Executes the callback after the given delay (in seconds) */
func after(delay:Double, callback:()->()) {
    let delayTime = dispatch_time(DISPATCH_TIME_NOW, Int64(delay * Double(NSEC_PER_SEC)))
    dispatch_after(delayTime, dispatch_get_main_queue()) {
        callback()
    }
}

/** Runs the given block async */
func runAsync(asyncWork:EmptyCallback) {
    let priority = DISPATCH_QUEUE_PRIORITY_DEFAULT
    dispatch_async(dispatch_get_global_queue(priority, 0)) {
        asyncWork()
    }
}

/** Runs the given block on the main (UI) thread */
func runMain(mainThreadWork:EmptyCallback) {
    dispatch_async(dispatch_get_main_queue()) {
        mainThreadWork()
    }
}