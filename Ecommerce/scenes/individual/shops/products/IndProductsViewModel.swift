//
//  IndProductsViewModel.swift
//  Ecommerce
//
//  Created by Nejat Boy on 3.11.2024.
//

class IndProductsViewModel: ViewModel {
    
    var selectedShop: Shop?
    
    
    func fetchCurrentShopProducts(completion: Callback<[Product]>?) {
        showLoading()
        
        DatabaseService.instance.getProducts(of: selectedShop?.uid) { products in
            guard let products = products else {
                return
            }
            self.hideLoading()
            completion?(products)
        }
    }
}
