//
//  TabbarController.swift
//  Ecommerce
//
//  Created by Nejat Boy on 28.07.2024.
//

import UIKit


class TabbarController: UITabBarController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tabBar.backgroundColor = .lightGray
    }
    
    
    func findController<T: UIViewController>() -> T? {
        let controller = viewControllers?.first {
            $0 is T
        }
        
        return controller as? T
    }
}
