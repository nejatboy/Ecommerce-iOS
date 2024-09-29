//
//  CorProductsViewModel.swift
//  Ecommerce
//
//  Created by Nejat Boy on 28.09.2024.
//

import UIKit

class CorProductsViewModel: ViewModel {
    
    var selectedShop: Shop?
    
    lazy var products: [Product] = [
        .init(name: "Sucuk", price: 152.72, imageUrl: "https://static.ticimax.cloud/40901/uploads/urunresimleri/dogal-klasik-kangal-sucuk-400-gr-295114.jpg", shopUid: selectedShop?.uid),
        .init(name: "Silgi", price: 20.50, imageUrl: "https://www.ersanlisanat.com/u/ersanlisanat/img/c/f/a/faber-castell-dust-free-kirmizi-silgi-kucukcc0f87b1a59491e53cd7b41b292f92cb.jpg", shopUid: selectedShop?.uid),
        .init(name: "Kalem", price: 56.99, imageUrl: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTKO6AXLxT48tLTZS-WEBE2Ty7VQxL7mu3J_A&s", shopUid: selectedShop?.uid)
    ]
}
