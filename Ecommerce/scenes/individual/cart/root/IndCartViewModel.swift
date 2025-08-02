//
//  IndCartViewModel.swift
//  Ecommerce
//
//  Created by muhammed dursun on 13.11.2024.
//

class IndCartViewModel: ViewModel {
    
    
    var cart: Cart? {
        UserDefaultsService.instance.cart
    }
    
    
    func deleteProduct(item: CartItem, completion: Callback<Cart>?) {
       let cart = UserDefaultsService.instance.removeItemFromCart(item: item)
        completion?(cart)
    }
}
