//
//  IndCartViewModel.swift
//  Ecommerce
//
//  Created by muhammed dursun on 13.11.2024.
//

class IndCartViewModel: ViewModel {
    
    
    func getAllProductsFromAllShops(completion: Callback<[Product]>?) {
        DatabaseService.instance.getAllProductsFromAllShops { products in
           /* guard let products = products else {
                return
            } */
            completion?(products)
        }
    }
    
}
