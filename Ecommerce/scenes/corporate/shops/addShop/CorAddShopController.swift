//
//  CorAddShopController.swift
//  Ecommerce
//
//  Created by muhammed dursun on 8.09.2024.
//



class CorAddShopController: Controller<CorAddShopViewModel, CorShopsNavigationController> {
    
    private let nameTextField = TextFieldLayout()
    private let addShopButton = ButtonSecondary()
    private let mapView = MapView()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Add Shop"
        
        addSubviews(nameTextField, addShopButton, mapView)
        
        activateConstraints(
            mapView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            mapView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 10),
            mapView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -10),
            mapView.heightAnchor.constraint(equalToConstant: 300),
            
            nameTextField.topAnchor.constraint(equalTo: mapView.bottomAnchor, constant: 20),
            nameTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            addShopButton.topAnchor.constraint(equalTo: nameTextField.bottomAnchor, constant: 20),
            addShopButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        )
        
        viewModel.fetchLocation(listener: locationReceived)
    }
    
    
    private func locationReceived(coordinate: Coordinate) {
        mapView.setRegion(coordinate: coordinate, meters: 1000, animated: true)
    }
    
    
    override func customizeViews() {
        nameTextField.placeholder = "Name"
        
        addShopButton.setTitle("Add Shop", for: .normal)
        addShopButton.action = addShopButtonClicked
    }
    
    
    private func addShopButtonClicked() {
        guard
            let name = nameTextField.text,
            let shopLocation = mapView.selectedCoordinate
        else {
            return
        }
        
        showLoading()
        
        viewModel.addShop(name: name, latitude: shopLocation.latitude, longitude: shopLocation.longitude) {
            self.show(message: "Shop added succesfully", type: .success)
            self.navController?.addShopsToShops()
        }
    }
}
