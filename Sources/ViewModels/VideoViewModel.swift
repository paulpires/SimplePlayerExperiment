//
//  VideoViewModel.swift
//  SkySkunk
//
//  Created by Kemal Enver on 20/03/2017.
//  Copyright © 2017 Kemal Enver. All rights reserved.
//

import Foundation

final class VideoViewModel {
    
    let video: Video
    
    init(video: Video) {
        
        self.video = video
    }
    
    var identifier: String {
        return video.identifier
    }
    
    var title: String {
        
        guard let title = video.title else {
            return "Video title unknown"
        }
        
        return title.capitalized
    }
    
    var synopsis: String {
        
        guard let synopsis = video.synopsis else{
            return "No synopsis for video"
        }
        
        return synopsis
    }
    
}
