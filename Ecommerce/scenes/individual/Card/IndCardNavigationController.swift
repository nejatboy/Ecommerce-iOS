//
//  IndCardNavigationController.swift
//  Ecommerce
//
//  Created by muhammed dursun on 13.11.2024.
//

class IndCardNavigationController: NavigationController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let rootControlller = IndCardController()
        viewControllers = [rootControlller]
    }
}
