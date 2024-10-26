//
//  IndProfileController.swift
//  Ecommerce
//
//  Created by Nejat Boy on 26.10.2024.
//


class IndProfileController: Controller<IndProfileViewModel, IndProfileNavigationController> {
    
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
        
        logOutButton.action = logOutButtonClicked
        
        nameText.isUserInteractionEnabled = false
        surnameText.isUserInteractionEnabled = false
        emailText.isUserInteractionEnabled = false
    }
    
    
    override func customizeViews() {
        logOutButton.setTitle("LogOut", for: .normal)
    }
    
    
    private func getUserInfos() {
        viewModel.fetchUserInfos { [self] user in
            nameText.text = user.name
            surnameText.text = user.surname
            emailText.text = user.email
        }
    }
    
    
    private func logOutButtonClicked() {
        viewModel.logOut {
            let leaveAction = AlertModel(title: "Yes") {
                self.viewModel.logOut {
                    self.tabBarController?.dismiss(animated: true)
                }
            }
            
            let notLeaveAction = AlertModel(title: "No")
            
            self.showAlert(type: .warning, message: "Do you want to go out ?", actions: [leaveAction,notLeaveAction])
        }
    }
}
