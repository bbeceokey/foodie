//
//  User.swift
//  foodie
//
//  Created by Busra Ece on 16.06.2024.
//

import Foundation

struct User: Codable {
    var fullName: String?
    var email: String
    var password: String
    
    // Boş init fonksiyonu (initializer)
    init() {
        self.fullName = nil
        self.email = ""
        self.password = ""
    }
}

struct AuthResponse: Decodable {
    let token: String
}
