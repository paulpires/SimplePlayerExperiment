//
//  CategoryViewModel.swift
//  SimplePlayer
//
//  Created by Kemal Enver on 31/05/2017.
//  Copyright © 2017 Kemal Enver. All rights reserved.
//

import Foundation

class CategoryViewModel: ViewModel {
    
    let category: Category
    
    init(category: Category) {
        
        self.category = category
    }
    
    var identifier: String {
        return category.identifier
    }
    
    var title: String {
        
        guard let title = category.title else {
            return "Video title unknown"
        }
        
        return title.capitalized
    }
    
    var synopsis: String {
        
        guard let synopsis = category.synopsis else{
            return "No synopsis for video"
        }
        
        return synopsis
    }
}

