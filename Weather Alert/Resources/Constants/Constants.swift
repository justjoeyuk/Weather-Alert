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

// Number of seconds in 3 hours
let threeHours:NSTimeInterval = 10800

// Placeholder image for a city
let cityPlaceholderImage = UIImage.Asset.Placeholder_City.image


func after(delay:Double, callback:()->()) {
    let delayTime = dispatch_time(DISPATCH_TIME_NOW, Int64(delay * Double(NSEC_PER_SEC)))
    dispatch_after(delayTime, dispatch_get_main_queue()) {
        callback()
    }
}

func runAsync(asyncWork:EmptyCallback) {
    let priority = DISPATCH_QUEUE_PRIORITY_DEFAULT
    dispatch_async(dispatch_get_global_queue(priority, 0)) {
        asyncWork()
    }
}

func runMain(mainThreadWork:EmptyCallback) {
    dispatch_async(dispatch_get_main_queue()) {
        mainThreadWork()
    }
}