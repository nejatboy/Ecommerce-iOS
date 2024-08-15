//
//  RegisterViewModel.swift
//  Ecommerce
//
//  Created by muhammed dursun on 9.08.2024.
//


class RegisterViewModel: ViewModel {
    
    
    func registerUser(email: String, password: String, againPassword: String, name: String, surname: String, completion: Handler?){
        if password != againPassword {
            show(message: "Passwords did not matched.", type: .error)
            return
        }
        
        AuthService.instance.registerUser(email: email, password: password) { uid in
           completion?()
        }
    }
}
