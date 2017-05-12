//
//  MasterViewController.swift
//  SimplePlayer
//
//  Created by Kemal Enver on 20/03/2017.
//  Copyright © 2017 Kemal Enver. All rights reserved.
//

import UIKit

protocol MenuViewControllerDelegate: class {
    
    func menuViewController(_ menuViewController: MenuViewController, didSelect menuItem: MenuItem)
}

class MenuViewController: UIViewController {
    
    @IBOutlet var collectionView: UICollectionView!
    
    weak var menuViewControllerDelegate: MenuViewControllerDelegate?
    
    fileprivate var collectionViewDataSource: MenuCollectionViewDataSource?
    fileprivate var collectionViewDelegate: MenuCollectionViewDelegate?
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        self.title = "Menu"
        
        setupCollectionView()
        
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "☰", style: UIBarButtonItemStyle.plain, target: nil, action: nil)
    }
    
    private func setupCollectionView() {
        
        let menuViewModels = DevUtiltiies.generateMenuViewModels()
        
        collectionViewDataSource =  MenuCollectionViewDataSource(menuItemViewModels: menuViewModels)
        collectionViewDelegate = MenuCollectionViewDelegate(menuItemViewModels: menuViewModels, menuViewController: self)
        
        collectionView.dataSource = collectionViewDataSource
        collectionView.delegate = collectionViewDelegate
    }
}

extension MenuViewController {
    
    static func makeMenuViewController(from storyboard: UIStoryboard, delegate: MenuViewControllerDelegate?) -> MenuViewController {
        
        let menuViewController = storyboard.instantiateViewController(withIdentifier: "menu_view_controller") as! MenuViewController
        menuViewController.menuViewControllerDelegate = delegate
        
        return menuViewController
    }
}
