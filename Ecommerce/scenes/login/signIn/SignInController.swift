//
//  SignInController.swift
//  Ecommerce
//
//  Created by muhammed dursun on 28.07.2024.
//


class SignInController: Controller<SignInViewModel, LoginNavigationController> {
    
    private let emailTextField = TextFieldLayout()
    private let passwordTextField = TextFieldLayout()
    private let loginButton = ButtonPrimary()
    private let signUpButton = ButtonSecondary()

    override func viewDidLoad() {
        super.viewDidLoad()
    
        addSubviews(emailTextField, passwordTextField, loginButton, signUpButton)
        
        activateConstraints(
            emailTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            emailTextField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 160),
            
            passwordTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            passwordTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 20),
            
            loginButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            loginButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 20),
            
            signUpButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            signUpButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20)
        )
    }
    
    
    override func customizeViews() {
        emailTextField.placeholder = "Email"
        passwordTextField.placeholder = "Password"
        
        loginButton.setTitle("Login", for: .normal)
        
        signUpButton.setTitle("SignUp", for: .normal)
        signUpButton.action = signUpButtonClicked
    }
    
    
    private func signUpButtonClicked() {
        navController?.signInToSignUp()
    }
}
