//
//  MealMenuViewController.swift
//  foodie
//
//  Created by Busra Ece on 20.06.2024.
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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // Do any additional setup after loading the view.
    }
    private let mealMenuViewModel: MealMenuViewModelProtocol = MealMenuViewModel()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // getFoods fonksiyonunu çağırarak meals dizisini alalım
        mealMenuViewModel.getMeals { result in
            switch result {
            case .success(let meals):
                // Başarılı durumda alınan meals dizisini print ile kontrol edelim
                print("Received meals:", meals)
            case .failure(let error):
                // Hata durumunda hatayı print ile kontrol edelim
                print("Error fetching meals:", error)
            }
        }
        
    }
}

