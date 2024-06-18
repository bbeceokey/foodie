//
//  SelectAccountCollectionViewCell.swift
//  foodie
//
//  Created by Busra Ece on 16.06.2024.
//

import UIKit

class SelectAccountCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var textLabel: UILabel?
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    
    func configCell(regFlag: Bool, title : String){
        if regFlag{
            textLabel?.text = title
        } else {
            textLabel?.text = title
        }
    }

}
