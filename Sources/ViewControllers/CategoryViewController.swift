//
//  DetailViewController.swift
//  SkySkunk
//
//  Created by Kemal Enver on 20/03/2017.
//  Copyright © 2017 Kemal Enver. All rights reserved.
//

import UIKit

class CategoryViewController: UIViewController {

    @IBOutlet var collectionView: UICollectionView! {
        didSet {
            
            collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "1")
            collectionView.delegate = self
            collectionView.dataSource = self
            
            collectionView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        self.title = "Category X"
    }
}

extension CategoryViewController: UICollectionViewDelegate {
    
}

extension CategoryViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 100
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "1", for: indexPath)
        cell.backgroundColor = UIColor.red
        
        return cell
    }
    
}

extension CategoryViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let width =  100.0
        let height = width * 1.6
        
        return CGSize(width: width, height: height)
    }
}
