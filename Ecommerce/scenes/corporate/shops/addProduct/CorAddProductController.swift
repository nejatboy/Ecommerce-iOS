//
//  CorAddProductController.swift
//  Ecommerce
//
//  Created by Nejat Boy on 28.09.2024.
//

 import UIKit
import PhotosUI


@available(iOS 14.0, *)
class CorAddProductController: Controller<CorAddProductViewModel, CorShopsNavigationController>, PHPickerViewControllerDelegate {
  
    private let productName = TextFieldLayout()
    private let productPrice = TextFieldLayout()
    private let addProductButton = ButtonSecondary()
    private let productImage = ImageView()
    private let productButton = Button()
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Add Product"
        
        productPrice.isNumeric = true
        productPrice.keyboardType = .decimalPad
    
        addSubviews(productButton, productName, productPrice, addProductButton)
        
        activateConstraints(
            productButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 15),
            productButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            productButton.widthAnchor.constraint(equalToConstant: 120),
            productButton.heightAnchor.constraint(equalToConstant: 120),
            
            productName.topAnchor.constraint(equalTo: productButton.bottomAnchor, constant: 20),
            productName.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            productPrice.topAnchor.constraint(equalTo: productName.bottomAnchor, constant: 15),
            productPrice.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            addProductButton.topAnchor.constraint(equalTo: productPrice.bottomAnchor, constant: 25),
            addProductButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        )
       
        productImage.load(photoUrl: "https://media.istockphoto.com/id/1495088043/tr/vektör/user-profile-icon-avatar-or-person-icon-profile-picture-portrait-symbol-default-portrait.jpg?s=612x612&w=0&k=20&c=xpdT_tBhcZudUtboWVCTG4cQ9xvc9J-yQ5_dVRPLka4=") { [weak self] image in
            self?.productButton.setImage(image, for: .normal)
        }
     
        productButton.action = touchProfileImageButton
    }
    
    
    override func customizeViews() {
        productName.placeholder = "Product Name"
        
        productPrice.placeholder = "Product Price"
        
        addProductButton.setTitle("Add Product", for: .normal)
        
        productImage.clipsToBounds = true
    }
    
    
    func touchProfileImageButton() {
        var configuration = PHPickerConfiguration()
        configuration.filter = .images
        let picker = PHPickerViewController(configuration: configuration)
        picker.delegate = self
        present(picker,animated: true, completion: nil)
    }
    
    
    func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
        picker.dismiss(animated: true)
        
        guard let result = results.first else { return }
        
        if result.itemProvider.canLoadObject(ofClass: UIImage.self) {
            result.itemProvider.loadObject(ofClass: UIImage.self) { [weak self] (image, error) in
                if let image = image as? UIImage {
                    let croppedImage = self?.cropImageToSquare(image: image)
                    self?.productImage.image = croppedImage
                    self?.productButton.setImage(croppedImage, for: .normal) // Burada butona resmi ayarlıyoruz
                }
            }
        }
    }
    
    
    func cropImageToSquare(image: UIImage) -> UIImage? {
        let size = min(image.size.width, image.size.height)
        let origin = CGPoint(x: (image.size.width - size) / 2, y: (image.size.height - size) / 2)
        let cropRect = CGRect(origin: origin, size: CGSize(width: size, height: size))
        
        if let cgImage = image.cgImage?.cropping(to: cropRect) {
            return UIImage(cgImage: cgImage)
        }
        return nil
    }
}
