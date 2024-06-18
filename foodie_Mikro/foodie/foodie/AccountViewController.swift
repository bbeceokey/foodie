//
//  ViewController.swift
//  foodie
//
//  Created by Busra Ece on 16.06.2024.
//

import UIKit

class AccountViewController: UIViewController, LoginViewModelDelegate {

    func routePage(with token: String) {
        let mealMenuVC = MealMenuViewController()
        mealMenuVC.token = token
        navigationController?.pushViewController(mealMenuVC, animated: true)
    }
    
    @IBOutlet weak var authView: UIView!
    
    var viewModel : LoginViewModelProtocol! {
        didSet{
            viewModel.delegate = self
        }
    }
    
    
    var authViewController = AuthViewController(nibName: nil, bundle: nil)

    override func viewDidLoad() {
        super.viewDidLoad()
        
        authViewController.view.frame = authView.bounds
        authViewController.view.autoresizingMask = [.flexibleWidth,.flexibleHeight]
        
        addChild(authViewController)
        authView.addSubview(authViewController.view)
        
        authViewController.didMove(toParent: self)
        
        authViewController.configureView(regFlag: false)
        
    
    }


}

