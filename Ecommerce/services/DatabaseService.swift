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
            
            completion?(user)
        }
    }
    
    
    private func show(message: String?, type: AlertType) {
        let okAction = AlertModel(title: "Okay")
        AlertView.instance.show(type: type, message: message, actions: [okAction])
    }
}
