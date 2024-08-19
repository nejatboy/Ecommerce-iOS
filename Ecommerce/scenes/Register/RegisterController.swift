//
//  RegisterController.swift
//  Ecommerce
//
//  Created by muhammed dursun on 3.08.2024.
//

import UIKit

class RegisterController: Controller<RegisterViewModel> {
    
    private let nameTextField = TextFieldLayout()
    private let surnameTextField = TextFieldLayout()
    private let emailTextField = TextFieldLayout()
    private let passwordTextField = TextFieldLayout()
    private let againPasswordTextField = TextFieldLayout()
    private let segmentView = SegmentView<UserType>()
    private let registerButton = ButtonPrimary()
    private let loginButton = ButtonSecondary()
    private let chooseButton = ButtonSecondary()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addSubviews(nameTextField, surnameTextField, emailTextField, passwordTextField, againPasswordTextField, segmentView, chooseButton, registerButton, loginButton)
        
        activateConstraints(
            nameTextField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            nameTextField.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 10),
            nameTextField.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -10),
            
            surnameTextField.topAnchor.constraint(equalTo: nameTextField.bottomAnchor, constant: 10),
            surnameTextField.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 10),
            surnameTextField.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -10),
            
            emailTextField.topAnchor.constraint(equalTo: surnameTextField.bottomAnchor, constant: 10),
            emailTextField.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 10),
            emailTextField.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -10),
            
            passwordTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 10),
            passwordTextField.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 10),
            passwordTextField.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -10),
            
            againPasswordTextField.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 10),
            againPasswordTextField.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 10),
            againPasswordTextField.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -10),
            
            segmentView.topAnchor.constraint(equalTo: againPasswordTextField.bottomAnchor, constant: 10),
            segmentView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 10),
            segmentView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -10),
            segmentView.heightAnchor.constraint(equalToConstant: 60),
            segmentView.widthAnchor.constraint(equalToConstant: Device.width * 0.8),
            
            chooseButton.topAnchor.constraint(equalTo: segmentView.bottomAnchor, constant: 10),
            chooseButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 10),
            chooseButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -10),
            
            registerButton.topAnchor.constraint(equalTo: chooseButton.bottomAnchor, constant: 15),
            registerButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 10),
            registerButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -10),
            
            loginButton.topAnchor.constraint(equalTo: registerButton.bottomAnchor, constant: 50),
            loginButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 10),
            loginButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -10)
        )
    }
    
    
    override func customizeViews() {
        nameTextField.placeholder = "Name"
        surnameTextField.placeholder = "Surname"
        emailTextField.placeholder = "Email"
        passwordTextField.placeholder = "Password"
        againPasswordTextField.placeholder = "Again Password"
        
        registerButton.setTitle("Register", for: .normal)
       
        chooseButton.setTitle("Choose", for: .normal)
        chooseButton.action = choseButtonClicked
        
        loginButton.setTitle("Login", for: .normal)
    }
    
    
    private func choseButtonClicked(){
        show(message: "You chose " + segmentView.currentElement.rawValue , type: .success)
    }
}
