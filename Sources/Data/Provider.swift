//
//  Provider.swift
//  SimplePlayer
//
//  Created by Kemal Enver on 22/05/2017.
//  Copyright © 2017 Kemal Enver. All rights reserved.
//

import Foundation

class Provider {
    
    // have to init with the database and network later
    
    private let storeage: Store
    private let networkAPI: String // This will be type network or something later
    
    init(storeage: Store, networkAPI: String) {
        
        self.storeage = storeage
        self.networkAPI = networkAPI
    }
    
    func menuViewModels() ->  [MenuItemViewModel] {
        
        let menuItems = self.storeage.menuItems()
        
        let menuViewModels = menuItems.map {
            return MenuItemViewModel(menuItem: $0)
        }
        
        return menuViewModels
    }
    
    func categoriesViewModels() -> [CategoryViewModel] {
        
        let storeCategories = self.storeage.categories()
        
        let categoryViewModels = storeCategories.map {
            return CategoryViewModel(category: $0)
        }
        
        return categoryViewModels
    }
    
    func seriesViewModels(for video: String) -> [VideoViewModel] {
        
        let seriesVideos = self.storeage.series(for: video)
        
        let seriesViewModels = seriesVideos.map {
            return VideoViewModel(video: $0)
        }
        
        return seriesViewModels
    }
}
