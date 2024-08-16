//
//  SplashController.swift
//  Ecommerce
//
//  Created by Nejat Boy on 28.07.2024.
//


class SplashController: Controller<SplashViewModel> {
    
    private let textfield = TextFieldLayout()
    private let button = ButtonPrimary()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addSubviews(textfield, button)
        
        activateConstraints(
            textfield.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            textfield.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.topAnchor.constraint(equalTo: textfield.bottomAnchor, constant: 20)
        )
    }
    
    
    override func customizeViews() {
        textfield.placeholder = "Name"
        
        button.setTitle("Click", for: .normal)
        button.action = buttonClicked
    }
    
    
    private func buttonClicked() {
        guard let input = textfield.text else {
            return
        }
        
        show(message: input, type: .success)
    }
}
