//
//  EpisodeCollectionViewCell.swift
//  SimplePlayer
//
//  Created by Kemal Enver on 16/05/2017.
//  Copyright © 2017 Kemal Enver. All rights reserved.
//

import Foundation
import UIKit

class EpisodeCollectionViewCell: UICollectionViewCell, ViewModelDisplayable {
    
    @IBOutlet var episodeImageView: UIImageView!
    
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
        
        guard let videoViewModel = videoViewModel else { return }
        
        episodeImageView.image = UIImage(named: videoViewModel.posterImageName)
        
    }
}
