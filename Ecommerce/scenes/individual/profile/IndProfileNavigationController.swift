//
//  IndProfileNavigationController.swift
//  Ecommerce
//
//  Created by Nejat Boy on 26.10.2024.
//

class IndProfileNavigationController: NavigationController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let rootController = IndProfileController()
        viewControllers = [rootController]
    }
}
