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