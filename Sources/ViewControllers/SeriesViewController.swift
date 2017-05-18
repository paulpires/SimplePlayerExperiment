//
//  SeriesViewController.swift
//  SimplePlayer
//
//  Created by Kemal Enver on 16/05/2017.
//  Copyright © 2017 Kemal Enver. All rights reserved.
//

import Foundation
import UIKit

class SeriesViewController: UIViewController {
    
    @IBOutlet var collectionView: UICollectionView!
    
    fileprivate var collectionViewDataSource: UICollectionViewDataSource?
    fileprivate var collectionViewDelegate: UICollectionViewDelegate?
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        setupControllerDetails()
        registerCollectionViewCells()
    }
    
    private func setupControllerDetails() {
        
        self.title = "Series"
    }
    
    public func setCollectionViewDataSource(dataSource: UICollectionViewDataSource) {
        
        self.collectionViewDataSource = dataSource
        collectionView.dataSource = dataSource
    }
    
    public func setCollectionViewDelegate(delegate: UICollectionViewDelegate) {
        
        self.collectionViewDelegate = delegate
        collectionView.delegate = delegate
    }
    
    func registerCollectionViewCells() {
        
        let nib = UINib(nibName: "EpisodeCollectionViewCell", bundle: nil)
        collectionView.register(nib, forCellWithReuseIdentifier: "episode_cell")
        
        let nib2 = UINib(nibName: "EpisodeSectionHeaderSupplementaryView", bundle: nil)
        collectionView.register(nib2, forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: "series_header")
    }
}

extension SeriesViewController {
    
    static func makeSeriesViewController(from storyboard: UIStoryboard) -> SeriesViewController {
        
        let seriesViewController = storyboard.instantiateViewController(withIdentifier: "series_view_controller") as! SeriesViewController
        
        return seriesViewController
    }
}
