//
//  foodOptionCollectionViewCell.swift
//  foodie
//
//  Created by Busra Ece on 20.06.2024.
//

import UIKit

class foodOptionCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var stackView: UIStackView!
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var foodName: UILabel!
    
    
    func configureFoodsSec(image: String, foodName: String){
        self.image.image = UIImage(named: image)
        self.foodName.text = foodName
    }

}
