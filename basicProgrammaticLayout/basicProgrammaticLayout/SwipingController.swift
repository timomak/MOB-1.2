//
//  SwipingController.swift
//  basicProgrammaticLayout
//
//  Created by timofey makhlay on 10/31/18.
//  Copyright © 2018 Timofey Makhlay. All rights reserved.
//

import UIKit

class SwipingController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    let imageNames = ["bear_first","heart_second","leaf_third"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView?.backgroundColor = .white
        
        collectionView?.register(PageCell.self, forCellWithReuseIdentifier: "cellId")
        
        collectionView?.isPagingEnabled = true
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imageNames.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellId", for: indexPath) as! PageCell
        let imageName = imageNames[indexPath.item]
        cell.bearImageView.image = UIImage(named: imageName)
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: view.frame.height)
//        return CGSize(width: 100, height: 100)
    }
    
}
