//
//  AuthViewController.swift
//  foodie
//
//  Created by Busra Ece on 16.06.2024.
//

import UIKit

class AuthViewController: UIViewController, LoginViewModelDelegate {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var nameTextfield: UITextField!
    @IBOutlet weak var pswdTextfield: UITextField!
    @IBOutlet weak var selectAccountCollectionView: UICollectionView!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var sliderBar: UIButton!
    @IBOutlet weak var saveBtn: UIButton!
    
    private var authViewModel = LoginViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        authViewModel.delegate = self
        
        selectAccountCollectionView.dataSource = self
        selectAccountCollectionView.delegate = self
        let nib = UINib(nibName: "SelectAccountCollectionViewCell", bundle: nil)
        selectAccountCollectionView.register(nib, forCellWithReuseIdentifier: "selectCell")

        selectAccountCollectionView.reloadData()
    }
    
    func routePage() { //mealMenuVC
        if  storyboard == UIStoryboard(name: "Main", bundle: nil) {
            if let mealMenuVC = storyboard?.instantiateViewController(withIdentifier: "mealMenuVC") as? MealMenuViewController {
                navigationController?.pushViewController(mealMenuVC, animated: true)
            } else {
                print("MealMenuViewController instantiate edilemedi")
            }
        } else {
            print("Storyboard yüklenemedi")
        }
    }
    
    func configureView(regFlag: Bool){
        if regFlag { // register ise
            nameLabel.isHidden = false
            nameTextfield.isHidden = false
            saveBtn.setTitle("Register", for: .normal)
        } else {
            nameTextfield.isHidden = true
            nameLabel.isHidden = true
            saveBtn.setTitle("Log In", for: .normal)
        }
    }
    
    @IBAction func clickedBtn(_ sender: Any) {
        if saveBtn.titleLabel?.text == "Log In" {
            authViewModel.logUser(email: emailTextField.text ?? "", password: pswdTextfield.text ?? "")
            
            
        } else {
            var user = User()
            user.email = emailTextField.text ?? ""
            user.fullName = nameTextfield.text ?? "ece"
            user.password = pswdTextfield.text ?? "****"
            authViewModel.regUser(user: user)
        }
    }

}


extension AuthViewController : UICollectionViewDelegate, UICollectionViewDataSource{
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        2
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = selectAccountCollectionView.dequeueReusableCell(withReuseIdentifier: "selectCell", for: indexPath) as! SelectAccountCollectionViewCell
        
        if indexPath.item == 0 {
            cell.configCell(regFlag: true, title: "Create Account")
            //cell.configCell(regFlag: true)
        } else if indexPath.item == 1 {
            cell.configCell(regFlag: true, title: "Log In")
            //cell.configCell(regFlag: false)
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if indexPath.item == 0{
            configureView(regFlag: true)
            selectAccountCollectionView.reloadData()
        } else {
            configureView(regFlag: false)
            selectAccountCollectionView.reloadData()
        }
    }
    
    
}
