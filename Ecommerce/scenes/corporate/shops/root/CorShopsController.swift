//
//  CorShopsController.swift
//  Ecommerce
//
//  Created by Nejat Boy on 7.09.2024.
//


class CorShopsController: Controller<CorShopsViewModel, CorShopsNavigationController> {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Shops"
        setNavButton(icon: .add, onClicked: navController?.shopsToAddShop)
    }
}
