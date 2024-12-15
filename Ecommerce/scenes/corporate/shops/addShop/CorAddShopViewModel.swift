//
//  CorAddShopViewModel.swift
//  Ecommerce
//
//  Created by Nejat Boy on 8.09.2024.
//

import UIKit


class CorAddShopViewModel: ViewModel {
    
   
    func shopAddingControl(shopImage: inout UIImage?, name: String?, coordinate: Coordinate?, completion: Handler?) {
        guard  let name = name else {
            return
        }
        
        guard let coordinate = coordinate else {
            show(message: "Select Location", type: .error)
            return
        }
        
        guard var shopImage = shopImage else {
            show(message: "Select Image", type: .error)
            return
        }
        
        let noAction = AlertModel(title: "No")
        
        let yesAction = AlertModel(title: "Yes") {
            self.addShop(image: &shopImage, name: name, coordinate: coordinate, completion: completion)
        }
        
        showAlert(type: .warning, message: "Do you want to add the shop?", actions: [noAction, yesAction])
    }
    
    
    private func addShop(image: inout UIImage, name: String, coordinate: Coordinate?, completion: Handler?) {
        showLoading()
        
        StorageService.instance.upload(image: &image) { imageUrl in
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
