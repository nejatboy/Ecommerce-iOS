//
//  RegisterViewModel.swift
//  Ecommerce
//
//  Created by muhammed dursun on 9.08.2024.
//


class RegisterViewModel: ViewModel {
    
    
    func registerUser(email: String, password: String, againPassword: String, name: String, surname: String, type: UserType, completion: Handler?){
        if password != againPassword {
            show(message: "Passwords did not matched.", type: .error)
            return
        }
        
        AuthService.instance.registerUser(email: email, password: password) { uid in
            let user = User(uid: uid, name: name, surname: surname, email: email, type: type)
            DatabaseService.instance.saveUser(user: user, completion: completion)
            completion?()
        }
    }
}
