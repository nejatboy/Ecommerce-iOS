//
//  LoginViewController.swift
//  Ecommerce
//
//  Created by muhammed dursun on 28.07.2024.
//

import UIKit

class LoginController: Controller<LoginViewModel> {
    
  
    private let emailTextField = TextFieldLayout()
    private let passwordTextField = TextFieldLayout()
    private let loginButton = ButtonPrimary()
    

    override func viewDidLoad() {
        super.viewDidLoad()
    
        addSubviews(emailTextField, passwordTextField, loginButton)
        
        activateConstraints(
            emailTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            emailTextField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 160),
            
            passwordTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            passwordTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 20),
            
            loginButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            loginButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 20)
        )
    }
    
    
    override func customizeViews() {
        emailTextField.placeholder = "Email"
        passwordTextField.placeholder = "Password"
        
        loginButton.setTitle("Login", for: .normal)
    }
}
