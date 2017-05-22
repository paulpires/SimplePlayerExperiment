//
//  CategoryViewControllerDesign.swift
//  SimplePlayer
//
//  Created by Kemal Enver on 04/05/2017.
//  Copyright © 2017 Kemal Enver. All rights reserved.
//

import Foundation
import UIKit

struct CategoryViewControllerDesign {
    
    struct Sizes {
        
        static let columnsCompact: CGFloat = 3.0
        static let columnsRegular: CGFloat = 5.0
        
        static let cellInterimSpacing: CGFloat = 5.0
        static let cellRowSpacing: CGFloat = 5.0
        
        static let controllerInsets = UIEdgeInsets(top: cellRowSpacing, left: cellInterimSpacing, bottom: cellRowSpacing, right: cellInterimSpacing)
    }
    
    struct Colors {
        
        static let backgroundColor: UIColor = UIColor(red: 0.1, green: 0.1, blue: 0.1, alpha: 1)
    }
}
