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
        
        let indCardController = IndCardNavigationController()
        indCardController.tabBarItem = .init(title: "Card", image: .iconCard, selectedImage: nil)
        
        let profileController = IndProfileNavigationController()
        profileController.tabBarItem = .init(title: "Profile", image: .iconProfile, selectedImage: nil)
        
        viewControllers = [shopsController, indCardController, profileController]
    }
    
    
    var shopsNavigationController: IndShopsNavigationController? {
        findController()
    }
    
    
    var profileNavigationController: IndProfileNavigationController? {
        findController()
    }
    
    
    var cardNavigationController: IndCardNavigationController? {
        findController()
    }
    
    
    
}
