//
//  EpisodeSectionHeaderSupplementaryView.swift
//  SimplePlayer
//
//  Created by Kemal Enver on 16/05/2017.
//  Copyright © 2017 Kemal Enver. All rights reserved.
//

import Foundation
import UIKit

class EpisodeSectionHeaderSupplementaryView: UICollectionReusableView {
    
    @IBOutlet var programmeImageView: UIImageView!
    
    @IBOutlet var ageRatingLabel: UILabel! {
        didSet {
            ageRatingLabel.textColor = .white
        }
    }
    @IBOutlet var runningTimeLabel: UILabel! {
        didSet {
            runningTimeLabel.textColor = .white
        }
    }
    @IBOutlet var yearLabel: UILabel! {
        didSet {
            yearLabel.textColor = .white
        }
    }
   
}
