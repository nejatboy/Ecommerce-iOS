//
//  CorAddProductController.swift
//  Ecommerce
//
//  Created by Nejat Boy on 28.09.2024.
//

import UIKit


class CorAddProductController: Controller<CorAddProductViewModel, CorShopsNavigationController> {
    
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
            productName.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
          
            productPrice.topAnchor.constraint(equalTo: productName.bottomAnchor, constant: 20),
            productPrice.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
         
            addButton.topAnchor.constraint(equalTo: productPrice.bottomAnchor, constant: 35),
            addButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30)
        )
        
        
    }
    
    
    override func customizeViews() {
        productName.placeholder = "Product Name"
        
        productPrice.placeholder = "Product Price"
        productPrice.keyboardType = .decimalPad
        
        addButton.setTitle("Product add", for: .normal)
        
        productImage.load(photoUrl: "https://st3.depositphotos.com/6672868/14217/v/450/depositphotos_142179970-stock-illustration-user-profile-icon.jpg")
        productImage.set(cornerRadius: 60)
        productImage.contentMode = .scaleAspectFill
        productImage.clipsToBounds = true
        productImage.isUserInteractionEnabled = true
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(selectPhoto))
        productImage.addGestureRecognizer(tapGesture)
    }
    
    @objc func selectPhoto() {
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.sourceType = .photoLibrary
        present(imagePicker, animated: true, completion: nil)
    }
}

extension CorAddProductController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        picker.dismiss(animated: true, completion: nil)
        
        if let selectedImage = info[.originalImage] as? UIImage {
            // 1:1 oranında kırpma işlemi
            let croppedImage = cropToSquare(image: selectedImage)
            productImage.image = croppedImage
        }
        print("Product Size : \(productImage.image?.size)")
    }
    
    
    func cropToSquare(image: UIImage) -> UIImage? {
        let minLength = min(image.size.width, image.size.height)
        let squareSize = CGSize(width: minLength, height: minLength)
        let origin = CGPoint(x: (image.size.width - minLength) / 2, y: (image.size.height - minLength) / 2)
        let cropRect = CGRect(origin: origin, size: squareSize)
        
        UIGraphicsBeginImageContextWithOptions(squareSize, false, image.scale)
        image.draw(at: CGPoint(x: -cropRect.origin.x, y: -cropRect.origin.y))
        let croppedImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return croppedImage
    }
}
