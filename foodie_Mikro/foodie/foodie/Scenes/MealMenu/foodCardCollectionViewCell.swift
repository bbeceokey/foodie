//
//  foodCardCollectionViewCell.swift
//  foodie
//
//  Created by Busra Ece on 20.06.2024.
//

import UIKit

class foodCardCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var foodName: UILabel!
    @IBOutlet weak var foodDetails: UILabel!
    @IBOutlet weak var foodImage: UIImageView!
    @IBOutlet weak var starsLabel: UILabel!
    @IBOutlet weak var price: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    @IBAction func addedFoodOnSepet(_ sender: Any) {
    }
}
