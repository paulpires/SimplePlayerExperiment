//
//  HeaderSeriesCollectionViewDelegate.swift
//  SimplePlayer
//
//  Created by Kemal Enver on 22/05/2017.
//  Copyright © 2017 Kemal Enver. All rights reserved.
//

import Foundation
import UIKit

class HeaderSeriesCollectionViewDelegate: SeriesCollectionViewDelegate {
    
    let headerView: UIView
    
    init(videoViewModels: [[VideoViewModel]], headerView: UIView) {
        
        self.headerView = headerView
        
        super.init(videoViewModels: videoViewModels)
    }
}

extension HeaderSeriesCollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        
        let width = collectionView.bounds.width
        let height: CGFloat = 250
        
        return CGSize(width: width, height: height)
    }
}
