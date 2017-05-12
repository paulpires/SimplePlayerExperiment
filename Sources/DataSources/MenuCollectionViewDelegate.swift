//
//  MenuCollectionViewDelegate.swift
//  SimplePlayer
//
//  Created by Kemal Enver on 12/05/2017.
//  Copyright © 2017 Kemal Enver. All rights reserved.
//

import Foundation
import UIKit

class MenuCollectionViewDelegate: NSObject {
    
    var menuItemViewModels: [MenuItemViewModel]
    weak var menuViewController: MenuViewController?
    
    init(menuItemViewModels: [MenuItemViewModel], menuViewController: MenuViewController?) {
        
        self.menuItemViewModels = menuItemViewModels
        self.menuViewController = menuViewController
    }
}


extension MenuCollectionViewDelegate: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let menuItemViewModel = self.menuItemViewModels[indexPath.row]
        
        guard let menuViewController = menuViewController else { return }
        
        menuViewController.menuViewControllerDelegate?.menuViewController(menuViewController, didSelect: menuItemViewModel.menuItem)
    }
}

extension MenuCollectionViewDelegate: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: collectionView.bounds.width, height: 50)
    }
}
