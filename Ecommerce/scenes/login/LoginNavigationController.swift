//
//  LoginNavigationController.swift
//  Ecommerce
//
//  Created by Nejat Boy on 24.08.2024.
//


class LoginNavigationController: NavigationController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        isNavigationBarHidden = true
        
        let splashController = SplashController()
        viewControllers = [splashController]
    }
    
    
    func navigateToSignIn() {
        let signInController = SignInController()
        pushViewController(signInController, animated: true)
        
        viewControllers.removeAll {
            $0 is SplashController
        }
    }
    
    
    func navigateToSignUp() {
        //TODO
    }
}
