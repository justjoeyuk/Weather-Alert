//
//  AppDelegate.swift
//

import UIKit


@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        setupInitialViewController()
        return true
    }
    
    private func setupInitialViewController() {
        let appFrame = UIScreen.mainScreen().bounds
        window = UIWindow(frame: appFrame)
        
        print(UIFont.fontNamesForFamilyName("Oxygen"))
        
        let homeController = HomeViewController()
        let navigationController = UINavigationController(rootViewController: homeController)
        
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
    }
    
}