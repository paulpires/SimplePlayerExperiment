//
//  VideoViewModel.swift
//  SimplePlayer
//
//  Created by Kemal Enver on 20/03/2017.
//  Copyright © 2017 Kemal Enver. All rights reserved.
//

import Foundation

class VideoViewModel: ViewModel {
    
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
    
    var posterImageName: String {
        
        return video.identifier
    }
    
    var landscapeImageName: String {
        
        return "video_details_landscape"
    }
    
    var cellIdentifier: String {
        
        return identifier.contains("landscape_large") ? "large_landscape_poster_cell" : "poster_portrait_cell"
    }
}
