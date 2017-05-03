//
//  MenuCollectionViewCell.swift
//  SkySkunk
//
//  Created by Kemal Enver on 21/03/2017.
//  Copyright © 2017 Kemal Enver. All rights reserved.
//

import Foundation
import UIKit

class MenuCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet var titleLabel: UILabel!
    
    var viewModel: MenuItemViewModel? {
        didSet {
            updateUI()
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        
        super.init(coder: aDecoder)
        self.backgroundColor = .orange
    }
    
    private func updateUI() {
        
    }
}
