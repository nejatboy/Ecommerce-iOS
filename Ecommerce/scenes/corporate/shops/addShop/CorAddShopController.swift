//
//  CorAddShopController.swift
//  Ecommerce
//
//  Created by muhammed dursun on 8.09.2024.
//

import UIKit
import MapKit

private protocol ImagePickerProtocol: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
   func selectShopPhoto()
}

class CorAddShopController: Controller<CorAddShopViewModel, CorShopsNavigationController>, ImagePickerProtocol {
    
    private let nameTextField = TextFieldLayout()
    private let addShopButton = ButtonSecondary()
    private let mapView = MapView()
    private let shopImage = ImageView()
    let padding : CGFloat = 34
    let iconImageView = ImageView()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Add Shop"
        
        viewModel.fetchLocation(listener: locationReceived)
        
        addSubviews(mapView, nameTextField, addShopButton, shopImage)
    
        shopImage.addSubview(iconImageView)
        
        activateConstraints(
            mapView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 6),
            mapView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 6),
            mapView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -6),
            mapView.heightAnchor.constraint(equalToConstant: 230),
            
            shopImage.topAnchor.constraint(equalTo: mapView.bottomAnchor, constant: 18),
            shopImage.widthAnchor.constraint(equalToConstant: 120),
            shopImage.heightAnchor.constraint(equalToConstant: 120),
            shopImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            iconImageView.topAnchor.constraint(equalTo: shopImage.topAnchor, constant: padding),
            iconImageView.bottomAnchor.constraint(equalTo: shopImage.bottomAnchor, constant: -padding),
            iconImageView.leadingAnchor.constraint(equalTo: shopImage.leadingAnchor, constant: padding),
            iconImageView.trailingAnchor.constraint(equalTo: shopImage.trailingAnchor, constant: -padding),
         
            nameTextField.topAnchor.constraint(equalTo: shopImage.bottomAnchor, constant: 6),
            nameTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            addShopButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
            addShopButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        )
    }
    
    
    private func locationReceived(coordinate: Coordinate) {
        mapView.setRegion(coordinate: coordinate, meters: 1000, animated: true)
    }
    
    
    override func customizeViews() {
        nameTextField.placeholder = "Name"
        
        addShopButton.setTitle("Add Shop", for: .normal)
        
        mapView.layer.cornerRadius = 20
        
        shopImage.layer.borderColor = UIColor.lightGray.cgColor
        shopImage.layer.borderWidth = 1
        shopImage.layer.cornerRadius = 10
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(selectShopPhoto))
        
        shopImage.backgroundColor = .white
        shopImage.tintColor = .lightGray
        shopImage.contentMode = .scaleAspectFill
        shopImage.clipsToBounds = true
        shopImage.isUserInteractionEnabled = true
        shopImage.addGestureRecognizer(tapGesture)
        
        iconImageView.image = .iconAddImage
        iconImageView.contentMode = .scaleAspectFit
    }
    
    
    private func addShopButtonClicked() {
        guard
            let name = nameTextField.text,
            let shopLocation = mapView.selectedCoordinate
        else {
            return
        }
        
        viewModel.addShop(name: name, latitude: shopLocation.latitude, longitude: shopLocation.longitude) {
            self.navController?.addShopsToShops()
        }
    }
    
    
    @objc fileprivate func selectShopPhoto() {
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.allowsEditing = true
        imagePicker.sourceType = .photoLibrary
        
        present(imagePicker, animated: true)
    }
    
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        picker.dismiss(animated: true)
        
        shopImage.image = nil

        guard let croppedImage = info[.editedImage] as? UIImage else {
            return
        }
        
        shopImage.image = croppedImage
        iconImageView.image = nil
    }
}
