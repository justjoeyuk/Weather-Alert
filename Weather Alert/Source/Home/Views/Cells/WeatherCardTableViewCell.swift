//
//  WeatherCardTableViewCell.swift
//  Weather Alert
//
//  Created by Joey Clover on 11/03/2016.
//  Copyright © 2016 JustJoey. All rights reserved.
//

import UIKit


class WeatherCardTableViewCell : BaseTableViewCell {
    
    weak var city:City?
    weak var forecast:Forecast?
    
    let backgroundImageView = UIImageView()
    let animatedTurbineView = AnimatedTurbineView()
    let windDirectionView = WindDirectionView()
    
    let horizontalPipe = UIView()
    let cityLabel = UILabel()
    let windSpeedLabel = UILabel()
    let windDirectionLabel = UILabel()
    let windStrengthLabel = UILabel()
    
    // We override the frame to add spacing to the cells
    override var frame: CGRect {
        get {
            return super.frame
        }
        set (newFrame) {
            var f = newFrame
            f.origin.y += 10;
            f.size.height -= 10
            
            super.frame = f
        }
    }
    
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: .Default, reuseIdentifier: kWeatherCardCellIdentifier)
    }
    
    
    // MARK: Setup
    
    override func setup() {
        self.applyClipping()
            .applyColor(UIColor.whiteColor())
            .selectionStyle = .None
        
        setupBackgroundImageView()
        setupCityLabel()
        
        setupHorizontalPipe()
        setupAnimatedTurbineView()
        setupWindDirectionView()
        setupWindSpeedLabel()
        setupWindDirectionLabel()
        setupWindStrengthLabel()
    }
    
    private func setupBackgroundImageView() {
        backgroundImageView.contentMode = .ScaleAspectFill
        
        backgroundImageView
            .applyClipping()
            .applyOverlay()
            .image = UIImage.Asset.Mock_Location.image
        
        contentView.addSubview(self.backgroundImageView)
    }
    
    private func setupCityLabel() {
        cityLabel
            .applyAutoSize()
            .applyOxygenFont(kCellHeadingFontSize)
            .applyColor(UIColor.whiteColor())
            .text = "Manchester"
        
        contentView.addSubview(self.cityLabel)
    }
    
    private func setupHorizontalPipe() {
        horizontalPipe.backgroundColor = UIColor.whiteColor()
        contentView.addSubview(horizontalPipe)
    }
    
    private func setupAnimatedTurbineView() {
        contentView.addSubview(animatedTurbineView)
    }
    
    private func setupWindDirectionView() {
        contentView.addSubview(windDirectionView)
    }
    
    private func setupWindDirectionLabel() {
        windDirectionLabel
            .applyAutoSize()
            .applyOxygenFont(kCellStandardFontSize)
            .applyColor(UIColor.whiteColor())
            .centered
            .oneLine
            .text = "SW"
        
        contentView.addSubview(windDirectionLabel)
    }
    
    private func setupWindSpeedLabel() {
        windSpeedLabel
            .applyAutoSize()
            .applyOxygenFont(kCellStandardFontSize)
            .applyColor(UIColor.whiteColor())
            .centered
            .oneLine
            .text = "20mph"
        
        contentView.addSubview(windSpeedLabel)
    }
    
    private func setupWindStrengthLabel() {
        windStrengthLabel
            .applyOxygenFont(kCellSubHeadingFontSize)
            .applyColor(UIColor.whiteColor())
            .text = "Very Windy"
        
        contentView.addSubview(windStrengthLabel)
    }
    
    
    // MARK: Update Cell
    
    func updateWithCity(city:City, forecast:Forecast) {
        /** TODO: I have considered making this implementation and have it in a protocol, I have
         two views in the app that do this exact setup. It's a pretty bad case of DRY. However,
         time restrictions are in place. */
        self.city = city
        self.forecast = forecast
        
        let windDirection = Double(forecast.windDirection)
        let windSpeed = Double(forecast.windSpeed)
        
        cityLabel.text = city.name
        
        windSpeedLabel.text = String(format: "%.1f mph", windSpeed)
        windStrengthLabel.text = windDescriptionFromSpeed(windSpeed)
        
        windDirectionLabel.text = cardinalDirectionFromDegrees(windDirection)
        windDirectionView.setWindDirection(windDirection)
        
        backgroundImageView.kf_setImageWithURL(NSURL(string: city.imageUrl)!, placeholderImage: kCityPlaceholderImage)
        
        animatedTurbineView.applyRotationAnimation(100.0/windSpeed)
    }
    
}


extension WeatherCardTableViewCell {
    
    override func setupConstraints() {
        setupBackgroundImageViewConstraints()
        setupCityLabelConstraints()
        
        setupHorizontalPipeConstraints()
        
        setupAnimatedTurbineViewConstraints()
        setupWindDirectionViewConstraints()

        setupWindSpeedLabelConstraints()
        setupWindDirectionLabelConstraints()
        setupWindStrengthLabelConstraints()
    }
    
    private func setupBackgroundImageViewConstraints() {
        self.backgroundImageView.snp_makeConstraints { make in
            make.edges.equalTo(self.contentView)
        }
    }
    
    private func setupCityLabelConstraints() {
        self.cityLabel.snp_makeConstraints { make in
            make.top.equalTo(self.contentView)
            make.left.equalTo(self.contentView).offset(20)
            make.width.equalTo(self.contentView).multipliedBy(0.5)
            make.bottom.equalTo(self.horizontalPipe.snp_top)
        }
    }
    
    private func setupHorizontalPipeConstraints() {
        self.horizontalPipe.snp_makeConstraints { make in
            make.bottom.equalTo(self.contentView).offset(-65)
            make.centerX.equalTo(self.contentView)
            make.width.equalTo(self.contentView).multipliedBy(0.9)
            make.height.equalTo(1)
        }
    }
    
    private func setupWindDirectionViewConstraints() {
        windDirectionView.snp_makeConstraints { make in
            make.size.equalTo(25)
            make.left.equalTo(self.animatedTurbineView.snp_right).offset(20)
            make.top.equalTo(self.animatedTurbineView)
        }
    }
    
    private func setupWindDirectionLabelConstraints() {
        windDirectionLabel.snp_makeConstraints { make in
            make.centerX.equalTo(self.windDirectionView)
            make.bottom.equalTo(self.contentView).offset(-5)
            make.width.equalTo(self.windDirectionView)
        }
    }
    
    private func setupAnimatedTurbineViewConstraints() {
        self.animatedTurbineView.snp_makeConstraints { make in
            make.bottom.equalTo(self.windSpeedLabel.snp_top)
            make.left.equalTo(self.contentView).offset(10)
            make.size.equalTo(32)
        }
    }
    
    private func setupWindSpeedLabelConstraints() {
        self.windSpeedLabel.snp_makeConstraints { make in
            make.bottom.equalTo(self.contentView).offset(-5)
            make.centerX.equalTo(self.animatedTurbineView)
            make.width.equalTo(self.animatedTurbineView)
        }
    }
    
    private func setupWindStrengthLabelConstraints() {
        self.windStrengthLabel.snp_makeConstraints { make in
            make.top.equalTo(self.horizontalPipe.snp_bottom)
            make.bottom.equalTo(self.contentView)
            make.right.equalTo(self.contentView).offset(-10)
        }
    }
    
}