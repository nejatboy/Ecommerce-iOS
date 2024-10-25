//
//  IndShopsNavigationController.swift
//  Ecommerce
//
//  Created by Nejat Boy on 26.10.2024.
//

class IndShopsNavigationController: NavigationController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let rootController = IndShopsController()
        viewControllers = [rootController]
    }
}
