//
//  MenuCollectionViewCell.swift
//  SimplePlayer
//
//  Created by Kemal Enver on 21/03/2017.
//  Copyright © 2017 Kemal Enver. All rights reserved.
//

import Foundation
import UIKit

class MenuCollectionViewCell: UICollectionViewCell, ViewModelDisplayable {
    
    var viewModel: ViewModel? {
        didSet {
            menuViewModel = viewModel as? MenuItemViewModel
            updateUI()
        }
    }

    private var menuViewModel: MenuItemViewModel?
    
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var selectedIndicator: UIView!
    
    required init?(coder aDecoder: NSCoder) {
        
        super.init(coder: aDecoder)
    }
    
    private func updateUI() {
        titleLabel.text = menuViewModel?.name
    }
    
    override var isSelected: Bool {
        didSet {
            selectedIndicator.isHidden = !isSelected
        }
    }
}
