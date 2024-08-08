//
//  SplashController.swift
//  Ecommerce
//
//  Created by Nejat Boy on 28.07.2024.
//

import UIKit


class SplashController: Controller<SplashViewModel> {
    
    private let textfield = TextFieldLayout()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(textfield)
        
        textfield.placeholder = "Name"
        
        NSLayoutConstraint.activate([
            textfield.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            textfield.centerYAnchor.constraint(equalTo: view.centerYAnchor),
        ])
    }
}
