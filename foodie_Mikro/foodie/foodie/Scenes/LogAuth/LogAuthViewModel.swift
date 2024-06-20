//
//  LogAuthViewModel.swift
//  foodie
//
//  Created by Busra Ece on 16.06.2024.
//

import Foundation

protocol LoginViewModelProtocol { // burdaki işlemler
    var delegate: LoginViewModelDelegate? { get set }
    func regUser(user: User)
    func logUser(email: String, password: String)
    func logRegSelect(title:String) -> Bool
}

protocol LoginViewModelDelegate {//viewcontrollerla iletişim halinde olmamızı sağlar
    func routePage()
}

final class LoginViewModel : LoginViewModelProtocol {

    func regUser(user: User) {
        registerUser(user: user)
    }
    
    func logUser(email: String, password: String) {
        loginUser(email: email, password: password)
    }
    
   
    var delegate: LoginViewModelDelegate?
    var user =  User()
    private let networkManager = NetworkManager.instance
    
    
    
    fileprivate func registerUser(user: User) {
        networkManager.post("/auth/register", input: user, output: AuthResponse.self) { [weak self] result in
                switch result {
                case .success(let response):
                    self?.delegate?.routePage()
                case .failure(let error):
                    // Handle failure
                    print("Registration failed: \(error.localizedDescription)")
                }
            }
        }

        fileprivate func loginUser(email: String, password: String) {
            let credentials = ["email": email, "password": password]
            networkManager.post("/auth/login", input: credentials, output: AuthResponse.self) { [weak self] result in
                switch result {
                case .success(let response):
                    print(response)
                    self?.delegate?.routePage()
                case .failure(let error):
                    // Handle failure
                    print("Login failed: \(error.localizedDescription)")
                }
            }
        }
    
    
    func logRegSelect(title:String) -> Bool{
        if title == "Create Account"{
            return true
            
        } else {
            return false
        }
    }
  
}
