//
//  DatabaseService.swift
//  Ecommerce
//
//  Created by Nejat Boy on 6.08.2024.
//

import FirebaseFirestore
import FirebaseCore


struct DatabaseService {
    
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
        guard let userUid = UserDefaultsService.instance.currentUser?.uid else {
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
    
    
    private func show(message: String?, type: AlertType) {
        let okAction = AlertModel(title: "Okay")
        AlertView.instance.show(type: type, message: message, actions: [okAction])
    }
}
