//
//  Number+Extensions.swift
//  Weather Alert
//
//  Created by Joey Clover on 17/03/2016.
//  Copyright © 2016 JustJoey. All rights reserved.
//

import Foundation
import UIKit


protocol RounderProtocol {
    func roundToPlaceValue(placeValue:Float) -> Int
}

extension RounderProtocol {
    /**
      Rounds a number to the nearest place value. Example with 50 as place value:
      11 -> 0 && 32 -> 50 && 63 -> 50 && 84 -> 100

      - parameter placeValue: The place value
    */
    func roundToPlaceValue(placeValue:Float) -> Int {
        guard let number = self as? NSNumber else { fatalError("RounderProtocol can only be applied to classes can be converted to NSNumber") }
        
        let floatNumber = number.floatValue

        if (floatNumber >= 0) {
            return Int(placeValue * floorf(floatNumber / placeValue + 0.5));
        }
        else {
            return Int(placeValue * ceilf(floatNumber / placeValue - 0.5));
        }
    }
}


extension Int : RounderProtocol {}
extension Double : RounderProtocol {}
extension Float : RounderProtocol {}
extension CGFloat : RounderProtocol {}