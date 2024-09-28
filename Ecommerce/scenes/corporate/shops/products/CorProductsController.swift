//
//  CorProductsController.swift
//  Ecommerce
//
//  Created by Nejat Boy on 28.09.2024.
//


class CorProductsController: Controller<CorProductsViewModel, CorShopsNavigationController> {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setNavButton(icon: .add, onClicked: navController?.productsToAddProduct)
        
        navigationItem.title = viewModel.selectedShop?.name
    }
}
