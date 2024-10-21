//
//  CorProfileController.swift
//  Ecommerce
//
//  Created by Nejat Boy on 7.09.2024.
//


class CorProfileController: Controller<CorProfileViewModel, CorProfileNavigationController> {
    
    let nameText = TextFieldLayout()
    let surnameText = TextFieldLayout()
    let emailText = TextFieldLayout()
    let logOutButton = ButtonSecondary()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Profile"
        
        setNavButton(icon: .actions) {
            self.nameText.isUserInteractionEnabled = true
            self.surnameText.isUserInteractionEnabled = true
            self.emailText.isUserInteractionEnabled = true
        }
        
        addSubviews(nameText, surnameText, emailText, logOutButton)
        
        activateConstraints(
            nameText.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            nameText.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            nameText.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            
            surnameText.topAnchor.constraint(equalTo: nameText.bottomAnchor, constant: 20),
            surnameText.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            surnameText.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            
            emailText.topAnchor.constraint(equalTo: surnameText.bottomAnchor, constant: 20),
            emailText.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            emailText.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            
            logOutButton.topAnchor.constraint(equalTo: emailText.bottomAnchor, constant: 35),
            logOutButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        )
        
        getUserInfos()
        
        logOutButton.action = logOutButtonClicked
    }
    
    
    override func customizeViews() {
        logOutButton.setTitle("LogOut", for: .normal)
        self.nameText.isUserInteractionEnabled = false
        self.surnameText.isUserInteractionEnabled = false
        self.emailText.isUserInteractionEnabled = false
    }
    
    
    func getUserInfos() {
        viewModel.fetchUserInfos { user in
            self.nameText.text = user.name
            self.emailText.text = user.email
            self.surnameText.text = user.surname
        }
    }
    
    
    private func logOutButtonClicked() {
        AuthService.instance.logOut {
            self.showLoading()
            self.navController?.profileToSignIn()
        }
        self.hideLoading()
    }
    
}
