//
//  HomeView.swift
//  Weather Alert
//
//  Created by Joey Clover on 10/03/2016.
//  Copyright © 2016 JustJoey. All rights reserved.
//

import UIKit


class HomeView : BaseView {
    
    let weatherCardTableView = UITableView()
    let addCityButton = UIButton()
    
    override func setup() {
        setupWeatherCardTableView()
        setupAddCityButton()
    }
    
    private func setupWeatherCardTableView() {
        weatherCardTableView.backgroundColor = UIColor.darkBackgroundColor()
        addSubview(weatherCardTableView)
    }
    
    private func setupAddCityButton() {
        addCityButton.backgroundColor = UIColor.darkTransparentColor()
        addCityButton.setTitle("+ Add City", forState: .Normal)
        addSubview(addCityButton)
    }
    
}


// MARK: Layout

extension HomeView {
    
    override func setupConstraints() {
        setupWeatherCardTableViewConstraints()
        setupAddCityButtonConstraints()
    }
    
    private func setupWeatherCardTableViewConstraints() {
        weatherCardTableView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom:75, right: 0)
        
        weatherCardTableView.snp_makeConstraints { make in
            make.top.left.right.equalTo(self)
            make.bottom.equalTo(self)
        }
    }
    
    private func setupAddCityButtonConstraints() {
        addCityButton.snp_makeConstraints { make in
            make.bottom.equalTo(self)
            make.width.equalTo(self)
            make.height.equalTo(55)
        }
    }
    
}