//
//  Appearance.swift
//  SkySkunk
//
//  Created by Kemal Enver on 21/03/2017.
//  Copyright © 2017 Kemal Enver. All rights reserved.
//

import UIKit

struct LookAndFeel {
    
    static let tintColor = #colorLiteral(red: 0.09195540375, green: 0.2218873385, blue: 0.6210623438, alpha: 1)
    static let textTintColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
    
    static func apply() {

        appleNavigationBarAppearance()
    }
    
    private static func appleNavigationBarAppearance() {
        
        UINavigationBar.appearance().barTintColor = tintColor
        UINavigationBar.appearance().tintColor = textTintColor
        UINavigationBar.appearance().titleTextAttributes = [NSForegroundColorAttributeName : textTintColor]
    }
    
}
