//
//  Meal.swift
//  foodie
//
//  Created by Busra Ece on 20.06.2024.
//


import Foundation


struct Meal: Decodable {
    let id: Int
    let productName: String
    let productShortDescription: String
    let productDescription: String
    let productPrice: Int
    let productImage: String
    let tags: [Tag]
    let category: Category
    let orderCount: Int
    let productRating: Double
    let stock: Int
}

struct Category: Decodable {
    let id: Int
    let name: String
}

struct Tag: Decodable {
    let name: String
}
