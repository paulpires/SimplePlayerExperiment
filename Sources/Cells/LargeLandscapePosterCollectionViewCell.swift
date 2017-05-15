//
//  LargeLandscapePosterCollectionViewCell.swift
//  SimplePlayer
//
//  Created by Kemal Enver on 04/05/2017.
//  Copyright © 2017 Kemal Enver. All rights reserved.
//

import Foundation
import UIKit

class LargeLandscapePosterCollectionViewCell: UICollectionViewCell, ViewModelDisplayable {
    
    @IBOutlet var posterImageView: UIImageView!
    
    @IBOutlet var titleLabel: UILabel!
    
    var viewModel: ViewModel? {
        didSet {
            videoViewModel = viewModel as? VideoViewModel
            updateUI()
        }
    }
    
    private var videoViewModel: VideoViewModel?
    
    required init?(coder aDecoder: NSCoder) {
        
        super.init(coder: aDecoder)
    }
    
    private func updateUI() {
        
        posterImageView.image = UIImage(named: videoViewModel!.posterImageName)
        titleLabel.text = videoViewModel?.title
    }
}
