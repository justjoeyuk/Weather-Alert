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
    
    var realmToken:NotificationToken?
    let realm:Realm
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
        do { self.realm = try Realm() } catch { fatalError("Could not create Realm \(error)") }
        self.city = city
        
        todayForecastDataSource = TodayForecastDataSource(city: city, realm:self.realm)
        dailyOverviewDataSource = DailyOverviewDataSource(city: city, realm:self.realm)
        
        realmToken = self.realm.objects(City.self).filter("lastForecast = %@", city.lastForecast).addNotificationBlock { results, error in
            print("City has been updated, refreshing UI")
            
        }
        
        city.updateForecasts { success, error in
            print("FORECAST UPDATE: \(success)")
        }
        
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
        
        updatePage()
    }
    
    override func viewWillAppear(animated: Bool) {
        updateTimer = NSTimer(timeInterval: 5, target: self, selector: "updatePage", userInfo: nil, repeats: true)
        NSRunLoop.mainRunLoop().addTimer(updateTimer!, forMode: NSRunLoopCommonModes)
    }
    
    override func viewWillDisappear(animated: Bool) {
        updateTimer?.invalidate()
    }
    
    
    // MARK: Updates
    
    func updatePage() {
        updateCity()
        updateTime()
    }
    
    /** Updates the time in detail view controller which is reflected in the forecast */
    func updateTime() {
        // TODO: Update headerview
        
        let newestDay = NSDate().currentDay()
        let newestHour = NSDate().currentHour()
        
        if newestDay != self.currentDay {
            self.detailView.dailyOverviewTableView.reloadData()
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
        // TODO: This should not be getting the "next" forecast. It's done this way
        // because as of now, we don't have the actual forecast for right now
        guard let forecast = Forecast.getNextForecastForCity(city, realm: realm) else {
            print("*** ERROR: Failed to get Forecast for \(city.name) ***")
            return
        }
        
        self.detailView.updateWithCity(city, withForecast: forecast)
    }
    
}


extension WeatherDetailsViewController : UITableViewDelegate {
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 65
    }
}