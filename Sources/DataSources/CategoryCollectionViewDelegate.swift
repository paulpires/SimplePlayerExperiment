//
//  CategoryCollectionViewDelegate.swift
//  SimplePlayer
//
//  Created by Kemal Enver on 12/05/2017.
//  Copyright © 2017 Kemal Enver. All rights reserved.
//

import Foundation
import UIKit

class CategoryCollectionViewDelegate: NSObject {
    
    var categoryViewModels: [CategoryViewModel]
    
    weak var categoryViewController: CategoryViewController?
    
    init(categoryViewModels: [CategoryViewModel], categoryViewController: CategoryViewController) {
        
        self.categoryViewModels = categoryViewModels
        self.categoryViewController = categoryViewController
    }
}

extension CategoryCollectionViewDelegate: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let categoryViewModel = self.categoryViewModels[indexPath.section]
        let video = categoryViewModel.category.videos[indexPath.row]
        
        guard let categoryViewController = categoryViewController else { return }
        
        categoryViewController.categoryViewControllerDelegate?.categoryViewController(categoryViewController, didSelect: video)
    }
}

extension CategoryCollectionViewDelegate: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        
        return CategoryViewControllerDesign.Sizes.cellInterimSpacing
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        
        return CategoryViewControllerDesign.Sizes.cellRowSpacing
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let edgeSpacing = 2.0 * CategoryViewControllerDesign.Sizes.cellInterimSpacing
        let numberOfColumns = collectionView.traitCollection.horizontalSizeClass == .regular ? CategoryViewControllerDesign.Sizes.columnsRegular : CategoryViewControllerDesign.Sizes.columnsCompact
        
        let categoryViewModel = self.categoryViewModels[indexPath.section]
        let video = categoryViewModel.category.videos[indexPath.row]
        let videoViewModel = VideoViewModel(video: video)

        
        if videoViewModel.cellIdentifier == "large_landscape_poster_cell" {
            
            let width = (collectionView.bounds.width - edgeSpacing)
            let height = width * 0.56
            
            return CGSize(width: width, height: height)
            
        } else {
            
            let spacing = (numberOfColumns - 1 ) * CategoryViewControllerDesign.Sizes.cellInterimSpacing
            
            let width = floor((collectionView.bounds.width - spacing - edgeSpacing) / numberOfColumns)
            let height = width * 1.48
            
            return CGSize(width: width, height: height)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        
        return CGSize(width: collectionView.bounds.width, height: 30)
    }
}
    
