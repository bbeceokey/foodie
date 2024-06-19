//
//  MealMenuViewController.swift
//  foodie
//
//  Created by Busra Ece on 16.06.2024.
//

import UIKit

class MealMenuViewController: UIViewController {
    @IBOutlet weak var profilePhoto: UIImageView!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var foodImage: UIView!
    @IBOutlet weak var foodOptions: UICollectionView!
    @IBOutlet weak var foodCards: UICollectionView!
    @IBOutlet weak var popularMenu: UITableView!
    @IBOutlet weak var seeAllBtn: UIButton!
    var token: String?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let token = token else { return }
        // Do any additional setup after loading the view.
    }


}
