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
    
    public static func generateCategoryViewModels() -> [CategoryViewModel] {
        
        var categories = [CategoryViewModel]()
        
        for i in 1..<4 {
            
            var videos = [Video]()
            
            let video = Video(identifier: "landscape_large\(i)", title: "large title 1", synopsis: "large synopsis 1")
            videos.append(video)
            
            for j in 1..<16 {
                
                let capped = DevUtiltiies.capNumber(val: j, min: 1, max: 16)
                
                let video = Video(identifier: "cover\(capped)", title: "some title \(j)", synopsis: "Some synopsis \(j)")
                
                videos.append(video)
                
            }
            
            let category = Category(identifier: "ID \(i)", title: "Category Title \(i)", synopsis: "Synopsis \(i)", videos: videos)

            let categoryViewModel = CategoryViewModel(category: category)
            
            categories.append(categoryViewModel)
        }
        
        return categories
    }
    
    public static func generateSeriesViewModels() -> [[VideoViewModel]] {
        
        var sections = [[VideoViewModel]]()
        
        for _ in 1..<2 {
            
            var videoViewModels = [VideoViewModel]()
    
            for j in 1..<7 {
                
                let capped = DevUtiltiies.capNumber(val: j, min: 1, max: 16)
                
                let video = Video(identifier: "cover\(capped)", title: "some title \(j)", synopsis: "Some synopsis \(j)")
                let videoViewModel = VideoViewModel(video: video)
                videoViewModels.append(videoViewModel)
            }
            
            sections.append(videoViewModels)
        }
        
        return sections
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
