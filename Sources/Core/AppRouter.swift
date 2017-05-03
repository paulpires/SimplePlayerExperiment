//
//  Router.swift
//  SkySkunk
//
//  Created by Kemal Enver on 20/03/2017.
//  Copyright © 2017 Kemal Enver. All rights reserved.
//

import Foundation
import UIKit

class AppRouter {
    
    fileprivate var appLaunchOptions: [UIApplicationLaunchOptionsKey: Any]?
    fileprivate let window: UIWindow = UIWindow(frame: UIScreen.main.bounds)
    fileprivate let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
    fileprivate let splitViewController: UISplitViewController!
    fileprivate var masterNavigationController: UINavigationController!
    fileprivate var detailNavigationController: UINavigationController!
    fileprivate var menuViewController: UIViewController!
    fileprivate var categoryViewController: UIViewController!
    
    init(appLaunchOptions: [UIApplicationLaunchOptionsKey: Any]?) {
        
        self.appLaunchOptions = appLaunchOptions
        
        menuViewController = storyboard.instantiateViewController(withIdentifier: "menu_view_controller")
        categoryViewController = storyboard.instantiateViewController(withIdentifier: "category_view_controller")
        
        masterNavigationController = UINavigationController(rootViewController: menuViewController)
        detailNavigationController = UINavigationController(rootViewController: categoryViewController)
        
        splitViewController = UISplitViewController()
        splitViewController.viewControllers = [masterNavigationController, detailNavigationController]
        splitViewController.minimumPrimaryColumnWidth = 250
        splitViewController.maximumPrimaryColumnWidth = 250
        splitViewController.delegate = self
        
        window.rootViewController = splitViewController
        window.makeKeyAndVisible()
    }
}

// MARK: - UISplitViewDelegate
extension AppRouter: UISplitViewControllerDelegate {
    
    
}

// MARK: - View controller displaying
extension AppRouter {
    
}
