//
//  CorAddProductViewModel.swift
//  Ecommerce
//
//  Created by Nejat Boy on 28.09.2024.
//



class CorAddProductViewModel: ViewModel {
    
    var choosenShopUid: String?
    
    
    func addProduct(imageView: ImageView?, name: String?, price: String?, completion: Handler?) {
        guard var image = imageView?.image, image != .add else {
            show(message: "Image is required", type: .error)
            return
        }
        
        guard
            let name = name,
            let price = price
        else {
            return
        }
        
        showLoading()
        
        StorageService.instance.upload(image: &image) { imageUrl in
            let product = Product(
                name: name,
                price: Double(price.replacingOccurrences(of: ",", with: ".")),
                imageUrl: imageUrl,
                shopUid: self.choosenShopUid
            )
            
            DatabaseService.instance.addProduct(product: product, completion: completion)
        }
    }
}
