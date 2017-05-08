//
//  DetailViewController.swift
//  SimplePlayer
//
//  Created by Kemal Enver on 20/03/2017.
//  Copyright © 2017 Kemal Enver. All rights reserved.
//

import UIKit

protocol CategoryViewControllerDelegate {
    
    func categoryViewController(_ categoryViewController: CategoryViewController, didSelect video: Video)
}

class CategoryViewController: UIViewController {
    
    @IBOutlet var collectionView: UICollectionView! {
        
        didSet {
            
            collectionView.backgroundColor = .black

            collectionView.delegate = self
            collectionView.dataSource = self
            
            collectionView.contentInset = CategoryCollectionViewMetrics.controllerInsets
        }
    }
    var delegate: CategoryViewControllerDelegate?
    
    var videoViewModels = DevUtiltiies.generateVideoViewModels()
    
    lazy var backButtonImage = UIImage(named: "MenuIcon")?.withRenderingMode(UIImageRenderingMode.automatic)
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        self.title = "Videos"
        
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "☰", style: UIBarButtonItemStyle.plain, target: nil, action: nil)
    }
    
    override func willTransition(to newCollection: UITraitCollection, with coordinator: UIViewControllerTransitionCoordinator) {
        
        super.willTransition(to: newCollection, with: coordinator)

        coordinator.animate(alongsideTransition: { (context) in
            self.collectionView.collectionViewLayout.invalidateLayout()
        }, completion: nil)
    }
    
    override var traitCollection: UITraitCollection {
        
        let originalTraitCollection = super.traitCollection
        
        let isLandscape = UIDevice.current.orientation == .landscapeLeft || UIDevice.current.orientation == .landscapeRight
        let regularCollection = UITraitCollection(horizontalSizeClass: isLandscape ? .regular : .compact)
        
        return UITraitCollection(traitsFrom: [originalTraitCollection, regularCollection])
    }
}


extension CategoryViewController {
    
    static func makeCategoryViewController(from storyboard: UIStoryboard, delegate: CategoryViewControllerDelegate?) -> CategoryViewController {
        
        let categoryViewController = storyboard.instantiateViewController(withIdentifier: "category_view_controller") as! CategoryViewController
        categoryViewController.delegate = delegate
        
        return categoryViewController
    }
}

extension CategoryViewController: UICollectionViewDataSource {
    
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

extension CategoryViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let viewModel = self.videoViewModels[indexPath.row]
        
        delegate?.categoryViewController(self, didSelect: viewModel.video)
    }
}

extension CategoryViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        
        return CategoryCollectionViewMetrics.cellInterimSpacing
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        
        return CategoryCollectionViewMetrics.cellRowSpacing
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let edgeSpacing = 2.0 * CategoryCollectionViewMetrics.cellInterimSpacing
        let numberOfColumns = self.traitCollection.horizontalSizeClass == .regular ? CategoryCollectionViewMetrics.columnsRegular : CategoryCollectionViewMetrics.columnsCompact
        
        let viewModel = videoViewModels[indexPath.row]
        
        if viewModel.cellIdentifier == "large_landscape_poster_cell" {
            
            let width = (collectionView.bounds.width - edgeSpacing)
            let height = width * 0.56
            
            return CGSize(width: width, height: height)
            
        } else {
            
            let spacing = (numberOfColumns - 1 ) * CategoryCollectionViewMetrics.cellInterimSpacing
            
            let width = floor((collectionView.bounds.width - spacing - edgeSpacing) / numberOfColumns)
            let height = width * 1.48
            
            return CGSize(width: width, height: height)
        }
    }
}
