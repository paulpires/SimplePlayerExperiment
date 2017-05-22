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
    
    init(delegate: CategoryViewControllerDelegate) {
        
        super.init(nibName:nil, bundle:nil)
        
        self.categoryViewControllerDelegate = delegate
    }
    
    required init?(coder aDecoder: NSCoder) {
        
        fatalError("init(coder:) has not been implemented")
    }
}

extension CategoryViewController {
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        setupCollectionViewDelegates()
        registerCollectionViewCells()
        
        setupControllerDetails()
    }
    
    private func setupControllerDetails() {
        
        self.title = "Videos"
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "☰", style: UIBarButtonItemStyle.plain, target: nil, action: nil)
    }
    
    private func setupCollectionViewDelegates() {
        
        let videoViewModels = DevUtiltiies.generateVideoViewModels()
        
        collectionViewDataSource =  CategoryCollectionViewDataSource(videoViewModels: videoViewModels)
        collectionViewDelegate = CategoryCollectionViewDelegate(videoViewModels: videoViewModels, categoryViewController: self)
        
        collectionView.dataSource = collectionViewDataSource
        collectionView.delegate = collectionViewDelegate
    }
    
    private func registerCollectionViewCells() {
       
        let portraitPosterNib = UINib(nibName: "PortraitPosterCollectionViewCell", bundle: nil)
        collectionView.register(portraitPosterNib, forCellWithReuseIdentifier: "poster_portrait_cell")
        
        let landscapePosterNib = UINib(nibName: "LargeLandscapePosterCollectionViewCell", bundle: nil)
        collectionView.register(landscapePosterNib, forCellWithReuseIdentifier: "large_landscape_poster_cell")
        
        let headerSupplementaryNib = UINib(nibName: "CategorySectionHeaderSupplementaryView", bundle: nil)
        collectionView.register(headerSupplementaryNib, forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: "category_section_header")
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

