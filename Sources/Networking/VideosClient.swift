//
//  VideosAPI.swift
//  SimplePlayer
//
//  Created by Kemal Enver on 01/06/2017.
//  Copyright © 2017 Kemal Enver. All rights reserved.
//

import Foundation

class VideosClient: NetworkClient {
    
    func videosFromAPI(completion: @escaping () -> () ) {
        
        // Hit some api via network then call completion with the results
        completion()
    }
}

