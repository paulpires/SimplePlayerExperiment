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
        
        let storage = PersistentStore()
        let networkClient = "Netowrk client will go here"
        
        return Provider(storeage: storage, networkAPI: networkClient)
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
        
        splitViewController = SplitViewController()
        menuViewController = MenuViewController(provider: self.provider, delegate: self)
        categoryViewController = CategoryViewController(provider: self.provider, delegate: self)
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
    
    public func showVideoDetailsViewController(for video: Video) {
    
        let videoDetailsViewController = VideoDetailsViewController(provider: self.provider)
        splitViewController.present(videoDetailsViewController, animated: true, completion: nil)
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
       
        showVideoDetailsViewController(for: video)
    }
}


