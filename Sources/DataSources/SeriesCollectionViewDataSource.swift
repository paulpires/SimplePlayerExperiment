//
//  SeriesCollectionViewDataSource.swift
//  SimplePlayer
//
//  Created by Kemal Enver on 17/05/2017.
//  Copyright © 2017 Kemal Enver. All rights reserved.
//

import Foundation
import UIKit

class SeriesCollectionViewDataSource: NSObject {
    
    let videoViewModels: [VideoViewModel]
    
    init(videoViewModels: [VideoViewModel]) {
        
        self.videoViewModels = videoViewModels
        
        super.init()
    }
}

extension SeriesCollectionViewDataSource: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return videoViewModels.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let episode = videoViewModels[indexPath.row]
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "episode_cell", for: indexPath) as! EpisodeCollectionViewCell
        
        cell.viewModel = episode
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        let view = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionElementKindSectionHeader, withReuseIdentifier: "header_supplementary_view", for: indexPath)
 
        return view
    }
}
