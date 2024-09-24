//
//  CorAddShopController.swift
//  Ecommerce
//
//  Created by muhammed dursun on 8.09.2024.
//

import MapKit


class CorAddShopController: Controller<CorAddShopViewModel, CorShopsNavigationController>, MKMapViewDelegate {
    
    private let nameTextField = TextFieldLayout()
    private let addShopButton = ButtonSecondary()
    private let mapView = MKMapView()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Add Shop"
        mapView.delegate = self
        
        addSubviews(nameTextField, addShopButton, mapView)
        
        mapView.translatesAutoresizingMaskIntoConstraints = false
        
        activateConstraints(
            mapView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            mapView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 10),
            mapView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -10),
            mapView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            mapView.heightAnchor.constraint(equalToConstant: 300),
            
            nameTextField.topAnchor.constraint(equalTo: mapView.bottomAnchor, constant: 20),
            nameTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            addShopButton.topAnchor.constraint(equalTo: nameTextField.bottomAnchor, constant: 20),
            addShopButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        )
         
        viewModel.fetchLocation(listener: locationReceived)
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(mapViewTapped(_:)))
        mapView.addGestureRecognizer(tapGesture)
    }
    
    
    private func locationReceived(coordinate: Coordinate) {
        let region = createRegion(for: coordinate)
        mapView.setRegion(region, animated: true)
        
        let annotation = MKPointAnnotation()
        annotation.coordinate = CLLocationCoordinate2D(latitude: (coordinate.latitude ?? 0.0), longitude: (coordinate.longitude ?? 0.0))
        annotation.title = "Current Location"
        
        mapView.addAnnotation(annotation)
    }
    
    
    func createRegion(for coordinate: Coordinate) -> MKCoordinateRegion {
        return MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: coordinate.latitude!, longitude: coordinate.longitude!), latitudinalMeters: 1000, longitudinalMeters: 1000)
    }
    
    
    @objc private func mapViewTapped(_ gesture: UITapGestureRecognizer) {
        let location = gesture.location(in: mapView)
        let coordinate = mapView.convert(location, toCoordinateFrom: mapView)
        
        if let previousAnnotation = mapView.annotations.first {
            mapView.removeAnnotation(previousAnnotation)
        }
        
        let annotation = MKPointAnnotation()
        annotation.coordinate = coordinate
        annotation.title = "Selected Location"
        mapView.addAnnotation(annotation)
        
        viewModel.updateCoordinate(for: Coordinate(latitude: coordinate.latitude, longitude: coordinate.longitude))
    }
    
    
    override func customizeViews() {
        nameTextField.placeholder = "Name"
        
        addShopButton.setTitle("Add Shop", for: .normal)
        addShopButton.action = addShopButtonClicked
    }
    
    
    private func addShopButtonClicked() {
        guard
            let name = nameTextField.text,
            let shopLocation = viewModel.selectedCoordinate
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
