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

    override func viewDidLoad() {
        
        super.viewDidLoad()

        createChildControllers()

        createDataSources()
        
        view.bringSubview(toFront: self.closeButton)
    }
    
    func createChildControllers() {
        
        guard let videoViewModel = self.viewModels.first?.first else { return }
        
        // Create child view controllers
        let seriesViewController = SeriesViewController.makeSeriesViewController(from: self.storyboard!)
        let detailViewController = VideoDetailViewController.makeVideoViewController(from: self.storyboard!, video: videoViewModel.video, delegate: nil)
        
        self.seriesViewController = seriesViewController
        self.detailViewController = detailViewController
        
        // Add child view controller to this one
        addChildViewController(seriesViewController)
        view.addSubview(seriesViewController.view)
        seriesViewController.view.frame = view.bounds
        seriesViewController.didMove(toParentViewController: self)
    }
    
    func createDataSources() {
        
        guard let seriesViewController = seriesViewController,
                let videoViewModel = self.viewModels.first?.first else { return }
        
        // Setup delegates/datasource for the child series
        let seriesDelegate = SeriesCollectionViewDelegate(videoViewModels: viewModels)
        seriesViewController.setCollectionViewDelegate(delegate: seriesDelegate)
        self.seriesDelegate = seriesDelegate
        
        let seriesDataSource = SeriesCollectionViewDataSource(videoViewModels: viewModels)
        seriesViewController.setCollectionViewDataSource(dataSource: seriesDataSource)
        self.seriesDataSource = seriesDataSource
        
        // Get the video details child controller.
        let detailViewController = VideoDetailViewController.makeVideoViewController(from: self.storyboard!, video: videoViewModel.video, delegate: nil)
        seriesDataSource.headerView = detailViewController.view
        seriesDelegate.headerView = detailViewController.view
        
        self.detailViewController = detailViewController
    }
    
    @objc private func closePressed() {
        
        self.dismiss(animated: true, completion: nil)
    }
}


extension VideoOverviewViewController {
    
    static func makeVideoOverviewViewController(from storyboard: UIStoryboard) -> VideoOverviewViewController {
        
        let videoOverviewViewController = storyboard.instantiateViewController(withIdentifier: "video_overview_view_controller") as! VideoOverviewViewController
        
        return videoOverviewViewController
    }
}
