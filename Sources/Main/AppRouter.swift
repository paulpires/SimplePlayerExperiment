//
//  Router.swift
//  SimplePlayer
//
//  Created by Kemal Enver on 20/03/2017.
//  Copyright © 2017 Kemal Enver. All rights reserved.
//

import Foundation
import UIKit

class AppRouter {
    
    fileprivate var appLaunchOptions: [UIApplicationLaunchOptionsKey: Any]?
    fileprivate let window: UIWindow = UIWindow(frame: UIScreen.main.bounds)
    
    fileprivate var splitViewController: SplitViewController!
    fileprivate var masterNavigationController: UINavigationController!
    fileprivate var detailNavigationController: UINavigationController!
    fileprivate var menuViewController: MenuViewController!
    fileprivate var categoryViewController: CategoryViewController!
    
    fileprivate var provider: Provider = {
        return Provider(storeage: "test", networkAPI: "")
    }()
    
    init(appLaunchOptions: [UIApplicationLaunchOptionsKey: Any]?) {
        
        self.appLaunchOptions = appLaunchOptions
    }
    
    public func showInitial() {
        
        createViewControllers()
        configureViewControllers()
        configureWindowRootController()
    }

    private func createViewControllers() {
        
        menuViewController = MenuViewController(provider: self.provider, delegate: self)
        categoryViewController = CategoryViewController(provider: self.provider, delegate: self)
        
        splitViewController = SplitViewController()
        
        masterNavigationController = UINavigationController(rootViewController: menuViewController)
        detailNavigationController = UINavigationController(rootViewController: categoryViewController)
    }
    
    private func configureViewControllers() {
        
        detailNavigationController.navigationBar.barStyle = .black
        masterNavigationController.navigationBar.barStyle = .black
        
        splitViewController.viewControllers = [masterNavigationController, detailNavigationController]
        
        splitViewController.minimumPrimaryColumnWidth = 250
        splitViewController.maximumPrimaryColumnWidth = 250
    }
    
    private func configureWindowRootController() {
        
        window.rootViewController = splitViewController
        window.makeKeyAndVisible()
    }
}

// MARK: - View controller presenting
extension AppRouter {
    
    public func showSeriesViewController(for video: Video) {
    
        let seriesViewController = SeriesViewController(provider: self.provider)
        splitViewController.present(seriesViewController, animated: true, completion: nil)
    }
}

// MARK: - View Controller Delegate Handling
extension AppRouter: MenuViewControllerDelegate {
    
    public func menuViewController(_ menuViewController: MenuViewController, didSelect menuItem: MenuItem) {
        
        splitViewController.showDetailViewController(detailNavigationController, sender: self)
    }
}

extension AppRouter: CategoryViewControllerDelegate {
    
    public func categoryViewController(_ categoryViewController: CategoryViewController, didSelect video: Video) {
       
        showSeriesViewController(for: video)
    }
}


