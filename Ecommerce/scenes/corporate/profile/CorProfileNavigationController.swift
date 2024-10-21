//
//  CorporateProfileNavigationController.swift
//  Ecommerce
//
//  Created by Nejat Boy on 7.09.2024.
//


class CorProfileNavigationController: NavigationController {
    
    
   /* override func viewDidLoad() {
        super.viewDidLoad()
        
        let rootController = CorProfileController()
        viewControllers = [rootController]
    } */
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let rootController = CorProfileController()
        viewControllers = [rootController]
    }
    
    
    func profileToSignIn() {
        let signInController = SignInController()
        signInController.modalPresentationStyle = .fullScreen
        present(signInController, animated: true)
    }
}
