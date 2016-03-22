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
        weatherCardDatasource.tableView = weatherCardTable
        
        weatherCardTable.registerClass(WeatherCardTableViewCell.self, forCellReuseIdentifier: "WeatherCardCell")
        weatherCardTable.separatorStyle = .None
        weatherCardTable.dataSource = weatherCardDatasource
        weatherCardTable.delegate = self
        weatherCardTable.reloadData()
        
        navigationController?.navigationBar.tintColor = UIColor.whiteColor()
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage.Asset.ListIcon.image, style: .Plain, target: self, action: "modifyCities")
        
        homeView.addCityButton.addTarget(self, action: "addCity", forControlEvents: .TouchUpInside)
    }
    
    func modifyCities() {
        let modifyVC = ModifyCitiesViewController(cities: weatherCardDatasource.cityList)
        navigationController?.pushViewController(modifyVC, animated: true)
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
        WeatherAPIManager.gatherFiveDayForecast(place.formattedAddress) { success, error in
            print("Forecast Result for \(place.name): \(success ? "true" : "false")")
            self.dismissViewControllerAnimated(true, completion: nil)
        }
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
        let pvc = WeatherPageViewController(cities: weatherCardDatasource.cityList)
        
        pvc.loadInitialViewController(indexPath.row)
        pvc.title = "Forecast".localized
        
        self.navigationController?.pushViewController(pvc, animated: true)
    }
    
}