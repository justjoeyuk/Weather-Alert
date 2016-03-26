//
//  TodayForecaseDatasource.swift
//  Weather Alert
//
//  Created by Joey Clover on 12/03/2016.
//  Copyright © 2016 JustJoey. All rights reserved.
//

import UIKit


@objc class TodayForecastDataSource : NSObject, UICollectionViewDataSource {
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("Cell", forIndexPath: indexPath) as! TodayForecastCollectionViewCell
        
        let cellHour = indexPath.row
        let currentHour = NSDate().currentHour()
        let timeText = String(format: "%02d:00", cellHour)
        
        cell.timeLabel.text = timeText
        cell.backgroundColor = cellHour == currentHour ? UIColor.blackColor() : UIColor.darkBackgroundColor()
        
        return cell
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 24
    }
    
}