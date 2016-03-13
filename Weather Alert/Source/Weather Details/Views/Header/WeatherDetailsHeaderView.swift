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
    
    let windDirectionView = UIImageView()
    let windDirectionLabel = UILabel()
    
    let animatedTurbineView = UIImageView()
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
        backgroundImageView.clipsToBounds = true
        backgroundImageView.image = UIImage.Asset.Mock_Location.image
        backgroundImageView.contentMode = .ScaleAspectFill
        
        let overlay = UIView()
        overlay.backgroundColor = UIColor.darkTransparentColor()
        
        backgroundImageView.addSubview(overlay)
        overlay.snp_makeConstraints { make in make.edges.equalTo(self.backgroundImageView) }
        
        addSubview(backgroundImageView)
    }
    
    private func setupCityNameLabel() {
        cityNameLabel.applyAutoSize().applyOxygenFont(40).applyColor(UIColor.whiteColor()).centered
        cityNameLabel.text = "Manchester"
        
        addSubview(cityNameLabel)
    }
    
    private func setupWindDirectionLabel() {
        windDirectionLabel.applyOxygenFont(18).applyColor(UIColor.whiteColor())
        windDirectionLabel.text = "SW"
        
        addSubview(windDirectionLabel)
    }
    
    private func setupWindDirectionView() {
        windDirectionView.image = UIImage.Asset.Arrow.image
        windDirectionView.contentMode = .ScaleAspectFit
        
        addSubview(windDirectionView)
    }
    
    private func setupAnimatedTurbineView() {
        animatedTurbineView.image = UIImage.Asset.Turbine.image
        animatedTurbineView.applyRotationAnimation(3)
        animatedTurbineView.contentMode = .ScaleAspectFit
        
        addSubview(animatedTurbineView)
    }
    
    private func setupWindSpeedLabel() {
        windSpeedLabel.applyOxygenFont(18).applyColor(UIColor.whiteColor())
        windSpeedLabel.text = "20mph"
        
        addSubview(windSpeedLabel)
    }
    
    private func setupWindStrengthLabel() {
        windStrengthLabel.applyOxygenFont(24).applyColor(UIColor.whiteColor())
        windStrengthLabel.text = "Windy"
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