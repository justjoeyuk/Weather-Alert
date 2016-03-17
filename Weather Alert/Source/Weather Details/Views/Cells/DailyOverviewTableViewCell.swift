//
//  DailyWeatherTableViewCell.swift
//  Weather Alert
//
//  Created by Joey Clover on 13/03/2016.
//  Copyright © 2016 JustJoey. All rights reserved.
//

import UIKit


class DailyOverviewTableViewCell : BaseTableViewCell {
    
    let dayLabel = UILabel()
    let animatedTurbineView = UIImageView()
    let windSpeedLabel = UILabel()
    
    let windDirectionImageView = UIImageView()
    let windDirectionLabel = UILabel()
    
    
    override func setup() {
        backgroundColor = UIColor.darkBackgroundColor()
        
        setupDayLabel()
        setupAnimatedTurbineView()
        setupWindSpeedLabel()
        setupWindDirectionImageView()
        setupWindDirectionLabel()
    }
    
    func setupAnimatedTurbineView() {
        // TODO: Update hardcoded time (extract code out)
        animatedTurbineView.image = UIImage.Asset.Turbine.image
        animatedTurbineView.applyRotationAnimation(3)
        animatedTurbineView.contentMode = .ScaleAspectFit
    }
    
    func setupWindSpeedLabel() {
        
    }
    
    func setupWindDirectionImageView() {
        
    }
    
    func setupWindDirectionLabel() {
        
    }
    
    private func setupDayLabel() {
        dayLabel.applyOxygenFont(20).applyColor(UIColor.whiteColor())
        dayLabel.text = "Monday 24th"
        
        contentView.addSubview(dayLabel)
    }
    
}


extension DailyOverviewTableViewCell {
    
    override func setupConstraints() {
        setupDayLabelConstraints()
    }
    
    private func setupDayLabelConstraints() {
        dayLabel.snp_makeConstraints { make in
            make.left.equalTo(self.contentView).offset(10)
            make.centerY.equalTo(self.contentView)
        }
    }
    
}