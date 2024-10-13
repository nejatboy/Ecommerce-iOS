//
//  CorAddProductViewModel.swift
//  Ecommerce
//
//  Created by Nejat Boy on 28.09.2024.
//

import UIKit


class CorAddProductViewModel: ViewModel {
    
    var chooseShop: Shop?
    
    func a(image: UIImage?, name: String, price: Double, shopUid: String, completion: Handler?) {
        guard var image = image else {
            return
        }
        
        StorageService.instance.upload(image: &image) { imageUrl in
            DatabaseService.instance.addProduct(product: Product(name: name, price: price, imageUrl: imageUrl, shopUid: shopUid), completion: completion)
        }
    }
}
