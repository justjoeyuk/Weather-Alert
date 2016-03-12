//
//  Math.swift
//  Weather Alert
//
//  Created by Joey Clover on 12/03/2016.
//  Copyright © 2016 JustJoey. All rights reserved.
//

import Foundation


/**
 Converts radians into degrees. Works with negative radians.
 
 - parameter value: The radians value which to convert to degrees
 */
func RadiansToDegrees (value:Double) -> Double {
    return value * 180.0 / M_PI
}

/**
 Converts degrees into radians. Works with negative degrees.
 
 - parameter value: The degrees value which to convert to radians
*/
func DegreesToRadians (value:Double) -> Double {
    return value * M_PI / 180.0
}