//
//  IndProductDetailViewModel.swift
//  Ecommerce
//
//  Created by Nejat Boy on 8.12.2024.
//

import UIKit

class IndProductDetailViewModel: ViewModel {
    
    var selectedProduct: Product?

    
    func addProductToCart(quantity: String?, completion: Handler?) {
        guard let selectedProduct = selectedProduct else {
            return
        }
        
        guard let quantity = quantity else {
            return
        }
        
        let noAction = AlertModel(title: "No")
        
        let yesAction = AlertModel(title: "Yes") {
            let cartItem = CartItem(product: selectedProduct, quantity: Int(quantity) ?? 1)
            
            let cart =  UserDefaultsService.instance.addItemToCart(item: cartItem)
            
            completion?()
        }
        
        showAlert(type: .warning, message: "Do you want to add to cart?", actions: [noAction, yesAction])
    }
}
