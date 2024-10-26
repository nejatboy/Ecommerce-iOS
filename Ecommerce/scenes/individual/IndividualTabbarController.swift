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
        
        let profileController = IndProfileNavigationController()
        profileController.tabBarItem = .init(title: "Profile", image: .iconProfile, selectedImage: nil)
        
        viewControllers = [shopsController, profileController]
    }
    
    
    var shopsNavigationController: IndShopsNavigationController? {
        findController()
    }
    
    
    var profileNavigationController: CorProfileNavigationController? {
        findController()
    }
}
