//
//  SeriesCollectionViewDelegate.swift
//  SimplePlayer
//
//  Created by Kemal Enver on 17/05/2017.
//  Copyright © 2017 Kemal Enver. All rights reserved.
//

import Foundation
import UIKit

class SeriesCollectionViewDelegate: NSObject {
 
    let videoViewModels: [[VideoViewModel]]
    
    init(videoViewModels: [[VideoViewModel]]) {
        
        self.videoViewModels = videoViewModels
        
        super.init()
    }
}

extension SeriesCollectionViewDelegate: UICollectionViewDelegate {
    
}

extension SeriesCollectionViewDelegate: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        
        let width = collectionView.bounds.width
        let height: CGFloat = 250
        
        return CGSize(width: width, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let width: CGFloat = collectionView.bounds.width
        let height: CGFloat = 136
        
        return CGSize(width: width, height: height)
    }
}
