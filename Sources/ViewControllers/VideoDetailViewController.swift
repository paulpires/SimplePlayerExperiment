//
//  DetailsViewController.swift
//  SimplePlayer
//
//  Created by Kemal Enver on 10/05/2017.
//  Copyright © 2017 Kemal Enver. All rights reserved.
//

import Foundation
import UIKit

protocol VideoDetailViewControllerDelegate: class {
    
    func pressedShowSeries()
    func pressedShowTrailers()
}

class VideoDetailViewController: UIViewController {
    
    weak var videoViewControllerDelegate: VideoDetailViewControllerDelegate?
    
    public var video: Video? {
        
        didSet {
            
            guard let video = video else { return }
            videoViewModel = VideoViewModel(video: video)
        }
    }
    
    private var videoViewModel: VideoViewModel!
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        self.view.backgroundColor = VideoViewControllerDesign.Colors.backgroundColor
    }
}

extension VideoDetailViewController {
    
    static func makeVideoViewController(from storyboard: UIStoryboard, video: Video, delegate: VideoDetailViewControllerDelegate?) -> VideoDetailViewController {
        
        let videoViewController = storyboard.instantiateViewController(withIdentifier: "video_view_controller") as! VideoDetailViewController
        videoViewController.video = video
        videoViewController.videoViewControllerDelegate = delegate
        
        return videoViewController
    }
}
