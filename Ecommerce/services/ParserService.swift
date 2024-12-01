//
//  ParserService.swift
//  Ecommerce
//
//  Created by Nejat Boy on 18.08.2024.
//

import FirebaseFirestore



struct ParserService {
    
    static let instance = ParserService()
    
    
    private init() {
        
    }
    
    
    func parseToUser(snapshot: DocumentSnapshot?) -> User? {
        guard let snapshot = snapshot else {
            return nil
        }
        
        return User(
            uid: snapshot.documentID,
            name: snapshot.get("name") as? String,
            surname: snapshot.get("surname") as? String,
            email: snapshot.get("email") as? String,
            type: UserType(rawValue: snapshot.get("type") as? String ?? UserType.individual.rawValue)
        )
    }
    
    
    func parseToShops(snapshot: QuerySnapshot?) -> [Shop]? {
        guard let snapshot = snapshot else {
            return nil
        }
        
        var shops: [Shop] = []
        
        for document in snapshot.documents {
            let shop = parseToShop(document: document)
            shops.append(shop)
        }
        
        return shops
    }
    
    
    private func parseToShop(document: QueryDocumentSnapshot) -> Shop {
        Shop(
            uid: document.documentID,
            name: document.get("name") as? String,
            latitude: document.get("latitude") as? Double,
            longitude: document.get("longitude") as? Double,
            imageUrl: document.get("imageUrl") as? String
        )
    }
    
    
    func parseToProducts(snapshot: QuerySnapshot?) -> [Product]? {
        guard let snapshot = snapshot else {
            return nil
        }
        
        var products: [Product] = []
        
        for document in snapshot.documents {
            let product = parseToProduct(document: document)
            products.append(product)
        }
        
        return products
    }
    
    
    private func parseToProduct(document: QueryDocumentSnapshot) -> Product {
        Product(
            uid: document.documentID,
            name: document.get("name") as? String,
            price: document.get("price") as? Double,
            imageUrl: document.get("imageUrl") as? String,
            shopUid: document.get("shopUid") as? String
        )
    }
}
