//
//  TodayForecastCollectionViewCell.swift
//  Weather Alert
//
//  Created by Joey Clover on 12/03/2016.
//  Copyright © 2016 JustJoey. All rights reserved.
//

import UIKit


class TodayForecastCollectionViewCell : BaseCollectionViewCell {
    
    let timeLabel = UILabel()
    let windDirectionView = UIImageView()
    let windSpeedLabel = UILabel()
    
    
    override func setup() {
        setupTimeLabel()
        setupWindDirectionView()
        setupWindSpeedLabel()
    }
    
    private func setupTimeLabel() {
        timeLabel
            .applyAutoSize()
            .applyOxygenFont()
            .applyColor(UIColor.whiteColor())
            .centered
            .text = "12:00"
        
        contentView.addSubview(timeLabel)
    }
    
    private func setupWindDirectionView() {
        windDirectionView.image = UIImage.Asset.Arrow.image
        windDirectionView.contentMode = .ScaleAspectFit
        
        contentView.addSubview(windDirectionView)
    }
    
    private func setupWindSpeedLabel() {
        windSpeedLabel
            .applyAutoSize()
            .applyOxygenFont()
            .applyColor(UIColor.whiteColor())
            .centered
            .text = "25mph"
        
        contentView.addSubview(windSpeedLabel)
    }
    
}


extension TodayForecastCollectionViewCell {
    
    override func setupConstraints() {
        setupTimeLabelConstraints()
        setupWindDirectionViewConstraints()
        setupWindSpeedLabelConstraints()
    }
    
    private func setupTimeLabelConstraints() {
        timeLabel.snp_makeConstraints { make in
            make.height.equalTo(20)
            make.top.centerX.equalTo(self.contentView)
            make.width.equalTo(self.contentView).multipliedBy(0.7)
        }
    }
    
    private func setupWindDirectionViewConstraints() {
        windDirectionView.snp_makeConstraints { make in
            make.top.equalTo(self.timeLabel.snp_bottom)
            make.centerX.equalTo(self.timeLabel)
            make.bottom.equalTo(self.windSpeedLabel.snp_top)
        }
    }
    
    private func setupWindSpeedLabelConstraints() {
        windSpeedLabel.snp_makeConstraints { make in
            make.height.equalTo(20)
            make.bottom.centerX.equalTo(self.contentView)
            make.width.equalTo(self.contentView).multipliedBy(0.7)
        }
    }
    
}