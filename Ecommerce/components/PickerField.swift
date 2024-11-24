//
//  PickerField.swift
//  Ecommerce
//
//  Created by Nejat Boy on 24.11.2024.
//

import UIKit


// MARK: NumberPickerField
class NumberPickerField: PickerField<Int> {
    
    
    override func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        let item = items[row]
        return String(item)
    }
    
    
    override func donePressed() {
        let row = pickerView.selectedRow(inComponent: 0)
        let item = items[row]
        text = String(item)
        onItemSelect?(item)
        
        super.donePressed()
    }
    
    
    override func setItems(items: [Int]) {
        text = String(items[0])
        super.setItems(items: items)
    }
}



// MARK: TextPickerField
class TextPickerField: PickerField<String> {
    
    
    override func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        let item = items[row]
        return String(item)
    }
    
    
    override func donePressed() {
        let row = pickerView.selectedRow(inComponent: 0)
        let item = items[row]
        text = item
        onItemSelect?(item)
        
        super.donePressed()
    }
    
    
    override func setItems(items: [String]) {
        text = items.first
        super.setItems(items: items)
    }
}



// MARK: PickerField
class PickerField<ITEM>: TextField, UIPickerViewDelegate, UIPickerViewDataSource {
    
    fileprivate let pickerView = UIPickerView()
    fileprivate var items: [ITEM] = []
    var onItemSelect: ((ITEM) -> Void)?
    
    
    override var padding: UIEdgeInsets {
        .init(top: 5, left: 5, bottom: 5, right: 5)
    }
    
    
    override func configure() {
        pickerView.delegate = self
        pickerView.dataSource = self
        
        borderStyle = .roundedRect
        textAlignment = .center
        inputView = pickerView
        
        let doneButton = UIBarButtonItem(title: "Select", style: .plain, target: self, action: #selector(donePressed))
        let flexibleSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let cancelButton = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(cancelPressed))
        
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        toolbar.tintColor = .systemRed
        toolbar.setItems([cancelButton, flexibleSpace, doneButton], animated: false)
        
        inputAccessoryView = toolbar
    }
    
    
    @objc func donePressed() {
        resignFirstResponder()
    }
    
    
    @objc private func cancelPressed() {
        resignFirstResponder()
    }
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }
    
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        items.count
    }
    
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        nil
    }
    
    
    func setItems(items: [ITEM]) {
        self.items = items
        pickerView.reloadAllComponents()
    }
}
