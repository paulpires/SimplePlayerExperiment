//
//  Appearance.swift
//  SkySkunk
//
//  Created by Kemal Enver on 21/03/2017.
//  Copyright © 2017 Kemal Enver. All rights reserved.
//

import UIKit

struct LookAndFeel {
    
    static let backgroundColor = #colorLiteral(red: 9.914340102e-05, green: 9.914340102e-05, blue: 9.914340102e-05, alpha: 1)
    static let textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
    
    static let textTintColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
    
    static func apply() {

        applyNavigationBarAppearance()
        applyMenuAppearance()
        applyCategoryControllerAppearance()
    }
    
    private static func applyNavigationBarAppearance() {
        
        UINavigationBar.appearance().tintColor = textTintColor
        UINavigationBar.appearance().titleTextAttributes = [NSForegroundColorAttributeName : textTintColor]
    }
    
    private static func applyMenuAppearance() {
        
        UICollectionView.appearance(whenContainedInInstancesOf: [MenuViewController.self]).backgroundColor = backgroundColor
        UILabel.appearance(whenContainedInInstancesOf: [MenuCollectionViewCell.self]).textColor = textColor
    }
    
    private static func applyCategoryControllerAppearance() {
        
        UINavigationBar.appearance().backIndicatorImage = UIImage(named: "imageName")
//        [UINavigationBar appearance].backIndicatorImage = customBackButton;
//        [UINavigationBar appearance].backIndicatorTransitionMaskImage = customBackButton;
    }
}
