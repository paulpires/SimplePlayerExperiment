//
//  Store.swift
//  SimplePlayer
//
//  Created by Kemal Enver on 01/06/2017.
//  Copyright © 2017 Kemal Enver. All rights reserved.
//

import Foundation

protocol Store {
    
    typealias storeageCompletion = (Error?) -> ()
    
    // savers
    func save(categories: [Category], completion: storeageCompletion )
    func save(videos: [Video], completion: storeageCompletion )
    
    // getters
    func video(withID: String) -> Video
    func category(withID: String) -> Category
    func categories() -> [Category]
    func menuItems() -> [MenuItem]
    func series(for show: String) -> [Video]
}
