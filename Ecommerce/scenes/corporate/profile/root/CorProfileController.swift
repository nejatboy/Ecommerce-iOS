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
        
        addSubviews(nameText, surnameText, emailText, logOutButton)
        
        activateConstraints(
            nameText.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            nameText.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50),
            
            surnameText.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            surnameText.topAnchor.constraint(equalTo: nameText.bottomAnchor, constant: 15),
            
            emailText.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            emailText.topAnchor.constraint(equalTo: surnameText.bottomAnchor, constant: 15),
            
            logOutButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            logOutButton.bottomAnchor.constraint(equalTo: emailText.bottomAnchor, constant: 105)
        )
    
        getUserInfos()
    }
    
    
    override func customizeViews() {
        logOutButton.setTitle("Log Out", for: .normal)
        
        logOutButton.action = logOutButtonClicked
        
        nameText.isUserInteractionEnabled = false
        surnameText.isUserInteractionEnabled = false
        emailText.isUserInteractionEnabled = false
    }
    
    
    func getUserInfos() {
        viewModel.fetchUserInfos { user in
            self.nameText.text = user.name
            self.emailText.text = user.email
            self.surnameText.text = user.surname
        }
    }
    
    
    private func logOutButtonClicked() {
        viewModel.logOut {
            self.tabBarController?.dismiss(animated: true)
        }
    }
}
