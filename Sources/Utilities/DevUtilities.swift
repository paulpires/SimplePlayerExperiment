//
//  DevUtiltiies.swift
//  SkySkunk
//
//  Created by Kemal Enver on 21/03/2017.
//  Copyright © 2017 Kemal Enver. All rights reserved.
//

import UIKit

class DevUtiltiies {
    
    public static func capNumber<T: Integer>(val: T, min: T, max: T) -> T {
        
        let p = max - min + 1;
        let mod = (val - min) % p
        
        return 1 + mod;
    }
}
