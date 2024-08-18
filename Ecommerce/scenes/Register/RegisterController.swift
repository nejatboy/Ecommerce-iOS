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
    private let segmentedController : UISegmentedControl = {
        let segmentedControl = UISegmentedControl(items: ["Bireysel","Ticari"])
        segmentedControl.selectedSegmentIndex = 0
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        segmentedControl.addTarget(self, action: #selector(touchSegmentedController), for: .valueChanged)
        return segmentedControl
    }()
    private let registerButton = ButtonPrimary()
    private let loginButton = ButtonSecondary()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addSubviews(nameTextField,surnameTextField,emailTextField,passwordTextField,againPasswordTextField,segmentedController,registerButton,loginButton)
        
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
            
            segmentedController.topAnchor.constraint(equalTo: againPasswordTextField.bottomAnchor, constant: 10),
            segmentedController.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 10),
            segmentedController.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -10),
            segmentedController.heightAnchor.constraint(equalToConstant: 60),
            segmentedController.widthAnchor.constraint(equalToConstant: Device.width*0.8),
            
            registerButton.topAnchor.constraint(equalTo: segmentedController.bottomAnchor, constant: 15),
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
        
        loginButton.setTitle("Login", for: .normal)
    }
    
    @objc func touchSegmentedController(){
        switch segmentedController.selectedSegmentIndex{
        case 0 :
            print("PRİNT: You chose Individual.")
        case 1:
            print("PRİNT: You chose Commercial.")
        default:
            print("PRİNT: You chose default Individual.")
        }
    }
}
