//
//  AuthService.swift
//  Ecommerce
//
//  Created by Nejat Boy on 6.08.2024.
//

import FirebaseAuth


struct AuthService {
    
    static let instance = AuthService()
    private let auth = Auth.auth()
    
    
    private init() {}
    
    
    /// Kullanıcı kaydı için kullanılır.
    ///
    /// - Parameters:
    ///   - completion: Kayıt başarılı ise kaydedilen kullanıcının uid değerini döner.
    func registerUser(email: String, password: String, completion: Callback<String>?) {
        auth.createUser(withEmail: email, password: password) { result, error in
            if let uid = result?.user.uid {
                completion?(uid)
                return
            }
            
            show(message: error?.localizedDescription, type: .error)
        }
    }
    
    
    /// Kullanıcı login yapmak için kullanırız.
    ///
    /// - Parameters:
    ///   - completion: Giriş başarılı ise kullanıcının uid değerini döner.
    func login(email: String, password: String, completion: Callback<String>?) {
        auth.signIn(withEmail: email, password: password) { result, error in
            if let uid = result?.user.uid {
                completion?(uid)
                return
            }
            
            show(message: error?.localizedDescription, type: .error)
        }
    }
    
    
    private func show(message: String?, type: AlertType) {
        let okAction = AlertModel(title: "Okay")
        AlertView.instance.show(type: type, message: message, actions: [okAction])
    }
}
