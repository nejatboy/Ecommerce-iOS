//
//  IndProductDetailViewModel.swift
//  Ecommerce
//
//  Created by Nejat Boy on 8.12.2024.
//

import UIKit

class IndProductDetailViewModel: ViewModel {
    
    var selectedProduct: Product?
    
    
    func calculatePrice(quantity: Int) -> String? {
        guard let price = selectedProduct?.price else {
            return nil
        }
        
        let total = price * Double(quantity)
        return String(format: "%.2f TL", total)
    }

    
    func addProductToCart(quantity: Int?, completion: Handler?) {
        guard
            let selectedProduct = selectedProduct,
            let quantity = quantity
        else {
            return
        }
        
        let noAction = AlertModel(title: "No")
        
        let yesAction = AlertModel(title: "Yes") {
            let cartItem = CartItem(product: selectedProduct, quantity: quantity)
            _ = UserDefaultsService.instance.addItemToCart(item: cartItem)
            completion?()
        }
        
        showAlert(type: .warning, message: "Do you want to add to cart?", actions: [noAction, yesAction])
    }
}
