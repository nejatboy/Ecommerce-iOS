//
//  SplashController.swift
//  Ecommerce
//
//  Created by Nejat Boy on 28.07.2024.
//

import Foundation

class SplashController: Controller<SplashViewModel, LoginNavigationController> {
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        showLoading()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.hideLoading()
            
            if UserDefaultsService.instance.currentUser != nil {
                self.navController?.leaveFromLogin(userType: UserDefaultsService.instance.currentUser?.type)
            }
            else {
                self.navController?.splashToSignIn()
            }
        }
    }
}
