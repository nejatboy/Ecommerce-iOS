//
//  CustomTextField.swift
//  Ecommerce
//
//  Created by muhammed dursun on 28.07.2024.
//

import UIKit

class CustomTextField : UITextField{
    
    init(placeHolder : String,isSecureText:Bool? = false){
        super.init(frame: .zero)
        
        let spaceView = UIView()
        leftView = spaceView
        leftViewMode = .always
        borderStyle = .roundedRect
        textColor = .white
        keyboardAppearance = .dark
        backgroundColor = UIColor(white: 1, alpha: 0.4)
        heightAnchor.constraint(equalToConstant: 50).isActive = true
        layer.cornerRadius = 3.5
        attributedPlaceholder = NSAttributedString(string: placeHolder,attributes: [.foregroundColor: UIColor(white: 1, alpha: 0.55)])
        isSecureTextEntry = isSecureText!
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
