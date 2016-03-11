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
        weatherCardTableView.backgroundColor = UIColor(red: 0.9, green: 0.9, blue: 0.9, alpha: 1)
        addSubview(weatherCardTableView)
    }
    
    private func setupAddCityButton() {
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
        weatherCardTableView.snp_makeConstraints { make in
            make.top.left.right.equalTo(self)
            make.bottom.equalTo(self.addCityButton.snp_top)
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