//
//  WeatherPageDatasource.swift
//  Weather Alert
//
//  Created by Joey Clover on 12/03/2016.
//  Copyright © 2016 JustJoey. All rights reserved.
//

import UIKit


@objc class WeatherPageDatasource : NSObject, UIPageViewControllerDataSource {
    
    let indexs = [NSNumber(int: 1), NSNumber(int: 2), NSNumber(int: 3), NSNumber(int: 4), NSNumber(int: 5)]
    
    func pageViewController(pageViewController: UIPageViewController, viewControllerBeforeViewController viewController: UIViewController) -> UIViewController? {
        let viewController = viewController as! WeatherDetailsViewController
        let index = viewController.pageIndex
        
        guard index > 0 else { return nil }
        
        let newIndex = index - 1
        let newVC = viewControllerForIndex(newIndex)
        
        return newVC
    }
    
    func pageViewController(pageViewController: UIPageViewController, viewControllerAfterViewController viewController: UIViewController) -> UIViewController? {
        let viewController = viewController as! WeatherDetailsViewController
        let index = viewController.pageIndex
        
        guard index <= indexs.count else { return nil }
        
        let newIndex = index + 1
        let newVC = viewControllerForIndex(newIndex)
        
        return newVC
    }
    
    func viewControllerForIndex(index:Int) -> WeatherDetailsViewController {
        let viewController = WeatherDetailsViewController()
        
        viewController.applyModel("Page \(index)")
        viewController.pageIndex = index
        
        return viewController
    }
    
}