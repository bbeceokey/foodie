//
//  ViewController.swift
//  foodie
//
//  Created by Busra Ece on 16.06.2024.
//

import UIKit

class AccountViewController: UIViewController {

    
    
    @IBOutlet weak var authView: UIView!
    

    
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

