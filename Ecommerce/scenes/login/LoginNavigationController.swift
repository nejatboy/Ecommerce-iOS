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
    
    
    func splashToSignIn() {
        let signInController = SignInController()
        pushViewController(signInController, animated: true)
        
        viewControllers.removeAll{
            $0 is SplashController
        }
    }
    
    
    func signInToSignUp() {
        let signUpController = SignUpController()
        pushViewController(signUpController, animated: true)
    }
    
    
    func signUpToSignIn() {
       popViewController(animated: true)
    }
    
    
    func leaveFromLogin(userTypeString:String) {
        if userTypeString == "Individual" {
            let individualTabBarController = IndividualTabbarController()
            pushViewController(individualTabBarController, animated: true)
        }
        else {
            let corparateTabBarController = CorporateTabbarController()
            pushViewController(corparateTabBarController, animated: true)
        }
    }
}
