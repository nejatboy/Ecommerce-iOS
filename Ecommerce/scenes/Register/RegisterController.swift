//
//  RegisterController.swift
//  Ecommerce
//
//  Created by muhammed dursun on 3.08.2024.
//

import UIKit

class RegisterController:UIViewController{
    
    // MARK: - Properties
    
    private let name: UITextField = {
       let text = UITextField()
        text.placeholder = "Name"
        text.font = UIFont.systemFont(ofSize: 20)
        text.textColor = .red
        text.borderStyle = .roundedRect
        text.textAlignment = .left
        return text
    }()
    private let surName: UITextField = {
       let text = UITextField()
        text.placeholder = "SurName"
        text.font = UIFont.systemFont(ofSize: 20)
        text.textColor = .red
        text.borderStyle = .roundedRect
        text.textAlignment = .left
        return text
    }()
    
    private let emailField  : UITextField =  {
        let textfield = UITextField()
        textfield.placeholder = "Email"
        textfield.keyboardType = .emailAddress
        textfield.borderStyle = .roundedRect
        return textfield
    }()
    private let passwordField : UITextField = {
        let text  = UITextField()
        text.placeholder = "Password"
        text.borderStyle = .roundedRect
        text.isSecureTextEntry = true
        return text
    }()
    private let againPasswordField : UITextField = {
        let text  = UITextField()
        text.placeholder = "Again Password"
        text.isSecureTextEntry = true
        text.borderStyle = .roundedRect
        return text
    }()
    private let registerButton : UIButton = {
        let btn = UIButton(type: .system)
        btn.setTitle("Register", for: .normal)
        btn.isEnabled = false
        btn.setTitleColor(UIColor(white: 1, alpha: 0.65), for: .normal)
        btn.backgroundColor = #colorLiteral(red: 0.1215686277, green: 0.01176470611, blue: 0.4235294163, alpha: 1)
        btn.layer.cornerRadius = 6
        btn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 21)
        btn.addTarget(self, action: #selector(touchRegister), for: .touchUpInside)
        return btn
    }()
    private let logInButton : UIButton = {
        let btn = UIButton(type: .system)
        btn.setTitle("SignUp", for: .normal)
        btn.addTarget(self, action: #selector(touchLogIn), for: .touchUpInside)
        return btn
    }()
    
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        configureUI()
    }
    
    // MARK: - Assistants
    
    func configureUI(){
        
        let stack = UIStackView(arrangedSubviews: [name,surName,emailField,passwordField,againPasswordField])
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.distribution = .fillEqually
        stack.axis = .vertical
        stack.spacing = 5
        view.addSubview(stack)
        NSLayoutConstraint.activate(
        [
            stack.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,constant: 20),
            stack.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor,constant: 10),
            stack.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: 10),
            stack.heightAnchor.constraint(equalToConstant: 150),
            stack.widthAnchor.constraint(equalToConstant:100)
        ])
        
    }
    
    // MARK: - Actions
    
    @objc  func touchRegister(){
        
        print("PRİNT: Register button is clicked.")
    }
    
    @objc func touchLogIn(){
        
        
    }
    
}
