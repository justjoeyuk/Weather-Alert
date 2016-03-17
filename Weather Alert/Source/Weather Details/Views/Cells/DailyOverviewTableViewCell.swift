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
    
    override func setup() {
        backgroundColor = UIColor.darkBackgroundColor()
        
        setupDayLabel()
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