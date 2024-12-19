//
//  CorAddProductViewModel.swift
//  Ecommerce
//
//  Created by Nejat Boy on 28.09.2024.
//

import UIKit



class CorAddProductViewModel: ViewModel {
    
    var choosenShopUid: String?
    
    
    func addProductControl(productImage: UIImage?, name: String?, price: String?, description: String?, completion: Handler?) {
        guard var image = productImage, image != .add else {
            show(message: "Image is required", type: .error)
            return
        }
        
        guard let name = name else {
            show(message: "Name is required.", type: .error)
            return
        }
        
        guard let price = price else {
            show(message: "Price is required", type: .error)
            return
        }
        
        guard let description = description else {
            show(message: "Description is required.", type: .error)
            return
        }
        
        let noAction = AlertModel(title: "No")
        
        let yesAction = AlertModel(title: "Yes") {
            self.addProduct(image: &image, name: name, price: price, description: description, completion: completion)
        }
        
        showAlert(type: .warning, message: "Do you want to add the product ?", actions: [noAction, yesAction])
    }
    
    
    private func addProduct(image: inout UIImage, name: String, price: String, description: String, completion: Handler?) {
        showLoading()
        
        StorageService.instance.upload(image: &image) { imageUrl in
            let product = Product(
                name: name,
                price: Double(price.replacingOccurrences(of: ",", with: ".")),
                imageUrl: imageUrl,
                shopUid: self.choosenShopUid,
                description: description
            )
            
            DatabaseService.instance.addProduct(product: product) {
                self.show(message: "Product Add Succesfully", type: .success)
                completion?()
            }
        }
        
    }
}
