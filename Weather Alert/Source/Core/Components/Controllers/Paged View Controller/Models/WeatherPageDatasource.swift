//
//  WeatherPageDatasource.swift
//  Weather Alert
//
//  Created by Joey Clover on 12/03/2016.
//  Copyright © 2016 JustJoey. All rights reserved.
//

import UIKit
import RealmSwift


@objc class WeatherPageDatasource : NSObject, UIPageViewControllerDataSource {
    
    let cities:Results<City>
    
    init(cities:Results<City>) {
        self.cities = cities
        super.init()
    }
    
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
        
        guard index < cities.count - 1 else { return nil }
        
        let newIndex = index + 1
        let newVC = viewControllerForIndex(newIndex)
        
        return newVC
    }
    
    func viewControllerForIndex(index:Int) -> WeatherDetailsViewController {
        let viewController = WeatherDetailsViewController(city: cities[index])
        
        viewController.pageIndex = index
        
        return viewController
    }
    
}