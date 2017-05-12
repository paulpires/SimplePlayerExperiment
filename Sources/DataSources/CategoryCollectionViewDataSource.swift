//
//  CategoryCollectionViewDataSource.swift
//  SimplePlayer
//
//  Created by Kemal Enver on 12/05/2017.
//  Copyright © 2017 Kemal Enver. All rights reserved.
//

import Foundation
import UIKit

class CategoryCollectionViewDataSource: NSObject {
    
    var videoViewModels: [VideoViewModel]
    
    init(videoViewModels: [VideoViewModel]) {
        
        self.videoViewModels = videoViewModels
    }
}

extension CategoryCollectionViewDataSource: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return videoViewModels.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let viewModel = videoViewModels[indexPath.row]
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: viewModel.cellIdentifier, for: indexPath)
        
        var cell2 = cell as! ViewModelDisplayable
        
        cell2.viewModel = viewModel
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        let reusableView = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionElementKindSectionHeader, withReuseIdentifier: "category_section_header", for: indexPath)
        
        let sectionHeaderReusableView = reusableView as! CategorySectionHeaderSupplementaryView
        sectionHeaderReusableView.categoryTitleLabel.text = "Section \(indexPath.section)"
        
        return sectionHeaderReusableView
    }
    
}
