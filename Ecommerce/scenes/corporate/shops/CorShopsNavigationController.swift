//
//  CorShopsNavigationController.swift
//  Ecommerce
//
//  Created by Nejat Boy on 7.09.2024.
//


class CorShopsNavigationController: NavigationController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let rootController = CorShopsController()
        viewControllers = [rootController]
    }
    
    
    func shopsToAddShop() {
        let controller = CorAddShopController()
        pushViewController(controller, animated: true)
    }
}
