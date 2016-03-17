//
//  WeatherDetailsViewController.swift
//  Weather Alert
//
//  Created by Joey Clover on 12/03/2016.
//  Copyright © 2016 JustJoey. All rights reserved.
//

import UIKit


class WeatherDetailsViewController : BaseVC {
    
    let todayForecastDataSource = TodayForecastDataSource()
    let dailyOverviewDataSource = DailyOverviewDataSource()
    
    var pageIndex: Int = 0
    var detailView: WeatherDetailsView { return self.view as! WeatherDetailsView }
    
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
    }
    
    func applyModel(str:String) {
        
    }
    
}


extension WeatherDetailsViewController : UICollectionViewDelegate {
    
}

extension WeatherDetailsViewController : UITableViewDelegate {
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 65
    }
    
    func scrollViewDidScroll(scrollView: UIScrollView) {
        let halfHeaderHeight = detailView.headerView.frame.height * 0.4
        var offset = scrollView.contentOffset.y
        
        if offset <= 0 { offset = 0 }
        if offset >= halfHeaderHeight { offset = halfHeaderHeight }
        
        detailView.todayForecastTopConstraint.updateOffset(-offset)
    }
    
    func scrollViewWillEndDragging(scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        let halfHeaderHeight = detailView.headerView.frame.height * 0.4
        var offset = targetContentOffset.memory.y
        
        if offset > 0 && offset < halfHeaderHeight {
            if offset < halfHeaderHeight/2 { offset = 0 } else { offset = halfHeaderHeight }
        }
        
        targetContentOffset.memory.y = offset
    }
}