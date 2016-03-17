//
//  WeatherForecastDataSource.swift
//  Weather Alert
//
//  Created by Joey Clover on 13/03/2016.
//  Copyright © 2016 JustJoey. All rights reserved.
//

import UIKit

@objc class DailyOverviewDataSource : NSObject, UITableViewDataSource {
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("DailyOverviewCell")
        return cell!
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 13
    }
    
}