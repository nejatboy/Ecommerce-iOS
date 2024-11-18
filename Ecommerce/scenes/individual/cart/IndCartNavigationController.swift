//
//  IndCartNavigationController.swift
//  Ecommerce
//
//  Created by muhammed dursun on 13.11.2024.
//

class IndCartNavigationController: NavigationController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let rootControlller = IndCartController()
        viewControllers = [rootControlller]
    }
}
