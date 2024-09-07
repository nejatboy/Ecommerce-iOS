//
//  CorProductNavigationController.swift
//  Ecommerce
//
//  Created by Nejat Boy on 7.09.2024.
//


class CorProductNavigationController: NavigationController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        isNavigationBarHidden = true
        
        let rootController = CorProductController()
        viewControllers = [rootController]
    }
}
