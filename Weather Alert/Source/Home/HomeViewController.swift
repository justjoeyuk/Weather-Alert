//
//  HomeViewController.swift
//  Weather Alert
//
//  Created by Joey Clover on 10/03/2016.
//  Copyright © 2016 JustJoey. All rights reserved.
//

import UIKit


class HomeViewController : BaseVC {
    
    var homeView: HomeView { return self.view as! HomeView }
    
    let weatherCardDatasource = WeatherCardTableViewDataSource()
    
    
    override func loadView() {
        self.view = HomeView()
    }
    
    override func viewDidLoad() {
        self.title = "Home"
        
        homeView.weatherCardTableView.registerClass(WeatherCardTableViewCell.self, forCellReuseIdentifier: "WeatherCardCell")
        homeView.weatherCardTableView.separatorStyle = .None
        homeView.weatherCardTableView.dataSource = weatherCardDatasource
        homeView.weatherCardTableView.delegate = self
    }
    
}


extension HomeViewController : UITableViewDelegate {
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 150
    }
    
    func tableView(tableView: UITableView, estimatedHeightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 150
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let pvc = WeatherPageViewController(transitionStyle: .Scroll, navigationOrientation: .Horizontal, options: nil)
        pvc.loadInitialViewController(indexPath.row)
        pvc.title = "Forecast".localized
        
        self.navigationController?.pushViewController(pvc, animated: true)
    }
    
}