//
//  HabitImageCollectionViewCell.swift
//  Habitual
//
//  Created by timofey makhlay on 12/5/18.
//  Copyright © 2018 Timofey Makhlay. All rights reserved.
//

import UIKit

class HabitImageCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "habit image cell"
    
    static var nib: UINib {
        return UINib(nibName: String(describing: self), bundle: nil)
    }
    
    func setImage(image: UIImage){
        self.habitImage.image = image
    }
    
    @IBOutlet weak var habitImage: UIImageView!
    
}
