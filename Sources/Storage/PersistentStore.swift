//
//  PersistentStore.swift
//  SimplePlayer
//
//  Created by Kemal Enver on 01/06/2017.
//  Copyright © 2017 Kemal Enver. All rights reserved.
//

import Foundation
import RealmSwift

// TODO

// All of these functions will eventually get / save data from realm database!
// This data will have been loaded by the network client first.  We can make this stuff
// return streams of values for observing via rxSwift later.

class PersistentStore: Store {
    
    private let configuration: Realm.Configuration
    
    init(configuration: Realm.Configuration = Realm.Configuration()) {
        self.configuration = configuration
    }
    
    func save(categories: [Category], completion: storeageCompletion ) {
        
        // Save to realm
    }
    
    func save(videos: [Video], completion: storeageCompletion ) {
        // Save to realm
    }
    
    func video(withID: String) -> Video {
        
        return Video(identifier: "videoid", title: "video title", synopsis: "video synopsis")
    }
    
    func category(withID: String) -> Category {
        
        var videos = [Video]()
        
        let video = Video(identifier: "landscape_large1", title: "large title 1", synopsis: "large synopsis 1")
        videos.append(video)
        
        for j in 1..<16 {
            
            let capped = DevUtiltiies.capNumber(val: j, min: 1, max: 16)
            
            let video = Video(identifier: "cover\(capped)", title: "some title \(j)", synopsis: "Some synopsis \(j)")
            
            videos.append(video)
        }
        
        return Category(identifier: "categoryid", title: "category title", synopsis: "category synopsis", videos: videos)
    }
    
    func categories() -> [Category] {
        
        var categories = [Category]()
        
        for i in 1..<4 {
            
            var videos = [Video]()
            
            let video = Video(identifier: "landscape_large\(i)", title: "large title 1", synopsis: "large synopsis 1")
            videos.append(video)
            
            for j in 1..<16 {
                
                let capped = DevUtiltiies.capNumber(val: j, min: 1, max: 16)
                
                let video = Video(identifier: "cover\(capped)", title: "some title \(j)", synopsis: "Some synopsis \(j)")
                
                videos.append(video)
            }

            let category = Category(identifier: "categoryid", title: "category title", synopsis: "category synopsis", videos: videos)
            
            categories.append(category)
        }
        
        return categories
    }
    
    func menuItems() -> [MenuItem] {
        
        var menuItems = [MenuItem]()
        
        for i in 0...10 {
            
            let menuItem = MenuItem(identifier: "", name: "Menu Item \(i)", description: "")
           
            menuItems.append(menuItem)
        }
        
        return menuItems
    }
    
    func series(for show: String) -> [Video] {
        
        var videosForSeries = [Video]()
        
        for j in 1..<7 {
            
            let capped = DevUtiltiies.capNumber(val: j, min: 1, max: 16)
            
            let video = Video(identifier: "cover\(capped)", title: "some title \(j)", synopsis: "Some synopsis \(j)")
            
            videosForSeries.append(video)
        }
        
        return videosForSeries
    }
}
