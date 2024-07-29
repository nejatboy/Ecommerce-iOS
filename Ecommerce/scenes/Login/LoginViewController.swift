//
//  LoginViewController.swift
//  Ecommerce
//
//  Created by muhammed dursun on 28.07.2024.
//

import UIKit

class LoginViewController: UIViewController {

    // MARK: - Properties
    
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
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configureUI()
    }
    
    // MARK: - Assistants
   
    func configureUI(){
        
        view.backgroundColor = .purple
        view.addSubview(emailText)
        view.addSubview(passwordText)
        view.addSubview(loginButton)
        
        emailText.currentAnchor(top: view.safeAreaLayoutGuide.topAnchor, leading: view.safeAreaLayoutGuide.leadingAnchor, bottom: nil, trailing: view.safeAreaLayoutGuide.trailingAnchor,padding: UIEdgeInsets(top: 90, left: 5, bottom: 0, right: 5))
        passwordText.currentAnchor(top: emailText.bottomAnchor, leading: view.safeAreaLayoutGuide.leadingAnchor, bottom: nil, trailing: view.safeAreaLayoutGuide.trailingAnchor,padding: UIEdgeInsets(top: 20, left: 5, bottom: 0, right: 5))
        loginButton.currentAnchor(top: passwordText.bottomAnchor, leading: view.safeAreaLayoutGuide.leadingAnchor, bottom: nil, trailing: view.safeAreaLayoutGuide.trailingAnchor,padding: UIEdgeInsets(top: 30, left: 5, bottom: 0, right: 5),currentSize: CGSize(width: 0, height:65))
    }

}
