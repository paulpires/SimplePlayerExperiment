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
    
    @IBOutlet var collectionView: UICollectionView! {
        
        didSet {
            collectionView.backgroundColor = UIColor.black
        }
    }
    
    
    fileprivate var collectionViewDataSource: SeriesCollectionViewDataSource?
    fileprivate var collectionViewDelegate: SeriesCollectionViewDelegate?
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        setupCollectionViewDelegates()
        registerCollectionViewCells()
        
        setupControllerDetails()
    }
    
    private func setupControllerDetails() {
        
        self.title = "Series"
    }
    
    private func setupCollectionViewDelegates() {
        
        let videoViewModels = DevUtiltiies.generateSeriesViewModels()
        
        collectionViewDataSource = SeriesCollectionViewDataSource(videoViewModels: videoViewModels)
        collectionViewDelegate = SeriesCollectionViewDelegate(videoViewModels: videoViewModels)
        
        collectionView.dataSource = collectionViewDataSource
        collectionView.delegate = collectionViewDelegate
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
