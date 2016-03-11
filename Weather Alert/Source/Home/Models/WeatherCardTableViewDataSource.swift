//
//  WeatherCardTableViewDataSource.swift
//  Weather Alert
//
//  Created by Joey Clover on 11/03/2016.
//  Copyright © 2016 JustJoey. All rights reserved.
//

import UIKit


@objc class WeatherCardTableViewDataSource : NSObject, UITableViewDataSource {
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCellWithIdentifier("WeatherCardCell", forIndexPath: indexPath) as? WeatherCardTableViewCell else { return UITableViewCell() }
        
        cell.updateWithModel(nil)
        
        return cell
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
}