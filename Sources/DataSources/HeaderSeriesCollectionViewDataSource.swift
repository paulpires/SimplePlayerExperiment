//
//  HeaderSeriesCollectionViewDataSource.swift
//  SimplePlayer
//
//  Created by Kemal Enver on 22/05/2017.
//  Copyright © 2017 Kemal Enver. All rights reserved.
//

import Foundation
import UIKit

class HeaderSeriesCollectionViewDataSource: SeriesCollectionViewDataSource {
    
    let headerView: UIView
    
    init(videoViewModels: [[VideoViewModel]], headerView: UIView) {
        
        self.headerView = headerView
        
        super.init(videoViewModels: videoViewModels)
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        let view = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionElementKindSectionHeader, withReuseIdentifier: "header_supplementary_view", for: indexPath)
        self.headerView.removeFromSuperview()
        view.addSubview(self.headerView)
        
        return view
    }
}
