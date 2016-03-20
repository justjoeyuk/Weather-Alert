//
//  ImageProvider.swift
//  Weather Alert
//
//  Created by Joey Clover on 20/03/2016.
//  Copyright © 2016 JustJoey. All rights reserved.
//

import Foundation


typealias ImageProviderCallback = (NSURL?, ErrorType?) -> ()


/** An interface to interact with images from a number of providers **/
protocol ImageProvider {
    
    /**
        Searches the image provider for an image that represents the given city and invokes the given callback
        with either a URL or an Error.
     
        - parameter city: The city
        - parameter callback: The callback to be invoked
     */
    func fetchImageURLForCity(city:City, callback:ImageProviderCallback)
    
}