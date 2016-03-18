//
//  HomeViewController.swift
//  Weather Alert
//
//  Created by Joey Clover on 10/03/2016.
//  Copyright © 2016 JustJoey. All rights reserved.
//

import UIKit
import RealmSwift
import GoogleMaps


class HomeViewController : BaseVC {
    
    var homeView: HomeView { return self.view as! HomeView }
    
    let weatherCardDatasource = WeatherCardTableViewDataSource()
    
    
    override func loadView() {
        self.view = HomeView()
    }
    
    override func viewDidLoad() {
        self.title = "Home"
        let weatherCardTable = homeView.weatherCardTableView
        
        weatherCardTable.registerClass(WeatherCardTableViewCell.self, forCellReuseIdentifier: "WeatherCardCell")
        weatherCardTable.separatorStyle = .None
        weatherCardTable.dataSource = weatherCardDatasource
        weatherCardTable.delegate = self
        
        homeView.addCityButton.addTarget(self, action: "addCity", forControlEvents: .TouchUpInside)
    }
    
    func addCity() {
        let acController = GMSAutocompleteViewController()
        let filter = GMSAutocompleteFilter()
        
        filter.type = .City
        acController.autocompleteFilter = filter
        
        acController.delegate = self
        self.presentViewController(acController, animated: true, completion: nil)
    }
    
}


extension HomeViewController : GMSAutocompleteViewControllerDelegate {
    
    // Handle the user's selection.
    func viewController(viewController: GMSAutocompleteViewController, didAutocompleteWithPlace place: GMSPlace) {
        if let safePlaceAddress = place.formattedAddress?.stringByAddingPercentEncodingWithAllowedCharacters(.URLHostAllowedCharacterSet()) {
            print(safePlaceAddress)
        }
        else {
            let controller = UIAlertController(title: "A Problem Occured.", message: "Sorry, something happened. We could not find that location", preferredStyle: .Alert)
            self.presentViewController(controller, animated: true, completion: nil)
        }
        
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    func viewController(viewController: GMSAutocompleteViewController, didFailAutocompleteWithError error: NSError) {
        // TODO: handle the error.
        print("Error: \(error.description)")
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    // User canceled the operation.
    func wasCancelled(viewController: GMSAutocompleteViewController) {
        print("Autocomplete was cancelled.")
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
}

extension HomeViewController : UITableViewDelegate {
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 150
    }
    
    func tableView(tableView: UITableView, estimatedHeightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 150
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let pvc = WeatherPageViewController(transitionStyle: .Scroll, navigationOrientation: .Horizontal, options: nil)
        pvc.loadInitialViewController(indexPath.row)
        pvc.title = "Forecast".localized
        
        self.navigationController?.pushViewController(pvc, animated: true)
    }
    
}