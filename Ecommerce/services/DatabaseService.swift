//
//  DatabaseService.swift
//  Ecommerce
//
//  Created by Nejat Boy on 6.08.2024.
//

import FirebaseFirestore
import FirebaseCore


struct DatabaseService: Service {
    
    static let instance = DatabaseService()
    private let db = Firestore.firestore()
    
    
    private init() {
        
    }
    
    /// Kullanıcı bilgilerini kaydetmek kullanılır.
    ///
    /// - Parameters:
    ///   - user: Kaydedeciğimiz user'ın modelleşmiş halidir. 'uid' alanı mutlaka dolu olmalıdır.
    ///   - completion: Başarılı kaydı ifade eder.
    func saveUser(user: User, completion: Handler?) {
        guard let uid = user.uid else {
            return
        }
        
        db.collection("Users").document(uid).setData(user.dictionary) { error in
            if let error = error {
                show(message: error.localizedDescription, type: .error)
                return
            }
            
            UserDefaultsService.instance.save(user, key: .user)
            
            completion?()
        }
    }
    
    
    /// Kullanıcı bilgilerini kaydetmek kullanılır.
    ///
    /// - Parameters:
    ///   - uid: Bilgilerini istediğimiz kullanıcının Authentication uid'sidir.
    ///   - completion: Başarılı işlemdir ve User modeli döner.
    func fetchUser(uid: String, completion: Callback<User>?) {
        db.collection("Users").document(uid).getDocument { snapshot, error in
            if let error = error {
                show(message: error.localizedDescription, type: .error)
                return
            }
            
            guard let user = ParserService.instance.parseToUser(snapshot: snapshot) else {
                show(message: "Cannot parsed.", type: .error)
                return
            }
            
            UserDefaultsService.instance.save(user, key: .user)
            
            completion?(user)
        }
    }
    
    
    ///Ticari kullanıcının dükkan eklemesi için kullanırız.
    func addShop(shop: Shop, completion: Handler?) {
        guard (UserDefaultsService.instance.currentUser?.uid) != nil else {
            show(message: "Please log in.", type: .error)
            return
        }
        
        db.collection("Shops").document().setData(shop.dictionary) { error in
            if let error = error {
                show(message: error.localizedDescription, type: .error)
                return
            }
            
            completion?()
        }
    }
    
    
    /// Login olan ticari müşterinin dükkanlarını çekmek için kullanırız.
    func getMyShops(completion: Callback<[Shop]?>?) {
        guard let userUid = UserDefaultsService.instance.currentUser?.uid else {
            show(message: "Please log in.", type: .error)
            return
        }
        
        db.collection("Shops").whereField("ownerUid", isEqualTo: userUid).getDocuments { snapshot, error in
            if let error = error {
                show(message: error.localizedDescription, type: .error)
                return
            }
            
            let shops = ParserService.instance.parseToShops(snapshot: snapshot)
            completion?(shops)
        }
    }
    
    
    /// Dükkana ürün eklemek için kullanırız
    ///
    /// - Parameters:
    ///   - product: Ürün modeli.
    ///   - completion: Başarılı kaydı ifade eder.
    func addProduct(product: Product, completion: Handler?) {
        guard (UserDefaultsService.instance.currentUser?.uid) != nil else {
            show(message: "Please log in.", type: .error)
            return
        }
        
        guard let shopUid = product.shopUid else {
            show(message: "Shop cannot find.", type: .error)
            return
        }
        
        db.collection("Shops").document(shopUid).collection("Products").document().setData(product.dictionary) { error in
            if let error = error {
                show(message: error.localizedDescription, type: .error)
                return
            }
            
            completion?()
        }
    }
    
    
    /// Dükkana ait ürüneri çekmek için kullanırız
    ///
    /// - Parameters:
    ///   - shopUid: Ürünlerini istediğimiz uid'sidir.
    ///   - completion: Optional olarak ürünleri döner.
    func getProducts(of shopUid: String?, completion: Callback<[Product]?>?) {
        guard let shopUid = shopUid else {
            show(message: "Shop cannot find.", type: .error)
            return
        }
        
        db.collection("Shops").document(shopUid).collection("Products").getDocuments { snapshot, error in
            if let error = error {
                show(message: error.localizedDescription, type: .error)
                return
            }
            
            let products = ParserService.instance.parseToProducts(snapshot: snapshot)
            completion?(products)
        }
    }
    
    
    /// Çevredeki dükkanları getirmek için kullanırız
    ///
    /// - Parameters:
    ///   - coordinate: Bireysel kullanıcın konumu.
    ///   - completion: Optional olarak dükkanları döner.
    func getShops(coordinate: Coordinate, completion: Callback<[Shop]?>?) {
        guard let userUid = UserDefaultsService.instance.currentUser?.uid else {
            show(message: "Please log in.", type: .error)
            return
        }
        
        db.collection("Shops").getDocuments { snapshot, error in
            if let error = error {
                show(message: error.localizedDescription, type: .error)
                return
            }
            
            let shops = ParserService.instance.parseToShops(snapshot: snapshot)
            completion?(shops)
        }
    }
}
