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
    
    // TODO: Replacet he seriesDataSource with another data source for having the section header.  That way the data source controls the look
    // and  not the series controller, which is jsut dumb and does what the data source says.
    
    var viewModels: [[VideoViewModel]] = DevUtiltiies.generateVideoViewModels()
    
    var seriesViewController: SeriesViewController!
    var detailViewController: VideoDetailViewController!
    
    var seriesDataSource: SeriesCollectionViewDataSource!

    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        let videoViewModel = self.viewModels.first!.first!
        
        
        //series
        
        seriesViewController = SeriesViewController.makeSeriesViewController(from: self.storyboard!)
        detailViewController = VideoDetailViewController.makeVideoViewController(from: self.storyboard!, video: videoViewModel.video, delegate: nil)

        self.addChildViewController(seriesViewController)
        self.view.addSubview(seriesViewController.view)
        seriesViewController.view.frame = self.view.bounds
        seriesViewController.didMove(toParentViewController: self)
        
        
        seriesViewController.setCollectionViewDelegate(delegate: SeriesCollectionViewDelegate(videoViewModels: viewModels))
        
        // TODO, change this to a data source that supports header, and remove header code from this one,
        // New datasource will extend this and implement section header code
        self.seriesDataSource = SeriesCollectionViewDataSource(videoViewModels: viewModels)
        seriesViewController.setCollectionViewDataSource(dataSource: self.seriesDataSource)
        
        
        // detail
        detailViewController = VideoDetailViewController.makeVideoViewController(from: self.storyboard!, video: videoViewModel.video, delegate: nil)

        //detailViewController.view.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: 200)
        
        seriesDataSource.headerView = detailViewController.view
        
        seriesViewController.collectionView.reloadData()            

    }
 
}


extension VideoOverviewViewController {
    
    static func makeVideoOverviewViewController(from storyboard: UIStoryboard) -> VideoOverviewViewController {
        
        let videoOverviewViewController = storyboard.instantiateViewController(withIdentifier: "video_overview_view_controller") as! VideoOverviewViewController
        
        return videoOverviewViewController
    }
}
