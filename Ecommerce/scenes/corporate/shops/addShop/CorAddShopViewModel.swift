//
//  CorAddShopViewModel.swift
//  Ecommerce
//
//  Created by Nejat Boy on 8.09.2024.
//


class CorAddShopViewModel: ViewModel {
    
    
    func addShop(imageView: ImageView?, name: String, latitude: Double?, longitude: Double?, completion: Handler?) {
        guard var shopImageView = imageView?.image else {
            show(message: "Image is required", type: .error)
            return
        }
        
        showLoading()
        
        StorageService.instance.upload(image: &shopImageView) { imageUrl in
            let shop = Shop(name: name, latitude: latitude, longitude: longitude, imageUrl: imageUrl)
            
            DatabaseService.instance.addShop(shop: shop) {
                self.show(message: "Shop added succesfully", type: .success)
                completion?()
            }
        }
    }
    
    
    func shopAddingControl(shopImageView: ImageView?, name: String, latitude: Double?, longitude: Double?, completion: Handler?) {
        let noAction = AlertModel(title: "No")
        
        let yesAction = AlertModel(title: "Yes") {
            self.hideLoading()
            self.addShop( imageView: shopImageView, name: name, latitude: latitude, longitude: longitude, completion: completion)
        }
        
        showAlert(type: .warning, message: "Do you want to add the shop?", actions: [noAction, yesAction])
    }
    
    
    func fetchLocation(listener: Callback<Coordinate>?) {
        LocationService.instance.request(listener: listener)
    }
}
