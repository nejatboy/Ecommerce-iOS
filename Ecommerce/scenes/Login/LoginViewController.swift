//
//  LoginViewController.swift
//  Ecommerce
//
//  Created by muhammed dursun on 28.07.2024.
//

import UIKit

class LoginViewController: UIViewController {
    
    private let emailText = CustomTextField(placeHolder: "Email", isSecureText: false)
    private let passwordText = CustomTextField(placeHolder: "Password",isSecureText: true)
    private let loginButton : UIButton = {
        let btn = UIButton()
        btn.setTitle("LogIn", for: .normal)
        btn.backgroundColor = .blue
        btn.tintColor = .red
        btn.layer.masksToBounds = true
        btn.layer.cornerRadius = 0.5
        return btn
    }()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
    }

    
    func configureUI(){ 
        let stack = UIStackView(arrangedSubviews: [emailText,passwordText,loginButton])
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.distribution = .fillEqually
        stack.spacing = 20
        stack.axis = .vertical
        
        view.addSubview(stack)
        view.backgroundColor = .purple
        
        NSLayoutConstraint.activate([
            stack.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50),
            stack.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 5),
            stack.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -5),
            stack.heightAnchor.constraint(equalToConstant: 200)
        ])
    }
}
