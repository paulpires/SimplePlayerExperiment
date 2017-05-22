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

    private let videoViewModel: VideoViewModel
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    init(video: Video, delegate: VideoDetailViewControllerDelegate?) {
        
        self.videoViewModel = VideoViewModel(video: video)
        self.videoViewControllerDelegate = delegate
        
        super.init(nibName:nil, bundle:nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        
        fatalError("init(coder:) has not been implemented")
    }
}

extension VideoDetailViewController {
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        self.view.backgroundColor = VideoViewControllerDesign.Colors.backgroundColor
    }
}
