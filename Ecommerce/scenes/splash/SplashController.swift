//
//  SplashController.swift
//  Ecommerce
//
//  Created by Nejat Boy on 28.07.2024.
//



enum Meyveler: String, Codable, CaseIterable {
    case karpuz = "Karpuz"
    case kiraz = "Kiraz"
    case elma = "Elma"
    case armut = "Armut"
}


class SplashController: Controller<SplashViewModel> {
    
    private let textfield = TextFieldLayout()
    private let button = ButtonPrimary()
    private let fruitButton = ButtonSecondary()
    private let segmentView = SegmentView<Meyveler>()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addSubviews(textfield, button, fruitButton, segmentView)
        
        activateConstraints(
            textfield.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            textfield.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50),
            
            segmentView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            segmentView.topAnchor.constraint(equalTo: textfield.bottomAnchor, constant: 20),
            
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.topAnchor.constraint(equalTo: segmentView.bottomAnchor, constant: 20),
            
            fruitButton.topAnchor.constraint(equalTo: button.bottomAnchor, constant: 10),
            fruitButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        )
    }
    
    
    override func customizeViews() {
        textfield.placeholder = "Name"
        
        button.setTitle("Click", for: .normal)
        button.action = buttonClicked
        
        fruitButton.setTitle("Meyve Ye", for: .normal)
        fruitButton.action = fruitButtonClicked
    }
    
    
    private func buttonClicked() {
        guard let input = textfield.text else {
            return
        }
        
        show(message: input, type: .success)
    }
    
    
    private func fruitButtonClicked() {
        show(message: segmentView.currentElement.rawValue + " yedim 😋", type: .success)
    }
}
