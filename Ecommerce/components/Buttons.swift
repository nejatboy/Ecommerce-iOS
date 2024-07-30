//
//  ButtonPrimary.swift
//  Ecommerce
//
//  Created by Nejat Boy on 30.07.2024.
//

import UIKit


//MARK: ButtonPrimary
class ButtonPrimary: Button {
    
    
    override func configure() {
        widthAnchor.constraint(equalToConstant: Device.width * 0.8).isActive = true
        heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        layer.cornerRadius = 10
        backgroundColor = .systemRed
        setTitleColor(.white, for: .normal)
    }
}



//MARK: ButtonSecondary
class ButtonSecondary: Button {
    
    
    override func configure() {
        widthAnchor.constraint(equalToConstant: Device.width * 0.8).isActive = true
        heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        layer.cornerRadius = 10
        layer.borderWidth = 1
        layer.borderColor = UIColor.systemRed.cgColor
        
        backgroundColor = .clear
        setTitleColor(.systemRed, for: .normal)
    }
}
