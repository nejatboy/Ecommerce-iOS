//
//  IndProductDetailViewModel.swift
//  Ecommerce
//
//  Created by Nejat Boy on 8.12.2024.
//

import UIKit

class IndProductDetailViewModel: ViewModel {
    
    var selectedProduct: Product?

    
    func addProductToCart(image: UIImage?, name: String?, quantity: Int?, description: String?, completion: Callback<Cart>?) {
        let noAction = AlertModel(title: "No")
        
        let yesAction = AlertModel(title: "Yes") {
            self.addProductToCartControl(image: image, name: name, quantity: quantity, description: description, completion: completion)
        }
        
        showAlert(type: .warning, message: "Do you want to add to cart?", actions: [noAction, yesAction])
    }
    
    
    private func addProductToCartControl(image: UIImage?, name: String?, quantity: Int?, description: String?, completion: Callback<Cart>?) {
        showLoading()
        
        var cart = UserDefaultsService.instance.cart
        
        let product = Product(name: name, price: self.selectedProduct?.price, imageUrl: selectedProduct?.imageUrl, shopUid:selectedProduct?.shopUid, description: description)
        let cartItem = CartItem(product: product, quantity: quantity ?? 1)
        
        cart = UserDefaultsService.instance.addItemToCart(item: cartItem)
        self.show(message: "The product has been added to the cart", type: .success)
        completion?(cart)
    }
    
    
    func addProductToCart(quantity: Int?, completion: Callback<Cart>?) {
        guard let selectedProduct = selectedProduct else {
            return
        }
        
        guard var quantity = quantity else {
            return
        }
        
        let noAction = AlertModel(title: "No")
        
        let yesAction = AlertModel(title: "Yes") {
            var cart = UserDefaultsService.instance.cart
            
            let cartItem = CartItem(product: selectedProduct, quantity: quantity)
            
            cart = UserDefaultsService.instance.addItemToCart(item: cartItem)
            completion?(cart)
        }
        
        showAlert(type: .warning, message: "Do you want to add to cart?", actions: [noAction, yesAction])
    }
}
