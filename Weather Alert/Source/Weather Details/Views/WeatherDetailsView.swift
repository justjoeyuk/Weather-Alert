//
//  WeatherDetailsView.swift
//  Weather Alert
//
//  Created by Joey Clover on 12/03/2016.
//  Copyright © 2016 JustJoey. All rights reserved.
//

import UIKit
import SnapKit


class WeatherDetailsView : BaseView {
    
    var todayForecastTopConstraint: Constraint!
    let headerView = WeatherDetailsHeaderView()
    var todayCollectionView:UICollectionView!
    let dailyOverviewTableView = UITableView()
    
    
    override func setup() {
        backgroundColor = UIColor.whiteColor()
        clipsToBounds = true
        
        setupHeaderView()
        setupTodayCollectionView()
        setupDailyOverviewTableView()
    }
    
    private func setupHeaderView() {
        addSubview(headerView)
    }
    
    private func setupTodayCollectionView() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .Horizontal
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        layout.itemSize = CGSize(width: LayoutConstants.TodayCollectionCellSize, height: LayoutConstants.TodayCollectionCellSize)
        
        todayCollectionView = UICollectionView(frame: CGRectZero, collectionViewLayout: layout)
        todayCollectionView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        todayCollectionView.backgroundColor = UIColor.darkBackgroundColor()
        todayCollectionView.delegate = self
        
        addSubview(todayCollectionView)
    }
    
    private func setupDailyOverviewTableView() {
        dailyOverviewTableView.backgroundColor = UIColor(red: 0.2, green: 0.2, blue: 0.2, alpha: 1)
        
        addSubview(dailyOverviewTableView)
    }
    
    func updateWithCity(city:City, withForecast forecast:Forecast) {
        /** TODO: I have considered making this implementation and have it in a protocol, I have 
            two views in the app that do this exact setup. It's a pretty bad case of DRY. However, 
            time restrictions are in place. */
        
        let windDirection = Double(forecast.windDirection)
        let windSpeed = Double(forecast.windSpeed)
        
        headerView.cityNameLabel.text = city.name
        
        headerView.windSpeedLabel.text = String(format: "%.1f mph", windSpeed)
        headerView.windStrengthLabel.text = windDescriptionFromSpeed(windSpeed)
        
        headerView.windDirectionView.setWindDirection(windDirection)
        headerView.windDirectionLabel.text = cardinalDirectionFromDegrees(windDirection)
        
        headerView.backgroundImageView.kf_setImageWithURL(NSURL(string: city.imageUrl)!, placeholderImage: kCityPlaceholderImage)
        
        headerView.animatedTurbineView.applyRotationAnimation(100.0/windSpeed)
    }
    
}

extension WeatherDetailsView : UICollectionViewDelegate {
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        collectionView.scrollToItemAtIndexPath(indexPath, atScrollPosition: .Left, animated: true)
    }
}


extension WeatherDetailsView {
    
    struct LayoutConstants {
        static let TodayCollectionCellSize = 80
    }
    
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
        dailyOverviewTableView.snp_makeConstraints { make in
            make.bottom.right.left.equalTo(self)
            make.top.equalTo(self.todayCollectionView.snp_bottom)
        }
    }
    
    private func setupTodayCollectionViewConstraints() {
        todayCollectionView.snp_makeConstraints { make in
            make.left.right.equalTo(self)
            self.todayForecastTopConstraint = make.top.equalTo(self.headerView.snp_bottom).constraint
            make.height.equalTo(LayoutConstants.TodayCollectionCellSize)
        }
    }
    
}