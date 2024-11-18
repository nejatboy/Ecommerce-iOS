//
//  IndividualTabbarController.swift
//  Ecommerce
//
//  Created by Nejat Boy on 30.08.2024.
//



class IndividualTabbarController: TabbarController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let shopsController = IndShopsNavigationController()
        shopsController.tabBarItem = .init(title: "Shops", image: .iconInfo, selectedImage: nil)
        
        let indCartController = IndCartNavigationController()
        indCartController.tabBarItem = .init(title: "Cart", image: .iconCart, selectedImage: nil)
        
        let profileController = IndProfileNavigationController()
        profileController.tabBarItem = .init(title: "Profile", image: .iconProfile, selectedImage: nil)
        
        viewControllers = [shopsController, indCartController, profileController]
    }
    
    
    var shopsNavigationController: IndShopsNavigationController? {
        findController()
    }
    
    
    var profileNavigationController: IndProfileNavigationController? {
        findController()
    }
    
    
    var cardNavigationController: IndCartNavigationController? {
        findController()
    }
}
