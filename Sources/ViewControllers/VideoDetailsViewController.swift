//
//  VideoDetailsViewControllerV.swift
//  SimplePlayer
//
//  Created by Kemal Enver on 16/05/2017.
//  Copyright © 2017 Kemal Enver. All rights reserved.
//

import Foundation
import UIKit

class VideoDetailsViewController: UIViewController {
    
    @IBOutlet var closeButton: UIButton! {
        didSet {
            closeButton.addTarget(self, action: #selector(closePressed), for: .touchUpInside)
        }
    }
    @IBOutlet var collectionView: UICollectionView!
    
    fileprivate var collectionViewDataSource: UICollectionViewDataSource?
    fileprivate var collectionViewDelegate: UICollectionViewDelegate?
    
    let provider: Provider
    
    var videoViewModels = [VideoViewModel]() {
        
        didSet {
            
            self.reloadWith(oldData: oldValue, newData: videoViewModels)
        }
    }
    
    init(provider: Provider) {
        
        self.provider = provider
        
        super.init(nibName:nil, bundle:nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        
        fatalError("init(coder:) has not been implemented")
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
}

extension VideoDetailsViewController {
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        setupControllerDetails()
        registerCollectionViewCells()
        
        updateData()
    }
}

extension VideoDetailsViewController {
    
    @objc fileprivate func closePressed() {
        
        self.dismiss(animated: true, completion: nil)
    }
}

extension VideoDetailsViewController {
    
    fileprivate func updateData() {
        
        videoViewModels = provider.seriesViewModels(for: "xxx")
    }
    
    fileprivate func setupControllerDetails() {

        self.title = "Series Data"
    }
    
    fileprivate func reloadWith(oldData: [VideoViewModel], newData: [VideoViewModel]) {
        
        self.collectionViewDataSource =  SeriesCollectionViewDataSource(videoViewModels: videoViewModels)
        self.collectionViewDelegate = SeriesCollectionViewDelegate(videoViewModels: videoViewModels)
        
        self.collectionView.dataSource = collectionViewDataSource
        self.collectionView.delegate = collectionViewDelegate
        
        self.collectionView.reloadData()
    }
    
    fileprivate func registerCollectionViewCells() {
        
        let nib = UINib(nibName: "EpisodeCollectionViewCell", bundle: nil)
        collectionView.register(nib, forCellWithReuseIdentifier: "episode_cell")
        
        let nib2 = UINib(nibName: "EpisodeSectionHeaderSupplementaryView", bundle: nil)
        collectionView.register(nib2, forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: "header_supplementary_view")
    }
}
