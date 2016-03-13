//
//  WeatherDetailsView.swift
//  Weather Alert
//
//  Created by Joey Clover on 12/03/2016.
//  Copyright © 2016 JustJoey. All rights reserved.
//

import UIKit


class WeatherDetailsView : BaseView {
    
    let headerView = WeatherDetailsHeaderView()
    var todayCollectionView:UICollectionView!
    let forecastTableView = UITableView()
    
    
    override func setup() {
        backgroundColor = UIColor.whiteColor()
        
        setupHeaderView()
        setupTodayCollectionView()
        setupForecastTableView()
    }
    
    private func setupHeaderView() {
        addSubview(headerView)
    }
    
    private func setupTodayCollectionView() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .Horizontal
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        layout.itemSize = CGSize(width: 60, height: 60)
        
        todayCollectionView = UICollectionView(frame: CGRectZero, collectionViewLayout: layout)
        todayCollectionView.backgroundColor = UIColor.darkBackgroundColor()
        
        addSubview(todayCollectionView)
    }
    
    private func setupForecastTableView() {
        forecastTableView.backgroundColor = UIColor.darkBackgroundColor()
        
        addSubview(forecastTableView)
    }
    
}


extension WeatherDetailsView {
    
    override func setupConstraints() {
        setupTodayCollectionViewConstraints()
        setupHeaderViewConstraints()
        setupForecastTableViewConstraints()
    }
    
    private func setupHeaderViewConstraints() {
        headerView.snp_makeConstraints { make in
            make.left.top.equalTo(self)
            make.width.equalTo(self)
            make.height.equalTo(self.headerView.snp_width).multipliedBy(0.5)
        }
    }
    
    private func setupForecastTableViewConstraints() {
        forecastTableView.snp_makeConstraints { make in
            make.bottom.right.left.equalTo(self)
            make.top.equalTo(self.todayCollectionView.snp_bottom)
        }
    }
    
    private func setupTodayCollectionViewConstraints() {
        todayCollectionView.snp_makeConstraints { make in
            make.left.right.equalTo(self)
            make.top.equalTo(self.headerView.snp_bottom)
            make.height.equalTo(60)
        }
    }
    
}