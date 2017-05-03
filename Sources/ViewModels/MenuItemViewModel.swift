//
//  MenuItemViewModel.swift
//  SkySkunk
//
//  Created by Kemal Enver on 21/03/2017.
//  Copyright © 2017 Kemal Enver. All rights reserved.
//

import Foundation

final class MenuItemViewModel {
    
    private let menuItem: MenuItem
    
    var name: String {
        return menuItem.name.uppercased()
    }
    
    var description: String {
        return menuItem.description
    }
    
    init(menuItem: MenuItem) {
    
        self.menuItem = menuItem
    }
}
