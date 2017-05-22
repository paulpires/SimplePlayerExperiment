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
    func categories() -> [[VideoViewModel]] {
        
        return DevUtiltiies.generateVideoViewModels()
    }
}
