//
//  CorProductsViewModel.swift
//  Ecommerce
//
//  Created by Nejat Boy on 28.09.2024.
//

import UIKit

class CorProductsViewModel: ViewModel {
    
    var selectedShop: Shop?
    
    
    func fetchCurrentShopProducts(completion: Callback<[Product]>?) {
        DatabaseService.instance.getProducts(of: selectedShop?.uid) { products in
            guard let products = products else {
                return
            }
            completion?(products)
        }
    }
}
