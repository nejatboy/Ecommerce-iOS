//
//  Models.swift
//  Ecommerce
//
//  Created by Nejat Boy on 11.08.2024.
//

import UIKit



struct AlertModel {
    let title: String?
    var action: Handler?
}



struct SwipeAction {
    let title: String?
    let backgroundColor: UIColor?
    let icon: UIImage?
    let handler: Callback<Int>?
}



struct User: Codable {
    let uid: String?
    let name: String?
    let surname: String?
    let email: String?
    let type: UserType?
}



enum UserType: String, Codable, CaseIterable {
    case individual = "Individual"
    case corporate = "Corporate"
}



struct Shop: Encodable {
    var uid: String?
    let name: String?
    let latitude: Double?
    let longitude: Double?
    let ownerUid: String? = UserDefaultsService.instance.currentUser?.uid
    let imageUrl: String?
}



struct Coordinate {
    let latitude: Double?
    let longitude: Double?
}



struct Product: Codable {
    var uid: String?
    let name: String?
    let price: Double?
    let imageUrl: String?
    let shopUid: String?
    let description: String?
}



struct CartItem: Codable {
    let product: Product
    var quantity: Int
}



struct Cart: Codable {
    var items: [CartItem]
}
