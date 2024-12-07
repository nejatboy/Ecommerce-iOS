//
//  UserDefaultsService.swift
//  Ecommerce
//
//  Created by Nejat Boy on 23.08.2024.
//

import Foundation


struct UserDefaultsService {
    
    static let instance = UserDefaultsService()
    private let defaults = UserDefaults.standard
    private let jsonDecoder = JSONDecoder()
    private let jsonEncoder = JSONEncoder()
    
    private init() { }
    
    
    func save<T: Codable>(_ object: T, key: UserDefaultsKey) {
        guard let encoded = try? jsonEncoder.encode(object) else {
            return
        }
        
        defaults.setValue(encoded, forKey: key.rawValue)
    }
    
    
    func save(_ object: Int, key: UserDefaultsKey) {
        defaults.setValue(object, forKey: key.rawValue)
    }
    
    
    private func fetch<T: Codable>(key: UserDefaultsKey) -> T? {
        guard let data = defaults.object(forKey: key.rawValue) as? Data else {
            return nil
        }
        
        return try? jsonDecoder.decode(T.self, from: data)
    }
    
    
    func remove(key: UserDefaultsKey) {
        defaults.removeObject(forKey: key.rawValue)
        defaults.synchronize()
    }
    
    
    /// Login olmuş olan kullanıcı var ise bilgilerini alabiliriz.
    var currentUser: User? {
        fetch(key: .user)
    }
    
    
    /// Sepet bilgisini almak için kullanırız. Sepete henüz ürün eklenmemişse boş bir diziye sahip model döner.
    var cart: Cart {
        fetch(key: .cart) ?? .init(items: [])
    }
    
    
    /// Sepete ürün eklemek için kullanırız. Aynı üründen var ise sadece adet bilgisi değişir.
    /// - Parameters:
    ///   - item: Ekelenecek olan item.
    /// - Returns: Güncel sepet modelini döner.
    func addItemToCart(item: CartItem) -> Cart {
        var cart = cart
        
        let index = cart.items.firstIndex {
            $0.product.uid == item.product.uid
        }
        
        if let index = index {
            cart.items[index].quantity += item.quantity
            
        } else {
            cart.items.append(item)
        }
        
        save(cart, key: .cart)
        return cart
    }
    
    
    /// Sepetten ürün silmek için kullanırız. Adet sayısını dikkate almaksızın ürünü sepetten siler.
    /// - Parameters:
    ///   - item: Silinecek olan item.
    /// - Returns: Güncel sepet modelini döner.
    func removeItemFromCart(item: CartItem) -> Cart {
        var cart = cart
        
        cart.items.removeAll {
            $0.product.uid == item.product.uid
        }
        
        save(cart, key: .cart)
        return cart
    }
    
    
    /// Sepetten ürün silmek için kullanırız. Adet sayısını dikkate almaksızın ürünü sepetten siler.
    /// - Parameters:
    ///   - item: Güncellenecek olan item.
    /// - Returns: Güncel sepet modelini döner.
    func updateItemOnCart(item: CartItem) -> Cart {
        var cart = cart
        
        let index = cart.items.firstIndex {
            $0.product.uid == item.product.uid
        }
        
        if let index = index {
            cart.items[index] = item
        }
        
        save(cart, key: .cart)
        return cart
    }
}
