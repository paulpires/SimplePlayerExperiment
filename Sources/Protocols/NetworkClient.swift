//
//  NetworkClient.swift
//  SimplePlayer
//
//  Created by Kemal Enver on 01/06/2017.
//  Copyright © 2017 Kemal Enver. All rights reserved.
//

import Foundation

protocol NetworkClient {
    
    func videosFromAPI(completion: @escaping () -> ())
}
