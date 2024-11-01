//
//  SplashViewModel.swift
//  Ecommerce
//
//  Created by Nejat Boy on 28.07.2024.
//


class SplashViewModel: ViewModel {
        
    
    func loadCurrentUser(completion: Callback<User>?) {
        showLoading()
        
        let user = UserDefaultsService.instance.currentUser
        
        if let user = user{
            hideLoading()
            completion?(user)
        } else {
            hideLoading()
            return
        }
    }
}
