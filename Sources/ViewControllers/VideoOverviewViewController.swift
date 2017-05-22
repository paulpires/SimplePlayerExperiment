//
//  VideoOverviewViewController.swift
//  SimplePlayer
//
//  Created by Kemal Enver on 18/05/2017.
//  Copyright © 2017 Kemal Enver. All rights reserved.
//

import Foundation
import UIKit

class VideoOverviewViewController: UIViewController {
    
    @IBOutlet var closeButton: UIButton! {
        didSet {
            closeButton.addTarget(self, action: #selector(closePressed), for: .touchUpInside)
        }
    }
    
    var viewModels: [[VideoViewModel]] = DevUtiltiies.generateVideoViewModels()
    
    var seriesViewController: SeriesViewController?
    var detailViewController: VideoDetailViewController?
    
    var seriesDataSource: SeriesCollectionViewDataSource?
    var seriesDelegate: SeriesCollectionViewDelegate?

    init() {
        
        super.init(nibName:nil, bundle:nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        
        fatalError("init(coder:) has not been implemented")
    }
}

extension VideoOverviewViewController {
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        createChildControllers()
        
        createDataSources()
        
        view.bringSubview(toFront: self.closeButton)
    }
    
    func createChildControllers() {
        
        guard let videoViewModel = self.viewModels.first?.first else { return }
        
        let seriesViewController = SeriesViewController()
        self.seriesViewController = seriesViewController
        
        addChildViewController(seriesViewController)
        view.addSubview(seriesViewController.view)
        seriesViewController.view.frame = view.bounds
        seriesViewController.didMove(toParentViewController: self)
        
        
        let detailViewController = VideoDetailViewController(video: videoViewModel.video, delegate: nil)
        self.detailViewController = detailViewController
    }
    
    func createDataSources() {
        
        guard let seriesViewController = seriesViewController else { return }
        
        // Setup delegates/datasource for the child series
        let seriesDelegate = SeriesCollectionViewDelegate(videoViewModels: viewModels)
        seriesViewController.setCollectionViewDelegate(delegate: seriesDelegate)
        self.seriesDelegate = seriesDelegate
        
        let seriesDataSource = SeriesCollectionViewDataSource(videoViewModels: viewModels)
        seriesViewController.setCollectionViewDataSource(dataSource: seriesDataSource)
        self.seriesDataSource = seriesDataSource
        
        seriesDataSource.headerView = self.detailViewController?.view
        seriesDelegate.headerView = self.detailViewController?.view
    }
    
    @objc fileprivate func closePressed() {
        
        self.dismiss(animated: true, completion: nil)
    }
}
