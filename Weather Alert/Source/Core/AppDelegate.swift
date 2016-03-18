//
//  AppDelegate.swift
//

import UIKit
import GoogleMaps


@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        setupGoogleMaps()
        setupInitialViewController()
        return true
    }
    
    private func setupGoogleMaps() {
        GMSServices.provideAPIKey("AIzaSyA26srX_xwXDdFC8SQp-LzxxH2I7Zq8Wog")
    }
    
    private func setupInitialViewController() {
        let appFrame = UIScreen.mainScreen().bounds
        window = UIWindow(frame: appFrame)
        
        let shadow = NSShadow()
        shadow.shadowColor = UIColor.blackColor()
        shadow.shadowOffset = CGSizeMake(-1, 0)
        
        let titleAttr = [NSForegroundColorAttributeName:UIColor.whiteColor(),
                         NSShadowAttributeName:shadow]
        UINavigationBar.appearance().titleTextAttributes = titleAttr
        UINavigationBar.appearance().barStyle = .Black
        
        let homeController = HomeViewController()
        let navigationController = UINavigationController(rootViewController: homeController)
        
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
    }
    
}