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
    fileprivate let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
    
    fileprivate var splitViewController: SplitViewController!
    fileprivate var masterNavigationController: UINavigationController!
    fileprivate var detailNavigationController: UINavigationController!
    fileprivate var menuViewController: MenuViewController!
    fileprivate var categoryViewController: CategoryViewController!
    
    init(appLaunchOptions: [UIApplicationLaunchOptionsKey: Any]?) {
        
        self.appLaunchOptions = appLaunchOptions
    }
    
    func showInitial() {
        
        menuViewController = MenuViewController.makeMenuViewController(from: storyboard, delegate: self)
        categoryViewController = CategoryViewController.makeCategoryViewController(from: storyboard, delegate: self)
        
        splitViewController = SplitViewController()
        
        masterNavigationController = UINavigationController(rootViewController: menuViewController)
        detailNavigationController = UINavigationController(rootViewController: categoryViewController)
        
        detailNavigationController.navigationBar.barStyle = .black
        masterNavigationController.navigationBar.barStyle = .black
        
        splitViewController.viewControllers = [masterNavigationController, detailNavigationController]
        splitViewController.delegate = self
        
        splitViewController.minimumPrimaryColumnWidth = 250
        splitViewController.maximumPrimaryColumnWidth = 250
        
        window.rootViewController = splitViewController
        window.makeKeyAndVisible()
    }
}

extension AppRouter {
    
    func showVideoViewController(for video: Video) {
    
        let videoViewController = VideoViewController.makeVideoViewController(from: storyboard, video: video, delegate: self)
        splitViewController.present(videoViewController, animated: true, completion: nil)
    }
}

// MARK: - UISplitViewDelegate
extension AppRouter: UISplitViewControllerDelegate {
    
    func splitViewController(_ svc: UISplitViewController, willChangeTo displayMode: UISplitViewControllerDisplayMode) {
        
        
    }
}

// MARK: - View controller displaying
extension AppRouter {
    
    
}

extension AppRouter: MenuViewControllerDelegate {
    
    func menuViewController(_ menuViewController: MenuViewController, didSelect menuItem: MenuItem) {
        
        splitViewController.showDetailViewController(detailNavigationController, sender: self)
    }
}

extension AppRouter: CategoryViewControllerDelegate {
    
    func categoryViewController(_ categoryViewController: CategoryViewController, didSelect video: Video) {
       
        showVideoViewController(for: video)
    }
}

extension AppRouter: VideoViewControllerDelegate {
    
    func videoViewControllerTappedClose(_ videoViewController: VideoViewController) {
        
    }
}

