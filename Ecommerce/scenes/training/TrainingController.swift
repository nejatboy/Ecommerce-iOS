//
//  TrainingController.swift
//  Ecommerce
//
//  Created by Nejat Boy on 30.08.2024.
//

class TrainingController: Controller<TrainingViewModel, NavigationController> {
    
    private let numberPickerField = NumberPickerField()
    private let textPickerField = TextPickerField()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addSubviews(numberPickerField, textPickerField)
        
        
        activateConstraints(
            numberPickerField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            numberPickerField.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            
            textPickerField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            textPickerField.topAnchor.constraint(equalTo: numberPickerField.bottomAnchor, constant: 10)
        )
    }
    
    override func customizeViews() {
        numberPickerField.setItems(items: [1, 2, 3, 4, 5, 6, 7, 8, 9])
        numberPickerField.onItemSelect = onItemNumberSelected
        
        textPickerField.setItems(items: ["Elma", "Armut", "Kiraz", "Kavun", "Karpuz", "Üzüm", "Çilek", "Erik"])
        textPickerField.onItemSelect = onItemTextSelected
    }
    
    
    private func onItemNumberSelected(number: Int) {
        print(number)
    }
    
    
    private func onItemTextSelected(text: String) {
        print(text)
    }
}
