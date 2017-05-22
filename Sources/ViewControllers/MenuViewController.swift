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
    
    init(delegate: MenuViewControllerDelegate) {
        
        super.init(nibName:nil, bundle:nil)
        
        self.menuViewControllerDelegate = delegate
    }
    
    required init?(coder aDecoder: NSCoder) {
        
        fatalError("init(coder:) has not been implemented")
    }
}

extension MenuViewController {
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        setupCollectionViewDelegates()
        registerCollectionViewCells()
        
        setupControllerDetails()
    }
    
    private func setupControllerDetails() {
        
        self.title = "Menu"
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "☰", style: UIBarButtonItemStyle.plain, target: nil, action: nil)
    }
    
    private func setupCollectionViewDelegates() {
        
        let menuViewModels = DevUtiltiies.generateMenuViewModels()
        
        collectionViewDataSource =  MenuCollectionViewDataSource(menuItemViewModels: menuViewModels)
        collectionViewDelegate = MenuCollectionViewDelegate(menuItemViewModels: menuViewModels, menuViewController: self)
        
        collectionView.dataSource = collectionViewDataSource
        collectionView.delegate = collectionViewDelegate
    }
    
    func registerCollectionViewCells() {
        
        let nib = UINib(nibName: "MenuCollectionViewCell", bundle: nil)
        collectionView.register(nib, forCellWithReuseIdentifier: "menu_cell")
    }
}

