//
//  DevUtiltiies.swift
//  SkySkunk
//
//  Created by Kemal Enver on 21/03/2017.
//  Copyright © 2017 Kemal Enver. All rights reserved.
//

import UIKit

class DevUtiltiies {
    
    public static func capNumber<T: Integer>(val: T, min: T, max: T) -> T {
        
        let p = max - min + 1;
        let mod = (val - min) % p
        
        return 1 + mod;
    }
    
    public static func generateVideoViewModels() -> [VideoViewModel] {

        var videoViewModels = [VideoViewModel]()
        
        let video = Video(identifier: "landscape_large1", title: "some title 1", synopsis: "Some synopsis 1")
        let videoViewModel = VideoViewModel(video: video)
        videoViewModels.append(videoViewModel)
        
        for i in 1..<31 {
            
            let capped = DevUtiltiies.capNumber(val: i, min: 1, max: 16)
            
            let video = Video(identifier: "cover\(capped)", title: "some title \(i)", synopsis: "Some synopsis \(i)")
            let videoViewModel = VideoViewModel(video: video)
            videoViewModels.append(videoViewModel)
        }
        
        return videoViewModels
    }
    
    public static func generateMenuViewModels() -> [MenuItemViewModel] {
        
        var viewModels = [MenuItemViewModel]()
        
        for i in 0...10 {
            
            let menuItem = MenuItem(identifier: "", name: "Menu Item \(i)", description: "")
            let menuViewModel = MenuItemViewModel(menuItem: menuItem)
            viewModels.append(menuViewModel)
        }
        
        return viewModels
    }
}
