//
//  WeatherPageViewController.swift
//  Weather Alert
//
//  Created by Joey Clover on 12/03/2016.
//  Copyright © 2016 JustJoey. All rights reserved.
//

import UIKit
import RealmSwift


class WeatherPageViewController : UIPageViewController {
    
    let pageDataSource:WeatherPageDatasource
    
    
    // MARK: Initializing
    
    init(cities:Results<City>) {
        pageDataSource = WeatherPageDatasource(cities: cities)
        super.init(transitionStyle: .Scroll, navigationOrientation: .Horizontal, options: nil)
        
        setup()
    }

    required convenience init?(coder: NSCoder) {
        fatalError("Please use the designated initializer")
    }
    
    
    // MARK: Setup
    
    private func setup() {
        self.delegate = self
        self.dataSource = pageDataSource
        self.edgesForExtendedLayout = .None
    }
    
    func loadInitialViewController(index:Int) {
        let vc = self.pageDataSource.viewControllerForIndex(index)
        self.setViewControllers([vc], direction: .Forward, animated: false, completion: nil)
    }
    
}


// MARK: UIPageViewController Delegate

extension WeatherPageViewController : UIPageViewControllerDelegate {
}