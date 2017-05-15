//
//  DetailsViewController.swift
//  SimplePlayer
//
//  Created by Kemal Enver on 10/05/2017.
//  Copyright © 2017 Kemal Enver. All rights reserved.
//

import Foundation
import UIKit

protocol VideoViewControllerDelegate: class {
    
}

class VideoViewController: UIViewController {
    
    @IBOutlet var programmeImageView: UIImageView!
    
    @IBOutlet var ageRatingLabel: UILabel! {
        didSet {
            ageRatingLabel.textColor = .white
        }
    }
    @IBOutlet var runningTimeLabel: UILabel! {
        didSet {
            runningTimeLabel.textColor = .white
        }
    }
    @IBOutlet var yearLabel: UILabel! {
        didSet {
            yearLabel.textColor = .white
        }
    }
    
    @IBOutlet var closeButton: UIButton! {
        didSet {
            closeButton.addTarget(self, action: #selector(tappedClose), for: .touchUpInside)
        }
    }
    
    weak var videoViewControllerDelegate: VideoViewControllerDelegate?
    
    public var video: Video? {
        
        didSet {
            
            guard let video = video else { return }
            videoViewModel = VideoViewModel(video: video)
        }
    }
    
    private var videoViewModel: VideoViewModel!
    
    // series view controller
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    override func viewDidLoad() {
        
         super.viewDidLoad()
        
        self.programmeImageView.image = UIImage(named: videoViewModel.landscapeImageName)
        
        self.view.backgroundColor = VideoViewControllerDesign.Colors.backgroundColor
    }
    
    func tappedClose() {
        
        dismiss(animated: true, completion: nil)
    }
}

extension VideoViewController {
    
    static func makeVideoViewController(from storyboard: UIStoryboard, video: Video, delegate: VideoViewControllerDelegate?) -> VideoViewController {
        
        let videoViewController = storyboard.instantiateViewController(withIdentifier: "video_view_controller") as! VideoViewController
        videoViewController.video = video
        videoViewController.videoViewControllerDelegate = delegate
        
        return videoViewController
    }
}
