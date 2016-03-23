//
//  WeatherDetailsViewController.swift
//  Weather Alert
//
//  Created by Joey Clover on 12/03/2016.
//  Copyright © 2016 JustJoey. All rights reserved.
//

import UIKit
import RealmSwift


class WeatherDetailsViewController : BaseVC {
    
    let todayForecastDataSource:TodayForecastDataSource
    let dailyOverviewDataSource:DailyOverviewDataSource
    
    let city:City
    var currentDay: Int = -1
    var currentHour: Int = -1
    
    var updateTimer: NSTimer?
    var pageIndex: Int = 0
    var detailView: WeatherDetailsView { return self.view as! WeatherDetailsView }
    
    // Flag for UICollectionView to initially scroll to current hour
    var pendingTimeUpdateScroll:Bool = false
    
    
    // MARK: Lifecycle
    
    init(city:City) {
        self.city = city
        
        todayForecastDataSource = TodayForecastDataSource(city: city)
        dailyOverviewDataSource = DailyOverviewDataSource(city: city)
        super.init()
    }

    required init() {
        fatalError("init() has not been implemented")
    }
    
    override func loadView() {
        self.view = WeatherDetailsView()
    }
    
    override func viewDidLoad() {
        let todayCollectionView = detailView.todayCollectionView
        let dailyOverviewTable = detailView.dailyOverviewTableView
        
        todayCollectionView.registerClass(TodayForecastCollectionViewCell.self, forCellWithReuseIdentifier: "Cell")
        todayCollectionView.dataSource = todayForecastDataSource
        
        dailyOverviewTable.registerClass(DailyOverviewTableViewCell.self, forCellReuseIdentifier: "DailyOverviewCell")
        dailyOverviewTable.separatorStyle = .None
        dailyOverviewTable.dataSource = dailyOverviewDataSource
        dailyOverviewTable.delegate = self
        
        updateCity()
        updateTime()
    }
    
    override func viewWillAppear(animated: Bool) {
        updateTimer = NSTimer(timeInterval: 5, target: self, selector: "updateTime", userInfo: nil, repeats: true)
        NSRunLoop.mainRunLoop().addTimer(updateTimer!, forMode: NSRunLoopCommonModes)
    }
    
    override func viewWillDisappear(animated: Bool) {
        updateTimer?.invalidate()
    }
    
    
    // MARK: Updates
    
    /** Updates the time in detail view controller which is reflected in the forecast */
    func updateTime() {
        // TODO: Update headerview
        
        let newestDay = NSDate().currentDay()
        let newestHour = NSDate().currentHour()
        
        if newestDay != self.currentDay {
            self.detailView.dailyOverviewTableView.reloadSections(NSIndexSet(index: 0), withRowAnimation: .Automatic)
            self.detailView.dailyOverviewTableView.scrollToRowAtIndexPath(NSIndexPath(forRow: 0, inSection: 0), atScrollPosition: .Top, animated: true)
            self.currentDay = newestDay
        }
        
        if newestHour != self.currentHour {
            pendingTimeUpdateScroll = true
            detailView.todayCollectionView.reloadData()
            scrollToCurrentHour()
            
            self.currentHour = newestHour
        }
    }
    
    /** Workaround to ensure that scrolling to the current hour works on initial view load */
    override func viewDidLayoutSubviews() {
        guard pendingTimeUpdateScroll else { return }
        
        scrollToCurrentHour(false)
        pendingTimeUpdateScroll = false
    }
    
    /** 
     Positions the forecast for today so that the forecast which the current time sits within is highlighted
     
     - parameter animate: Whether or not the scroll should animate
     */
    func scrollToCurrentHour(animate:Bool = true) {
        let hourIndex = forecastIndexForDate()
        
        detailView.todayCollectionView.scrollToItemAtIndexPath(NSIndexPath(forRow: hourIndex, inSection: 0), atScrollPosition: .Left, animated: animate)
    }
    
    /**
     Updates the forecast and details for the current city
     */
    func updateCity() {
        do {
            let realm = try Realm()
            guard let forecast = Forecast.getNextForecastForCity(city, realm: realm) else {
                print("*** ERROR: Failed to get Forecast for \(city.name) ***")
                return
            }
            
            self.detailView.updateWithCity(city, withForecast: forecast)
        }
        catch { print("Could not load weather details for \(city.name). \(error)") }
    }
    
}


extension WeatherDetailsViewController : UITableViewDelegate {
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 65
    }
}