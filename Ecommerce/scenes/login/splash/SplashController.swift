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
        
        viewModel.showLoading()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2, execute: checkCurrentUser)
    }
    
    
    private func checkCurrentUser() {
        viewModel.hideLoading()
        
        if let currentUser = viewModel.currentUser {
            navController?.leaveFromLogin(userType: currentUser.type)
            return
        }
        
        navController?.splashToSignIn()
    }
}
