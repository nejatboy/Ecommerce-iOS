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
    
    
    func shopsToProduct(shop: Shop) {
        let controller = IndProductsController()
        controller.viewModel.selectedShop = shop
        
        pushViewController(controller, animated: true)
    }
    
    
    func productsToDetail(product: Product) {
        let controller = IndProductDetail()
        controller.viewModel.selectedProduct = product
        
        pushViewController(controller, animated: true)
    }
 
    
    func getShop(shop: Shop) {
        let controller = IndProductDetail()
        controller.viewModel.currentShop = shop
    }
    
    
    func productsDetailToCart() {
        popViewController(animated: true)
    }
}
