//
//  CorAddProductViewModel.swift
//  Ecommerce
//
//  Created by Nejat Boy on 28.09.2024.
//



class CorAddProductViewModel: ViewModel {
    
    var choosenShopUid: String?
    
    
    func addProduct(imageView: ImageView?, name: String, price: Double, shopUid: String, completion: Handler?) {
        guard var image = imageView?.image, image != .add else {
            show(message: "Image is required", type: .error)
            return
        }
        
        StorageService.instance.upload(image: &image) { imageUrl in
            let currentProduct = Product(name: name, price: price, imageUrl: imageUrl, shopUid: shopUid)
            DatabaseService.instance.addProduct(product: currentProduct, completion: completion)
        }
    }
}
