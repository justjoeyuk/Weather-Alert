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
        layout.itemSize = CGSize(width: 60, height: 60)
        
        todayCollectionView = UICollectionView(frame: CGRectZero, collectionViewLayout: layout)
        todayCollectionView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        todayCollectionView.backgroundColor = UIColor.darkBackgroundColor()
        todayCollectionView.delegate = self
        
        addSubview(todayCollectionView)
    }
    
    private func setupDailyOverviewTableView() {
        dailyOverviewTableView.backgroundColor = UIColor.darkBackgroundColor()
        
        addSubview(dailyOverviewTableView)
    }
    
}

extension WeatherDetailsView : UICollectionViewDelegate {
    func scrollViewWillEndDragging(scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        
        // Modify the target offset to be fixed to a cell
        var newOffset = targetContentOffset.memory
        let newVal = newOffset.x.roundToPlaceValue(Float(LayoutConstants.TodayCollectionCellSize))
        newOffset.x = CGFloat(newVal)
        
        targetContentOffset.memory = newOffset
    }
}


extension WeatherDetailsView {
    
    struct LayoutConstants {
        static let TodayCollectionCellSize = 60
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
            make.height.equalTo(60)
        }
    }
    
}