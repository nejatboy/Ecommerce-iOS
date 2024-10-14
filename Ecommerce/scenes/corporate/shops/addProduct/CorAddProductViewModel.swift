//
//  CorAddProductViewModel.swift
//  Ecommerce
//
//  Created by Nejat Boy on 28.09.2024.
//

import UIKit


class CorAddProductViewModel: ViewModel {
    
    var choosenShop: Shop?
    
   /* func addProduct(image: UIImage?, name: String, price: Double, shopUid: String, completion: Handler?) {
        guard var image = image else {
            return
        }
        
        StorageService.instance.upload(image: &image) { imageUrl in
            let product = Product(name: name, price: price, imageUrl: imageUrl, shopUid: shopUid)
            DatabaseService.instance.addProduct(product: product, completion: completion)
        }
    } */
    
    func addProduct(image: UIImage?, product: Product?, completion: Handler?) {
        guard var image = image else {
            return
        }
        
        StorageService.instance.upload(image: &image) { imageUrl in
            let currentProduct = Product(name: product?.name, price: product?.price, imageUrl: imageUrl, shopUid: product?.shopUid)
            DatabaseService.instance.addProduct(product: currentProduct, completion: completion)
        }
    }
}
