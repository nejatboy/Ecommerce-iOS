//
//  RegisterController.swift
//  Ecommerce
//
//  Created by muhammed dursun on 3.08.2024.
//


class RegisterController: Controller<RegisterViewModel> {
    
    
    private let nameTextField = TextFieldLayout()
    private let surnameTextField = TextFieldLayout()
    private let emailTextField = TextFieldLayout()
    private let passwordTextField = TextFieldLayout()
    private let againPasswordTextField = TextFieldLayout()
    private let segmentView = SegmentView<UserType>()
    private let registerButton = ButtonPrimary()
    private let loginButton = ButtonSecondary()
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addSubviews(nameTextField, surnameTextField, emailTextField, passwordTextField, againPasswordTextField, segmentView, registerButton, loginButton)
        
        activateConstraints(
            nameTextField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            nameTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            surnameTextField.topAnchor.constraint(equalTo: nameTextField.bottomAnchor, constant: 10),
            surnameTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            emailTextField.topAnchor.constraint(equalTo: surnameTextField.bottomAnchor, constant: 10),
            emailTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            passwordTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 10),
            passwordTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            againPasswordTextField.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 10),
            againPasswordTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            segmentView.topAnchor.constraint(equalTo: againPasswordTextField.bottomAnchor, constant: 10),
            segmentView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            registerButton.topAnchor.constraint(equalTo: segmentView.bottomAnchor, constant: 15),
            registerButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            loginButton.topAnchor.constraint(equalTo: registerButton.bottomAnchor, constant: 50),
            loginButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        )
    }
    
    
    override func customizeViews() {
        nameTextField.placeholder = "Name"
        surnameTextField.placeholder = "Surname"
        emailTextField.placeholder = "Email"
        passwordTextField.placeholder = "Password"
        againPasswordTextField.placeholder = "Again Password"
        
        registerButton.setTitle("Register", for: .normal)
        registerButton.action = registerButtonClicked
        
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
   
    
    private func registerButtonClicked() {
        guard
            let name = nameTextField.text, !name.isEmpty,
            let surname = surnameTextField.text, !surname.isEmpty,
            let email = emailTextField.text, !email.isEmpty,
            let password = passwordTextField.text, !password.isEmpty,
            let againPassword = againPasswordTextField.text, !againPassword.isEmpty
        else{
            return
        }
        
        
        viewModel.registerUser(email: email, password: password, againPassword: againPassword, name: name, surname: surname, completion: <#T##Handler?##Handler?##() -> Void#>)
        
    }
}
