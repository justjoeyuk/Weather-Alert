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
    let animatedTurbineView = UIImageView()
    let windDirectionView = UIImageView()
    
    let infoView = UIView()
    let cityLabel = UILabel()
    let windSpeedLabel = UILabel()
    let windDirectionLabel = UILabel()
    let windStrengthLabel = UILabel()
    
    override var frame: CGRect {
        get {
            return super.frame
        }
        set (newFrame) {
            var f = newFrame
            //f.origin.x += 10; 
            f.origin.y += 10;
            //f.size.width -= 2 * 10; 
            f.size.height -= 10
            
            //self.layer.cornerRadius = f.width / 30
            super.frame = f
        }
    }
    
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: .Default, reuseIdentifier: "WeatherCardCell")
    }
    
    
    // MARK: Setup
    
    override func setup() {
        self.selectionStyle = .None
        self.backgroundColor = UIColor.whiteColor()
        self.clipsToBounds = true
        self.contentView.clipsToBounds = true
        
        setupBackgroundImageView()
        setupCityLabel()
        
        setupInfoView()
        setupAnimatedTurbineView()
        setupWindDirectionView()
        setupWindSpeedLabel()
        setupWindDirectionLabel()
        setupWindStrengthLabel()
    }
    
    private func setupBackgroundImageView() {
        backgroundImageView.image = UIImage.Asset.Mock_Location.image
        backgroundImageView.clipsToBounds = true
        backgroundImageView.contentMode = .ScaleAspectFill
        backgroundImageView.opaque = true
        
        let overlay = UIView()
        overlay.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.6)
        
        backgroundImageView.addSubview(overlay)
        overlay.snp_makeConstraints { make in make.edges.equalTo(self.backgroundImageView) }
        
        contentView.addSubview(self.backgroundImageView)
    }
    
    private func setupCityLabel() {
        cityLabel.text = "Manchester"
        cityLabel.applyAutoSize().applyOxygenFont().applyColor(UIColor.whiteColor()).centered
        
        contentView.addSubview(self.cityLabel)
    }
    
    private func setupInfoView() {
        infoView.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.75)
        contentView.addSubview(infoView)
    }
    
    private func setupAnimatedTurbineView() {
        animatedTurbineView.image = UIImage.Asset.Turbine.image
        animatedTurbineView.opaque = true
        animatedTurbineView.contentMode = .ScaleAspectFit
        
        infoView.addSubview(animatedTurbineView)
    }
    
    private func setupWindDirectionView() {
        windDirectionView.opaque = true
        windDirectionView.image = UIImage.Asset.Arrow.image
        
        let transform = CGAffineTransformRotate(CGAffineTransformIdentity, 4);
        self.windDirectionView.transform = transform;
        
        infoView.addSubview(windDirectionView)
    }
    
    private func setupWindDirectionLabel() {
        windDirectionLabel.text = "SW"
        
        windDirectionLabel.applyAutoSize().applyOxygenFont(12).applyColor(UIColor.whiteColor()).centered
        windDirectionLabel.numberOfLines = 1
        
        infoView.addSubview(windDirectionLabel)
    }
    
    private func setupWindSpeedLabel() {
        windSpeedLabel.text = "20mph"
        windSpeedLabel.applyAutoSize().applyOxygenFont(12).applyColor(UIColor.whiteColor()).centered
        windSpeedLabel.numberOfLines = 1
        
        infoView.addSubview(windSpeedLabel)
    }
    
    private func setupWindStrengthLabel() {
        windStrengthLabel.text = "Very Windy"
        windStrengthLabel.applyOxygenFont(16).applyColor(UIColor.whiteColor())
        
        infoView.addSubview(windStrengthLabel)
    }
    
    
    // MARK: Update Cell
    
    func updateWithModel(model:AnyObject!) {
        animatedTurbineView.applyRotationAnimation(4)
    }
    
}


extension WeatherCardTableViewCell {
    
    override func setupConstraints() {
        setupBackgroundImageViewConstraints()
        setupCityLabelConstraints()
        
        setupInfoViewConstraints()
        
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
            make.top.equalTo(self.backgroundImageView)
            make.left.equalTo(self.contentView).offset(20)
            make.right.equalTo(self.contentView).offset(-20)
            make.bottom.equalTo(self.infoView.snp_top)
        }
    }
    
    private func setupInfoViewConstraints() {
        self.infoView.snp_makeConstraints { make in
            make.bottom.left.right.equalTo(self.contentView)
            make.height.equalTo(65)
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
            make.bottom.equalTo(self.infoView).offset(-5)
            make.width.equalTo(self.windDirectionView)
        }
    }
    
    private func setupAnimatedTurbineViewConstraints() {
        self.animatedTurbineView.snp_makeConstraints { make in
            make.bottom.equalTo(self.windSpeedLabel.snp_top)
            make.left.equalTo(self.infoView).offset(10)
            make.size.equalTo(32)
        }
    }
    
    private func setupWindSpeedLabelConstraints() {
        self.windSpeedLabel.snp_makeConstraints { make in
            make.bottom.equalTo(self.infoView).offset(-5)
            make.centerX.equalTo(self.animatedTurbineView)
            make.width.equalTo(self.animatedTurbineView)
        }
    }
    
    private func setupWindStrengthLabelConstraints() {
        self.windStrengthLabel.snp_makeConstraints { make in
            make.top.equalTo(self.cityLabel.snp_bottom)
            make.bottom.equalTo(self.infoView)
            make.right.equalTo(self.infoView).offset(-10)
        }
    }
    
}