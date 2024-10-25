//
//  CorporateProfileNavigationController.swift
//  Ecommerce
//
//  Created by Nejat Boy on 7.09.2024.
//


class CorProfileNavigationController: NavigationController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let rootController = CorProfileController()
        viewControllers = [rootController]
    }
    
    
    func profileToSignIn() {
        navigationController?.popToRootViewController(animated: true)
    }
}
