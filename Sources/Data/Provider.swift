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
    
    let storeage: String
    let networkAPI: String
    
    init(storeage: String, networkAPI: String) {
        
        self.storeage = storeage
        self.networkAPI = networkAPI
    }
    
    func categories() -> [[VideoViewModel]] {
        
        // from database
        
//        self.networkAPI.loadCategories {
//            
//            
//            self.storeage.fetchMeCategories {
//                
//            }
//        }
        
        // which may go to the networks
        return DevUtiltiies.generateVideoViewModels()
    }
    
    func seriesVideoModels() -> [[VideoViewModel]] {
        
        return DevUtiltiies.generateSeriesViewModels()
    }
    
    
    func menuViewModels() ->  [MenuItemViewModel] {
        
        return DevUtiltiies.generateMenuViewModels()
    }

}
