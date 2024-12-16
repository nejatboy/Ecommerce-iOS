//
//  CorAddShopController.swift
//  Ecommerce
//
//  Created by muhammed dursun on 8.09.2024.
//

import UIKit



class CorAddShopController: ControllerHasImagePicker<CorAddShopViewModel, CorShopsNavigationController> {
    
    private let nameTextField = TextFieldLayout()
    private let addShopButton = ButtonSecondary()
    private let mapView = MapView()
    private let shopImage = ImageView()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Add Shop"
        
        viewModel.fetchLocation(listener: locationReceived)
        
        addSubviews(mapView, nameTextField, addShopButton, shopImage)
        
        activateConstraints(
            mapView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 6),
            mapView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 6),
            mapView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -6),
            mapView.heightAnchor.constraint(equalToConstant: 230),
            
            shopImage.topAnchor.constraint(equalTo: mapView.bottomAnchor, constant: 18),
            shopImage.widthAnchor.constraint(equalToConstant: 120),
            shopImage.heightAnchor.constraint(equalToConstant: 120),
            shopImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
         
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
        addShopButton.action = addShopButtonClicked
        
        mapView.layer.cornerRadius = 20
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(imageClicked))
        
        shopImage.image = .iconAddImage
        shopImage.tintColor = .lightGray
        shopImage.contentMode = .scaleAspectFit
        shopImage.layer.masksToBounds = true
        shopImage.layer.cornerRadius = 10
        shopImage.isUserInteractionEnabled = true
        shopImage.addGestureRecognizer(tapGesture)
    }
    
    
    private func addShopButtonClicked() {
        viewModel.shopAddingControl(
            shopImage: shopImage.image,
            name: nameTextField.text,
            coordinate: mapView.selectedCoordinate,
            completion: navController?.addShopsToShops
        )
    }
    
    
    @objc private func imageClicked() {
        super.openImagePicker()
    }
    
    
    override func onImageSelected(image: UIImage) {
        shopImage.image = image
    }
}
