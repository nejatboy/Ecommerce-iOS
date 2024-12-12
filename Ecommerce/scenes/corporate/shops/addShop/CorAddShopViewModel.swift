//
//  CorAddShopViewModel.swift
//  Ecommerce
//
//  Created by Nejat Boy on 8.09.2024.
//

import UIKit


class CorAddShopViewModel: ViewModel {
    
   
    func shopAddingControl(shopImage: UIImage?, name: String?, coordinate: Coordinate?, completion: Handler?) {
        guard 
            let name = name,
            let shopImage = shopImage,
            let coordinate = coordinate
        else {
            return
        }
        
        showLoading()
        
        let noAction = AlertModel(title: "No")
        
        let yesAction = AlertModel(title: "Yes") {
            self.hideLoading()
            self.addShop( image: shopImage, name: name, coordinate: coordinate, completion: completion)
        }
        
        showAlert(type: .warning, message: "Do you want to add the shop?", actions: [noAction, yesAction])
    }
    
    
    private func addShop(image: UIImage?, name: String, coordinate: Coordinate?, completion: Handler?) {
        guard var shopImage = image else {
            show(message: "Image is required", type: .error)
            return
        }
        
        StorageService.instance.upload(image: &shopImage) { imageUrl in
            let shop = Shop(name: name, latitude: coordinate?.latitude, longitude: coordinate?.longitude, imageUrl: imageUrl)
            
            DatabaseService.instance.addShop(shop: shop) {
                self.show(message: "Shop added succesfully", type: .success)
                completion?()
            }
        }
    }
    
    
    func fetchLocation(listener: Callback<Coordinate>?) {
        LocationService.instance.request(listener: listener)
    }
}
