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
    let provider: Provider
    
    fileprivate var collectionViewDataSource: MenuCollectionViewDataSource?
    fileprivate var collectionViewDelegate: MenuCollectionViewDelegate?
    fileprivate var menuItemViewModels = [MenuItemViewModel]() {
        didSet {
            self.reloadWith(oldData: oldValue, newData: menuItemViewModels)
        }
    }
    
    init(provider: Provider, delegate: MenuViewControllerDelegate) {
        
        self.provider = provider
        self.menuViewControllerDelegate = delegate
        super.init(nibName:nil, bundle:nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension MenuViewController {
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        setupControllerDetails()
        registerCollectionViewCells()
        updateData()
    }
}

extension MenuViewController {
    
    fileprivate func updateData() {
        
        menuItemViewModels = provider.menuViewModels()
    }
 
    fileprivate func setupControllerDetails() {
        
        self.title = "Menu"
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "☰", style: UIBarButtonItemStyle.plain, target: nil, action: nil)
    }
    
    fileprivate func reloadWith(oldData: [MenuItemViewModel], newData: [MenuItemViewModel]) {
        
        let menuViewModels = self.provider.menuViewModels()
        
        collectionViewDataSource =  MenuCollectionViewDataSource(menuItemViewModels: menuViewModels)
        collectionViewDelegate = MenuCollectionViewDelegate(menuItemViewModels: menuViewModels, menuViewController: self)
        
        collectionView.dataSource = collectionViewDataSource
        collectionView.delegate = collectionViewDelegate
        collectionView.reloadData()
    }
    
    fileprivate func registerCollectionViewCells() {
        
        let nib = UINib(nibName: "MenuCollectionViewCell", bundle: nil)
        collectionView.register(nib, forCellWithReuseIdentifier: "menu_cell")
    }
}

