//
//  CorAddProductController.swift
//  Ecommerce
//
//  Created by Nejat Boy on 28.09.2024.
//

import UIKit

private protocol ImagePickerProtocol: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func selectPhoto()
}


class CorAddProductController: Controller<CorAddProductViewModel, CorShopsNavigationController>, ImagePickerProtocol {
    
    private let productName = TextFieldLayout()
    private let productPrice = TextFieldLayout()
    private let productImage = ImageView()
    private let addButton = ButtonSecondary()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Add Product"
        
        addSubviews(productImage, productName, productPrice, addButton)
        
        activateConstraints(
            productImage.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 35),
            productImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            productName.topAnchor.constraint(equalTo: productImage.bottomAnchor, constant: 20),
            productName.centerXAnchor.constraint(equalTo: view.centerXAnchor),
          
            productPrice.topAnchor.constraint(equalTo: productName.bottomAnchor, constant: 20),
            productPrice.centerXAnchor.constraint(equalTo: view.centerXAnchor),
         
            addButton.topAnchor.constraint(equalTo: productPrice.bottomAnchor, constant: 35),
            addButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        )
        
        addButton.action = touchAddProduct
    }
    
    
    override func customizeViews() {
        productName.placeholder = "Product Name"
        
        productPrice.placeholder = "Product Price"
        productPrice.keyboardType = .decimalPad
        
        addButton.setTitle("Add Product", for: .normal)
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(selectPhoto))
        
        productImage.image = .add
        productImage.tintColor = .systemRed
        productImage.backgroundColor = .lightGray
        productImage.set(cornerRadius: 60)
        productImage.contentMode = .scaleAspectFit
        productImage.clipsToBounds = true
        productImage.isUserInteractionEnabled = true
        productImage.addGestureRecognizer(tapGesture)
    }
    
    
    @objc fileprivate func selectPhoto() {
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.allowsEditing = true
        imagePicker.sourceType = .photoLibrary
        
        present(imagePicker, animated: true)
    }
    
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        picker.dismiss(animated: true)
        
        guard let croppedImage = info[.editedImage] as? UIImage else {
            return
        }
        
        productImage.image = croppedImage
    }
    
    
    func touchAddProduct() {
        guard let image = productImage.image else {
            show(message: "Image is required.", type: .error)
            return
        }
        let priceText = productPrice.text?.replacingOccurrences(of: ",", with: ".")
        
        let product = Product(name: productName.text,
                               price: Double(priceText ?? "0"),
                               imageUrl: nil,
                               shopUid: viewModel.choosenShop?.uid)
        
        viewModel.addProduct(image: image, product: product) {
            self.show(message: "Product Add Succesfully.", type: .success)
        }
    }
}
