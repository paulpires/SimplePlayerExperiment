//
//  Appearance.swift
//  SkySkunk
//
//  Created by Kemal Enver on 21/03/2017.
//  Copyright © 2017 Kemal Enver. All rights reserved.
//

import UIKit

struct LookAndFeel {
    
    private static let backgroundColor = UIColor(red: 0.1, green: 0.1, blue: 0.1, alpha: 1)
    private static let textColor = UIColor.white
    private static let textTintColor = UIColor.white
    
    static func apply() {

        applyNavigationBarAppearance()
        applyMenuAppearance()
        applyCategoryControllerAppearance()
        applyVideoDetailsControllerAppearance()
    }
    
    private static func applyNavigationBarAppearance() {
        
        UINavigationBar.appearance().tintColor = textTintColor
        UINavigationBar.appearance().titleTextAttributes = [NSAttributedStringKey.foregroundColor.rawValue : textTintColor]
    }
    
    private static func applyMenuAppearance() {
        
        let appearanceContainer = MenuViewController.self
        
        UICollectionView.appearance(whenContainedInInstancesOf: [appearanceContainer]).backgroundColor = backgroundColor
        UILabel.appearance(whenContainedInInstancesOf: [appearanceContainer]).textColor = textColor
    }
    
    private static func applyCategoryControllerAppearance() {
        
        let appearanceContainer = CategoryViewController.self
        
        UICollectionView.appearance(whenContainedInInstancesOf: [appearanceContainer]).backgroundColor = backgroundColor
    }
    
    private static func applyVideoDetailsControllerAppearance() {
        
        let appearanceContainer = VideoDetailsViewController.self
        
        UICollectionView.appearance(whenContainedInInstancesOf: [appearanceContainer]).backgroundColor = backgroundColor
        
        EpisodeCollectionViewCell.appearance(whenContainedInInstancesOf: [appearanceContainer]).backgroundColor = backgroundColor
        EpisodeSectionHeaderSupplementaryView.appearance(whenContainedInInstancesOf: [appearanceContainer]).backgroundColor = backgroundColor
        
        UILabel.appearance(whenContainedInInstancesOf: [EpisodeCollectionViewCell.self]).textColor = .white
        
    }
}
