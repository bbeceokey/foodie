//
//  MealMenuViewModel.swift
//  foodie
//
//  Created by Busra Ece on 20.06.2024.
//

import Foundation


protocol MealMenuViewModelProtocol{
    //TODO: meallar be den çekilecek
    func  getMeals(completion: @escaping (Result<[Meal],NetworkError>) -> Void)
   
    //TODO: cell configure edilecek -> bunun için delegate gerekebilir
    
    //TODO: searchController eklenicek -> bunun için delegate gerekebilir
    //TODO: see all btn route edicek
    //TODO: cellere tıklanınca detay sayfaları gelicek
    //TODO: image e profil resmi gelicek ve tıklanınca profil sayfasına route edicek
}

final class MealMenuViewModel : MealMenuViewModelProtocol{
    private var meals: [Meal] = []
    private let networkManager = NetworkManager.instance
    
    func  getMeals(completion: @escaping (Result<[Meal],NetworkError>) -> Void)  {
        networkManager.get("/api/v1/products/1", output: [Meal].self){
            result in
            switch result {
            case .success(let meals):
                self.meals = meals
                completion(.success(meals))
            case .failure(let error):
                completion(.failure(error))
            }
        }
        
    }
    
    
}


