//
//  popularMenuTableViewCell.swift
//  foodie
//
//  Created by Busra Ece on 20.06.2024.
//

import UIKit

class popularMenuTableViewCell: UITableViewCell {

    @IBOutlet weak var foodDetail: UILabel!
    @IBOutlet weak var foodName: UILabel!
    @IBOutlet weak var price: UILabel!
    @IBOutlet weak var foodImage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
