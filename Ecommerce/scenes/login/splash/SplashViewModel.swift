//
//  SplashViewModel.swift
//  Ecommerce
//
//  Created by Nejat Boy on 28.07.2024.
//


class SplashViewModel: ViewModel {
    
    
    func checkUser(navigation : LoginNavigationController?) {
        
        if let currentUser = UserDefaultsService.instance.currentUser {
            navigation?.leaveFromLogin(userType: currentUser .type)
        }
        else {
            navigation?.splashToSignIn()
        }
    }
}
