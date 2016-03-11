//
//  WeatherCardTableViewCell.swift
//  Weather Alert
//
//  Created by Joey Clover on 11/03/2016.
//  Copyright © 2016 JustJoey. All rights reserved.
//

import UIKit


class WeatherCardTableViewCell : BaseTableViewCell {
    
    let backgroundImageView = UIImageView()
    let animatedTurbineView = UIView()
    let windDirectionView = UIView()
    
    let cityLabel = UILabel()
    let windSpeedLabel = UILabel()
    let windDirectionLabel = UILabel()
    let windStrengthLabel = UILabel()
    
    
    // MARK: Setup
    
    override func setup() {
        setupBackgroundImageView()
        setupAnimatedTurbineView()
        setupWindDirectionView()
        setupCityLabel()
        setupWindSpeedLabel()
        setupWindDirectionLabel()
        setupWindStrengthLabel()
    }
    
    private func setupBackgroundImageView() {
        
    }
    
    private func setupAnimatedTurbineView() {
        
    }
    
    private func setupWindDirectionView() {
        
    }
    
    private func setupWindSpeedLabel() {
        
    }
    
    private func setupCityLabel() {
        
    }
    
    private func setupWindDirectionLabel() {
        
    }
    
    private func setupWindStrengthLabel() {
        
    }
    
    
    // MARK: Update Cell
    
    func updateWithModel(model:AnyObject) {
        
    }
    
}


extension WeatherCardTableViewCell {
    
    override func setupConstraints() {
        setupBackgroundImageViewConstraints()
        setupAnimatedTurbineViewConstraints()
        setupWindDirectionViewConstraints()
        setupCityLabelConstraints()
        setupWindSpeedLabelConstraints()
        setupWindDirectionLabelConstraints()
        setupWindStrengthLabelConstraints()
    }
    
    private func setupBackgroundImageViewConstraints() {
        
    }
    
    private func setupAnimatedTurbineViewConstraints() {
        
    }
    
    private func setupWindDirectionViewConstraints() {
        
    }
    
    private func setupWindSpeedLabelConstraints() {
        
    }
    
    private func setupCityLabelConstraints() {
        
    }
    
    private func setupWindDirectionLabelConstraints() {
        
    }
    
    private func setupWindStrengthLabelConstraints() {
        
    }
    
}