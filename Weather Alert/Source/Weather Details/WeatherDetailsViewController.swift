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
    var pageIndex: Int = 0
    var detailView: WeatherDetailsView { return self.view as! WeatherDetailsView }
    
    override func loadView() {
        self.view = WeatherDetailsView()
    }
    
    override func viewDidLoad() {
        detailView.todayCollectionView.registerClass(TodayForecastCollectionViewCell.self, forCellWithReuseIdentifier: "Cell")
        detailView.todayCollectionView.dataSource = todayForecastDataSource
        detailView.todayCollectionView.delegate = self
    }
    
    func applyModel(str:String) {
        
    }
    
}


extension WeatherDetailsViewController : UICollectionViewDelegate {
    
    
    
}