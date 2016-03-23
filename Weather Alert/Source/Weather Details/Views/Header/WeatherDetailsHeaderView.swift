//
//  WeatherDetailsHeaderView.swift
//  Weather Alert
//
//  Created by Joey Clover on 12/03/2016.
//  Copyright © 2016 JustJoey. All rights reserved.
//

import UIKit


class WeatherDetailsHeaderView : BaseView {
    
    let backgroundImageView = UIImageView()
    let cityNameLabel = UILabel()
    
    let windDirectionView = WindDirectionView()
    let windDirectionLabel = UILabel()
    
    let animatedTurbineView = AnimatedTurbineView()
    let windSpeedLabel = UILabel()
    
    let windStrengthLabel = UILabel()
    
    
    override func setup() {
        setupBackgroundImageView()
        setupCityNameLabel()
        setupWindDirectionLabel()
        setupWindDirectionView()
        setupAnimatedTurbineView()
        setupWindSpeedLabel()
        setupWindStrengthLabel()
    }
    
    private func setupBackgroundImageView() {
        backgroundImageView.image = UIImage.Asset.Mock_Location.image
        backgroundImageView.contentMode = .ScaleAspectFill
        backgroundImageView.applyOverlay()
        
        addSubview(backgroundImageView)
    }
    
    private func setupCityNameLabel() {
        cityNameLabel
            .applyAutoSize()
            .applyOxygenFont(kHeadingFontSize)
            .applyColor(UIColor.whiteColor())
            .centered
            .text = "Manchester"
        
        addSubview(cityNameLabel)
    }
    
    private func setupWindDirectionLabel() {
        windDirectionLabel
            .applyOxygenFont(kStandardFontSize)
            .applyColor(UIColor.whiteColor())
            .text = "SW"
        
        addSubview(windDirectionLabel)
    }
    
    private func setupWindDirectionView() {
        addSubview(windDirectionView)
    }
    
    private func setupAnimatedTurbineView() {
        addSubview(animatedTurbineView)
    }
    
    private func setupWindSpeedLabel() {
        windSpeedLabel
            .applyOxygenFont(kStandardFontSize)
            .applyColor(UIColor.whiteColor())
            .text = "20mph"
        
        addSubview(windSpeedLabel)
    }
    
    private func setupWindStrengthLabel() {
        windStrengthLabel
            .applyOxygenFont(kSubHeadingFontSize)
            .applyColor(UIColor.whiteColor())
            .text = "Windy"
        
        addSubview(windStrengthLabel)
    }
    
}


extension WeatherDetailsHeaderView {
    
    override func setupConstraints() {
        setupBackgroundImageViewConstraints()
        setupCityNameLabelConstraints()
        setupWindDirectionLabelConstraints()
        setupWindDirectionViewConstraints()
        setupAnimatedTurbineViewConstraints()
        setupWindSpeedLabelConstraints()
        setupWindStrengthLabelConstraints()
    }
    
    private func setupBackgroundImageViewConstraints() {
        backgroundImageView.snp_makeConstraints { make in
            make.edges.equalTo(self)
        }
    }
    
    private func setupCityNameLabelConstraints() {
        cityNameLabel.snp_makeConstraints { make in
            make.top.equalTo(self).offset(10)
            make.centerX.equalTo(self)
            make.width.equalTo(self).multipliedBy(0.8)
            make.bottom.equalTo(self.windDirectionLabel.snp_top)
        }
    }
    
    private func setupWindDirectionLabelConstraints() {
        windDirectionLabel.snp_makeConstraints { make in
            make.left.equalTo(self.windDirectionView.snp_right).offset(5)
            make.top.bottom.equalTo(self.windDirectionView)
        }
    }
    
    private func setupWindDirectionViewConstraints() {
        windDirectionView.snp_makeConstraints { make in
            make.bottom.equalTo(self.animatedTurbineView.snp_top).offset(-5)
            make.left.equalTo(self).offset(5)
            make.size.equalTo(25)
        }
    }
    
    private func setupAnimatedTurbineViewConstraints() {
        animatedTurbineView.snp_makeConstraints { make in
            make.left.equalTo(self).offset(5)
            make.bottom.equalTo(self).offset(-5)
            make.size.equalTo(25)
        }
    }
    
    private func setupWindSpeedLabelConstraints() {
        windSpeedLabel.snp_makeConstraints { make in
            make.left.equalTo(self.animatedTurbineView.snp_right).offset(5)
            make.top.bottom.equalTo(self.animatedTurbineView)
        }
    }
    
    private func setupWindStrengthLabelConstraints() {
        windStrengthLabel.snp_makeConstraints { make in
            make.right.bottom.equalTo(self).offset(-5)
        }
    }
    
}