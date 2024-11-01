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
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2, execute: checkCurrentUser)
    }
    
    
    private func checkCurrentUser() {
        viewModel.loadCurrentUser { user in
            self.navController?.leaveFromLogin(userType: user.type)
        }
        
        navController?.splashToSignIn()
    }
}
