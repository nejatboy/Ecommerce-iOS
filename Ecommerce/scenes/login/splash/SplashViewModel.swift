//
//  SplashViewModel.swift
//  Ecommerce
//
//  Created by Nejat Boy on 28.07.2024.
//


class SplashViewModel: ViewModel {
    
    
    func check(completion: Callback<Bool>) {
        var currentUser = UserDefaultsService.instance.currentUser
        if currentUser != nil {
            completion(true)
        } else {
            completion(false)
        }
    }
}
