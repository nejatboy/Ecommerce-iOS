//
//  IndProductDetailViewModel.swift
//  Ecommerce
//
//  Created by Nejat Boy on 8.12.2024.
//

import UIKit

class IndProductDetailViewModel: ViewModel {
    
    var selectedProduct: Product?
    var currentShop: Shop?
    
    
    func productAddingControl(image: UIImage?, name: String?, quantity: Int?, description: String?, completion: Handler?) {
        guard var image = image else {
            show(message: "Product Image information is missing.", type: .error)
            return
        }
        
        guard let name = name else {
            show(message: "Product name information is missing.", type: .error)
            return
        }
        
        guard let description = description else {
            show(message: "Product description information is missing.", type: .error)
            return
        }
        
        guard var quantity = quantity else {
            return
        }
        
        let noAction = AlertModel(title: "No")
        
        let yesAction = AlertModel(title: "Yes") {
            self.addProductToCart(image: &image, name: name, quantity: quantity, description: description, completion: completion)
        }
        
        showAlert(type: .warning, message: "Do you want to add to cart?", actions: [noAction, yesAction])
    }
    
    
    private func addProductToCart(image: inout UIImage, name: String?, quantity: Int?, description: String?, completion: Handler?) {
        showLoading()
        
        StorageService.instance.upload(image: &image) { imageUrl in
            let product = Product(name: name, price: self.selectedProduct?.price, imageUrl: imageUrl, shopUid: self.currentShop?.uid, description: description)
            let cartItem = CartItem(product: product, quantity: quantity ?? 1)
            
            UserDefaultsService.instance.addItemToCart(item: cartItem)
            self.show(message: "The product has been added to the cart", type: .success)
            completion?()
        }
    }
}
