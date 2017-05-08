//
//  MasterViewController.swift
//  SimplePlayer
//
//  Created by Kemal Enver on 20/03/2017.
//  Copyright © 2017 Kemal Enver. All rights reserved.
//

import UIKit

protocol MenuViewControllerDelegate {
    
    func menuViewController(_ menuViewController: MenuViewController, didSelect menuItem: MenuItem)
}

class MenuViewController: UIViewController {
    
    @IBOutlet var collectionView: UICollectionView! {
        didSet {

            collectionView.delegate = self
            collectionView.dataSource = self
        }
    }
    
    var delegate: MenuViewControllerDelegate?
    
    var menuViewModels = DevUtiltiies.generateMenuViewModels()
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        self.title = "Menu"
        
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "☰", style: UIBarButtonItemStyle.plain, target: nil, action: nil)
        
    }
}

extension MenuViewController {
    
    static func makeMenuViewController(from storyboard: UIStoryboard, delegate: MenuViewControllerDelegate?) -> MenuViewController {
        
        let menuViewController = storyboard.instantiateViewController(withIdentifier: "menu_view_controller") as! MenuViewController
        menuViewController.delegate = delegate
        
        return menuViewController
    }
}

// MARK: - UICollectionViewDataSource
extension MenuViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return menuViewModels.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "menu_cell", for: indexPath)
        
        let menuCell = cell as! MenuCollectionViewCell
        
        menuCell.viewModel = menuViewModels[indexPath.row]
        
        return menuCell
    }
}

// MARK: - UICollectionViewDelegate
extension MenuViewController: UICollectionViewDelegate {

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let menuItemViewModel = self.menuViewModels[indexPath.row]
        
        delegate?.menuViewController(self, didSelect: menuItemViewModel.menuItem)
    }
}

// MARK: - UICollectionViewDelegateFlowLayout
extension MenuViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: collectionView.bounds.width, height: 50)
    }
}

