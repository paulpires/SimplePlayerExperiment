//
//  CategorySectionHeaderSupplementaryView.swift
//  SimplePlayer
//
//  Created by Kemal Enver on 04/05/2017.
//  Copyright © 2017 Kemal Enver. All rights reserved.
//

import Foundation
import UIKit

class CategorySectionHeaderSupplementaryView: UICollectionReusableView {
    
    @IBOutlet var categoryTitleLabel: UILabel! {
        
        didSet {
            
            categoryTitleLabel.textColor = .white
        }
    }
}
