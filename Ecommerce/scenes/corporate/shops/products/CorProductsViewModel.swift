//
//  CorProductsViewModel.swift
//  Ecommerce
//
//  Created by Nejat Boy on 28.09.2024.
//

import UIKit

class CorProductsViewModel: ViewModel {
    
    var selectedShop: Shop?
    let products: [Product] = [
        .init(uid: nil, name: "Sucuk", price: 152.72, imageUrl: nil),
        .init(uid: nil, name: "Silgi", price: 20.50, imageUrl: nil),
        .init(uid: nil, name: "Kalem", price: 56.99, imageUrl: nil)
    ]
}
