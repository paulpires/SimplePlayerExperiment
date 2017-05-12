//
//  DetailViewController.swift
//  SimplePlayer
//
//  Created by Kemal Enver on 20/03/2017.
//  Copyright © 2017 Kemal Enver. All rights reserved.
//

import UIKit

protocol CategoryViewControllerDelegate: class {
    
    func categoryViewController(_ categoryViewController: CategoryViewController, didSelect video: Video)
}

class CategoryViewController: UIViewController {
    
    @IBOutlet var collectionView: UICollectionView! {
        
        didSet {
            
            collectionView.backgroundColor = CategoryViewControllerDesign.Colors.backgroundColor
            collectionView.contentInset = CategoryViewControllerDesign.Sizes.controllerInsets
        }
    }
    
    weak var categoryViewControllerDelegate: CategoryViewControllerDelegate?
    
    fileprivate var collectionViewDataSource: CategoryCollectionViewDataSource?
    fileprivate var collectionViewDelegate: CategoryCollectionViewDelegate?
}

extension CategoryViewController {
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        title = "Videos"
        
        setupCollectionView()
        
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "☰", style: UIBarButtonItemStyle.plain, target: nil, action: nil)
    }
    
    private func setupCollectionView() {
        
        let videoViewModels = DevUtiltiies.generateVideoViewModels()
        
        collectionViewDataSource =  CategoryCollectionViewDataSource(videoViewModels: videoViewModels)
        collectionViewDelegate = CategoryCollectionViewDelegate(videoViewModels: videoViewModels, categoryViewController: self)
        
        collectionView.dataSource = collectionViewDataSource
        collectionView.delegate = collectionViewDelegate
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
        categoryViewController.categoryViewControllerDelegate = delegate
        
        return categoryViewController
    }
}
