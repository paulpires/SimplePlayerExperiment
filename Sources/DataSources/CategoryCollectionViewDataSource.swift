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
    
    var categoryViewModels: [CategoryViewModel]
    
    init(categoryViewModels: [CategoryViewModel]) {
        
        self.categoryViewModels = categoryViewModels
    }
}

extension CategoryCollectionViewDataSource: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        
        return categoryViewModels.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        let categoryVideos = categoryViewModels[section].category.videos
        return categoryVideos.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let categoryViewModel = categoryViewModels[indexPath.section]
        let categoryVideos = categoryViewModel.category.videos
        let videoViewModel = VideoViewModel(video: categoryVideos[indexPath.row])
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: videoViewModel.cellIdentifier, for: indexPath)
        
        var viewModelDisplayableCell = cell as! ViewModelDisplayable
        viewModelDisplayableCell.viewModel = videoViewModel
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        let categoryViewModel = categoryViewModels[indexPath.section]
        
        let reusableView = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionElementKindSectionHeader, withReuseIdentifier: "category_section_header", for: indexPath)
        
        let sectionHeaderReusableView = reusableView as! CategorySectionHeaderSupplementaryView
        sectionHeaderReusableView.categoryTitleLabel.text = categoryViewModel.title
        
        return sectionHeaderReusableView
    }
}
