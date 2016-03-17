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
    let animatedTurbineView = AnimatedTurbineView()
    let windSpeedLabel = UILabel()
    
    let windDirectionView = WindDirectionView()
    let windDirectionLabel = UILabel()
    
    // We override the frame to add spacing to the cells
    override var frame: CGRect {
        get { return super.frame }
        set (newFrame) {
            var f = newFrame; f.origin.y += 1; f.size.height -= 1
            super.frame = f
        }
    }
    
    override func setup() {
        backgroundColor = UIColor.darkBackgroundColor()
        selectionStyle = .None
        
        setupDayLabel()
        setupAnimatedTurbineView()
        setupWindSpeedLabel()
        setupWindDirectionView()
        setupWindDirectionLabel()
    }
    
    private func setupDayLabel() {
        dayLabel
            .applyOxygenFont(kCellSubHeadingFontSize)
            .applyColor(UIColor.whiteColor())
            .text = "Monday 24th"
        
        contentView.addSubview(dayLabel)
    }
    
    private func setupAnimatedTurbineView() {
        contentView.addSubview(animatedTurbineView)
    }
    
    private func setupWindSpeedLabel() {
        windSpeedLabel
            .applyOxygenFont(kCellStandardFontSize)
            .applyColor(UIColor.whiteColor())
            .text = "20mph"
        
        contentView.addSubview(windSpeedLabel)
    }
    
    private func setupWindDirectionView() {
        contentView.addSubview(windDirectionView)
    }
    
    private func setupWindDirectionLabel() {
        windDirectionLabel
            .applyOxygenFont(kCellStandardFontSize)
            .applyColor(UIColor.whiteColor())
            .text = "SW"
        
        contentView.addSubview(windDirectionLabel)
    }
    
}


extension DailyOverviewTableViewCell {
    
    override func setupConstraints() {
        setupDayLabelConstraints()
        
        setupWindDirectionLabelConstraints()
        setupWindDirectionViewConstraints()
        setupAnimatedTurbineViewConstraints()
        setupWindSpeedLabelConstraints()
    }
    
    private func setupDayLabelConstraints() {
        dayLabel.snp_makeConstraints { make in
            make.left.equalTo(self.contentView).offset(10)
            make.centerY.equalTo(self.contentView)
        }
    }
    
    private func setupWindDirectionLabelConstraints() {
        windDirectionLabel.snp_makeConstraints { make in
            make.right.equalTo(self.contentView).offset(-10)
            make.bottom.equalTo(self.contentView).offset(-10)
        }
    }
    
    private func setupWindDirectionViewConstraints() {
        windDirectionView.snp_makeConstraints { make in
            make.centerX.equalTo(self.windDirectionLabel)
            make.bottom.equalTo(self.windDirectionLabel.snp_top)
            make.size.equalTo(25)
        }
    }
    
    private func setupAnimatedTurbineViewConstraints() {
        animatedTurbineView.snp_makeConstraints { make in
            make.centerX.equalTo(self.windSpeedLabel)
            make.bottom.equalTo(self.windSpeedLabel.snp_top)
            make.size.equalTo(25)
        }
    }
    
    private func setupWindSpeedLabelConstraints() {
        windSpeedLabel.snp_makeConstraints { make in
            make.right.equalTo(self.windDirectionLabel.snp_left).offset(-10)
            make.bottom.equalTo(self.windDirectionLabel)
        }
    }
    
}