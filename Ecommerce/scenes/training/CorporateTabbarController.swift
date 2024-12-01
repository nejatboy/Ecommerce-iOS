//
//  CorporateTabbarController.swift
//  Ecommerce
//
//  Created by Nejat Boy on 30.08.2024.
//


class CorporateTabbarController: TabbarController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let shopsController = CorShopsNavigationController()
        shopsController.tabBarItem = .init(title: "Shops", image: .iconShop, selectedImage: nil)
        
        let profileController = CorProfileNavigationController()
        profileController.tabBarItem = .init(title: "Profile", image: .iconProfile, selectedImage: nil)
        
        viewControllers = [shopsController, profileController]
    }
    
    
    var shopsNavigationController: CorShopsNavigationController? {
        findController()
    }
    
    
    var profileNavigationController: CorProfileNavigationController? {
        findController()
    }
}
