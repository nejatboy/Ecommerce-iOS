//
//  CorporateTabbarController.swift
//  Ecommerce
//
//  Created by Nejat Boy on 30.08.2024.
//


class CorporateTabbarController: TabbarController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let productController = CorProductNavigationController()
        productController.tabBarItem = .init(title: "", image: .iconInfo, selectedImage: nil)
        
        let profileController = CorProfileNavigationController()
        profileController.tabBarItem = .init(title: "", image: .iconProfile, selectedImage: nil)
        
        viewControllers = [productController, profileController]
    }
    
    
    var productNavivationController: CorProductNavigationController? {
        findController()
    }
    
    
    var profileNavigationController: CorProfileNavigationController? {
        findController()
    }
}
