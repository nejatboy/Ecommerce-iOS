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


class CorAddProductController: ControllerHasImagePicker<CorAddProductViewModel, CorShopsNavigationController> {
    
    private let productName = TextFieldLayout()
    private let productPrice = TextFieldLayout()
    private let productImage = ImageView()
    private let iconImageView = ImageView()
    let padding: CGFloat = 30
    private let productDescription = TextFieldLayout()
    private let addButton = ButtonSecondary()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Add Product"
        
        addSubviews(productImage, productName, productPrice, productDescription, addButton)
        
        productImage.addSubview(iconImageView)
        
        activateConstraints(
            productImage.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 18),
            productImage.widthAnchor.constraint(equalToConstant: 120),
            productImage.heightAnchor.constraint(equalToConstant: 120),
            productImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            iconImageView.topAnchor.constraint(equalTo: productImage.topAnchor, constant: padding),
            iconImageView.bottomAnchor.constraint(equalTo: productImage.bottomAnchor, constant: -padding),
            iconImageView.leadingAnchor.constraint(equalTo: productImage.leadingAnchor, constant: padding),
            iconImageView.trailingAnchor.constraint(equalTo: productImage.trailingAnchor, constant: -padding),
            
            productName.topAnchor.constraint(equalTo: productImage.bottomAnchor, constant: 20),
            productName.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            productName.heightAnchor.constraint(equalToConstant: 64),
          
            productPrice.topAnchor.constraint(equalTo: productName.bottomAnchor, constant: 20),
            productPrice.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            productPrice.heightAnchor.constraint(equalToConstant: 64),
            
            productDescription.topAnchor.constraint(equalTo: productPrice.bottomAnchor, constant: 20),
            productDescription.leadingAnchor.constraint(equalTo: productPrice.leadingAnchor, constant: 0),
            productDescription.heightAnchor.constraint(equalToConstant: 104),
           
            addButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -68),
            addButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        )
        
        
    }
    
    
    override func customizeViews() {
        productName.placeholder = "Name"
        
        productPrice.placeholder = "Price"
        productPrice.keyboardType = .decimalPad
        
        productDescription.placeholder = "Description"
        
        productImage.layer.borderColor = UIColor.lightGray.cgColor
        productImage.layer.borderWidth = 1
        productImage.layer.cornerRadius = 10
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(photoClicked))
       
        productImage.tintColor = .lightGray
        productImage.backgroundColor = .white
        productImage.contentMode = .scaleAspectFill
        productImage.clipsToBounds = true
        productImage.isUserInteractionEnabled = true
        productImage.addGestureRecognizer(tapGesture)
        
        iconImageView.image = .iconAddImage
        iconImageView.contentMode = .scaleAspectFit
        
        addButton.setTitle("Add Product", for: .normal)
        addButton.action = addButtonClicked
    }
    
    
    @objc func photoClicked() {
        super.openImagePicker()
    }
    
    
    override func onImageSelected(image: UIImage) {
        productImage.image = image
        iconImageView.image = nil
    }
   
    
    func addButtonClicked() {        
        viewModel.addProductControl(productImage: productImage.image, name: productName.text, price: productPrice.text, description: productDescription.text) {
            self.navController?.popViewController(animated: true)
        }
    }
}
