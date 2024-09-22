//
//  CorAddShopViewModel.swift
//  Ecommerce
//
//  Created by Nejat Boy on 8.09.2024.
//


class CorAddShopViewModel: ViewModel {
    
    private(set) var selectedCoordinate : Coordinate?
    
    
    func addShop(name: String, latitude: Double?, longitude: Double?, completion: Handler?) {
        let shop = Shop(name: name, latitude: latitude, longitude: longitude)
        DatabaseService.instance.addShop(shop: shop, completion: completion)
    }
    
    
    func updateCoordinate(for coordinate: Coordinate) {
        selectedCoordinate = coordinate
    }
    
    
    func fetchLocation(listener: Callback<Coordinate>?) {
        LocationService.instance.request(listener: listener)
    }
}
