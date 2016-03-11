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
        
        homeView.weatherCardTableView.dataSource = weatherCardDatasource
        homeView.weatherCardTableView.delegate = self
    }
    
}


extension HomeViewController : UITableViewDelegate {
    
    
    
}