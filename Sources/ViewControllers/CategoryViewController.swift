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
            collectionView.contentInset = CategoryViewControllerDesign.Sizes.controllerInsets
        }
    }
    
    let provider: Provider
    
    var categoryViewModels = [CategoryViewModel]() {
        didSet {
            self.reloadWith(oldData: oldValue, newData: categoryViewModels)
        }
    }
    
    weak var categoryViewControllerDelegate: CategoryViewControllerDelegate?
    
    fileprivate var collectionViewDataSource: CategoryCollectionViewDataSource?
    fileprivate var collectionViewDelegate: CategoryCollectionViewDelegate?
    
    init(provider: Provider, delegate: CategoryViewControllerDelegate) {

        self.provider = provider
        self.categoryViewControllerDelegate = delegate
        super.init(nibName:nil, bundle:nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension CategoryViewController {
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        setupControllerDetails()
        registerCollectionViewCells()
        updateData()
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
    
    fileprivate func updateData() {

        categoryViewModels = provider.categoriesViewModels()
    }
    
    fileprivate func setupControllerDetails() {
        
        self.title = "Videos"
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "☰", style: UIBarButtonItemStyle.plain, target: nil, action: nil)
    }
    
    fileprivate func reloadWith(oldData: [CategoryViewModel], newData: [CategoryViewModel]) {
        
        self.collectionViewDataSource =  CategoryCollectionViewDataSource(categoryViewModels: categoryViewModels)
        self.collectionViewDelegate = CategoryCollectionViewDelegate(categoryViewModels: categoryViewModels, categoryViewController: self)
        
        self.collectionView.dataSource = collectionViewDataSource
        self.collectionView.delegate = collectionViewDelegate
        self.collectionView.reloadData()
    }
    
    fileprivate func registerCollectionViewCells() {
       
        let portraitPosterNib = UINib(nibName: "PortraitPosterCollectionViewCell", bundle: nil)
        collectionView.register(portraitPosterNib, forCellWithReuseIdentifier: "poster_portrait_cell")
        
        let landscapePosterNib = UINib(nibName: "LargeLandscapePosterCollectionViewCell", bundle: nil)
        collectionView.register(landscapePosterNib, forCellWithReuseIdentifier: "large_landscape_poster_cell")
        
        let headerSupplementaryNib = UINib(nibName: "CategorySectionHeaderSupplementaryView", bundle: nil)
        collectionView.register(headerSupplementaryNib, forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: "category_section_header")
    }
}
