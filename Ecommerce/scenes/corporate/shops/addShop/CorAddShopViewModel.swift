//
//  CorAddShopViewModel.swift
//  Ecommerce
//
//  Created by Nejat Boy on 8.09.2024.
//


class CorAddShopViewModel: ViewModel {
    
    
    func addShop(name: String,latitude: Double, longitude: Double,completion: Handler?) {
        DatabaseService.instance.addShop(shop: Shop(name: name, latitude: latitude, longitude: longitude), completion: completion)
    }
}
