//
//  TextFieldLayout.swift
//  Ecommerce
//
//  Created by Nejat Boy on 9.08.2024.
//

import UIKit


class TextFieldLayout: View, UITextFieldDelegate {
    
    private let textField = TextField()
    private let labelPlaceholder = Label()
    
    var isNumeric: Bool = false {
         didSet {
             textField.delegate = isNumeric ? self : nil
         }
     }

    
    override func configure() {
        widthAnchor.constraint(equalToConstant: Device.width * 0.8).isActive = true
        
        textField.delegate = self
        textField.font = .setDynamicFont(size: 16)
        textField.textColor = .black
        textField.layer.borderColor = UIColor.lightGray.cgColor
        textField.layer.borderWidth = 1
        textField.layer.cornerRadius = 10
        textField.inputAccessoryView = prepareDoneAccessoryButton()
        
        labelPlaceholder.textColor = .lightGray
        labelPlaceholder.font = .setDynamicFont(size: 11)
        
        addSubview(textField)
        addSubview(labelPlaceholder)
        
        NSLayoutConstraint.activate([
            labelPlaceholder.topAnchor.constraint(equalTo: topAnchor),
            labelPlaceholder.leadingAnchor.constraint(equalTo: leadingAnchor),
            
            textField.topAnchor.constraint(equalTo: labelPlaceholder.bottomAnchor, constant: 5),
            textField.leadingAnchor.constraint(equalTo: labelPlaceholder.leadingAnchor),
            textField.heightAnchor.constraint(equalToConstant: 44),
            
            bottomAnchor.constraint(equalTo: textField.bottomAnchor),
            trailingAnchor.constraint(equalTo: textField.trailingAnchor)
        ])
    }
    
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        guard isNumeric else { return true } // Eğer numeric değilse, tüm girişlere izin ver.

          let currentText = textField.text ?? ""
          guard let stringRange = Range(range, in: currentText) else { return false }
          let replacementString = string == "," ? "." : string
          let updatedText = currentText.replacingCharacters(in: stringRange, with: string)

          // Geçerli karakter seti (sadece rakamlar ve bir adet ondalık noktası veya virgül)
          let allowedCharacters = CharacterSet(charactersIn: "0123456789.,")
          let characterSet = CharacterSet(charactersIn: string)

          // Ondalık sayısı kontrolü (birden fazla olmamalı)
          let decimalCount = updatedText.components(separatedBy: ".").count - 1
          let commaCount = updatedText.components(separatedBy: ",").count - 1

          // Geçerli karakter seti ve ondalık sayısının birden fazla olmaması kontrolü
          return allowedCharacters.isSuperset(of: characterSet) && (decimalCount <= 1) && (commaCount <= 1)
    }
    
    
    func prepareDoneAccessoryButton() -> UIToolbar {
        let doneToolbar: UIToolbar = UIToolbar()
        doneToolbar.barStyle = .default
        doneToolbar.tintColor = .systemRed

        let flexSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let done: UIBarButtonItem = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(doneButtonAction))

        let items = [flexSpace, done]
        doneToolbar.items = items
        doneToolbar.sizeToFit()

        return doneToolbar
    }
    
    
    @objc private func doneButtonAction(){
        textField.resignFirstResponder()
    }
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        guard let nextField = textField.superview?.superview?.superview?.viewWithTag(textField.tag + 1) as? UITextField else {
            textField.resignFirstResponder()        //Hide keyaboard
            return false
        }
        
        nextField.becomeFirstResponder()        // Focus next
        return true
    }
    
    
    func addTabGesture(recognizer: UITapGestureRecognizer) {
        textField.isEnabled = false
        isUserInteractionEnabled = true
        addGestureRecognizer(recognizer)
    }
    
    
    private func showErrorForInput() {
        guard let placeholder = placeholder else {
            return
        }
        
        let okAction = AlertModel(title: "Okay")
        AlertView.instance.show(type: .error, message: "Please enter '\(placeholder)'", actions: [okAction])
    }
    
    
    var placeholder: String? {
        get {
            labelPlaceholder.text
        }
        
        set {
            textField.placeholder = newValue
            labelPlaceholder.text = newValue
        }
    }
    
    
    func setMultiplePlaceholder(top: String?, normal: String?) {
        textField.placeholder = normal
        labelPlaceholder.text = top
    }
    
    
    var returnKeyType: UIReturnKeyType {
        get {
            textField.returnKeyType
        }
        
        set {
            textField.returnKeyType = newValue
        }
    }
    
    
    var keyboardType: UIKeyboardType {
        get {
            textField.keyboardType
        }
        
        set {
            textField.keyboardType = newValue
        }
    }
    
    
    override var tag: Int {
        get {
            textField.tag
        }
        
        set {
            textField.tag = newValue
        }
    }
    
    
    var isSecureTextEntry: Bool {
        get {
            textField.isSecureTextEntry
        }
        
        set {
            textField.isSecureTextEntry = newValue
        }
    }
    
    
    var text: String? {
        get {
            guard let input = textField.text, !input.isEmpty else {
                showErrorForInput()
                return nil
            }
            
            return input
        }
        
        set {
            textField.text = newValue
        }
    }
    
    
    var textAlignment: NSTextAlignment {
        get {
            textField.textAlignment
        }
        
        set {
            textField.textAlignment = newValue
        }
    }
    
    
    override var inputView: UIView? {
        get {
            textField.inputView
        }
        
        set {
            textField.inputView = newValue
        }
    }
}

