//
//  CorAddShopViewModel.swift
//  Ecommerce
//
//  Created by Nejat Boy on 8.09.2024.
//


class CorAddShopViewModel: ViewModel {
    
    
    func addShop(name: String, latitude: Double?, longitude: Double?, completion: Handler?) {
        let shop = Shop(name: name, latitude: latitude, longitude: longitude)
        
        showLoading()
        
        DatabaseService.instance.addShop(shop: shop) {
            self.show(message: "Shop added succesfully", type: .success)
            
            completion?()
        }
    }
    
    
    func fetchLocation(listener: Callback<Coordinate>?) {
        LocationService.instance.request(listener: listener)
    }
}
