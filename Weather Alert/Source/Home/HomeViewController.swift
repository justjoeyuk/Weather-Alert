//
//  HomeViewController.swift
//  Weather Alert
//
//  Created by Joey Clover on 10/03/2016.
//  Copyright © 2016 JustJoey. All rights reserved.
//

import Foundation


class HomeViewController : BaseVC {
    
    var homeView: HomeView { return self.view as! HomeView }
    
    override func loadView() {
        self.view = HomeView()
    }
    
}