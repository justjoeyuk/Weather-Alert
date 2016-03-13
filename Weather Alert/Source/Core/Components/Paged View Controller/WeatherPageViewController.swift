//
//  WeatherPageViewController.swift
//  Weather Alert
//
//  Created by Joey Clover on 12/03/2016.
//  Copyright © 2016 JustJoey. All rights reserved.
//

import UIKit


class WeatherPageViewController : UIPageViewController {
    
    let pageDataSource = WeatherPageDatasource()
    
    
    // MARK: Initializing
    
    override init(transitionStyle style: UIPageViewControllerTransitionStyle, navigationOrientation: UIPageViewControllerNavigationOrientation, options: [String : AnyObject]?) {
        super.init(transitionStyle: style, navigationOrientation: navigationOrientation, options: options)
        setup()
    }

    required convenience init?(coder: NSCoder) {
        self.init(transitionStyle:.Scroll, navigationOrientation:.Horizontal, options:nil)
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