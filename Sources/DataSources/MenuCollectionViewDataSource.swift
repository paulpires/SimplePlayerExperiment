//
//  MenuCollectionViewDataSource.swift
//  SimplePlayer
//
//  Created by Kemal Enver on 12/05/2017.
//  Copyright © 2017 Kemal Enver. All rights reserved.
//

import Foundation
import UIKit

class MenuCollectionViewDataSource: NSObject {
    
    var menuItemViewModels: [MenuItemViewModel]
    
    init(menuItemViewModels: [MenuItemViewModel]) {
        
        self.menuItemViewModels = menuItemViewModels
    }
}

extension MenuCollectionViewDataSource: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return menuItemViewModels.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "menu_cell", for: indexPath)
        
        let menuCell = cell as! MenuCollectionViewCell
        
        menuCell.viewModel = menuItemViewModels[indexPath.row]
        
        return menuCell
    }
}
