//
//  Models.swift
//  Ecommerce
//
//  Created by Nejat Boy on 11.08.2024.
//

struct AlertModel {
    let title: String?
    var action: Handler?
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
