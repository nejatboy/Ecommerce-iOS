//
//  SignInViewModel.swift
//  Ecommerce
//
//  Created by muhammed dursun on 9.08.2024.
//


class SignInViewModel: ViewModel {
    
    
    func login(email: String, password: String, completion: Handler?) {
        guard !email.isEmpty, !password.isEmpty else {
            return
        }
        
        AuthService.instance.login(email: email, password: password) { uid in
            completion?()
        }
    }
}