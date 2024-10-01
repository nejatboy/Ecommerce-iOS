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
    
    
    func addShopsToShops() {
        popViewController(animated: true)
    }
    
    
    func shopsToProduct(shop: Shop) {
        let controller = CorProductsController()
        controller.viewModel.selectedShop = shop
        
        pushViewController(controller, animated: true)
    }
    
    
    func productsToAddProduct() {
        if #available(iOS 14.0, *) {
            let controller = CorAddProductController()
            pushViewController(controller, animated: true)
        } else {
            // Fallback on earlier versions
        }
        
    }
}
