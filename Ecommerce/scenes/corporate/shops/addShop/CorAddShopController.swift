//
//  CorAddShopController.swift
//  Ecommerce
//
//  Created by muhammed dursun on 8.09.2024.
//

import MapKit


class CorAddShopController: Controller<CorAddShopViewModel, CorShopsNavigationController>, CLLocationManagerDelegate, MKMapViewDelegate {
    
    private let nameTextField = TextFieldLayout()
    private let addShopButton = ButtonSecondary()
    private let mapView = MKMapView()
    private let locationManager = CLLocationManager()
    private var selectedCoordinate: CLLocationCoordinate2D?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Add Shop"
        mapView.delegate = self
        
        addSubviews(nameTextField,addShopButton,mapView)
        
        activateConstraints(
            mapView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,constant: 20),
            mapView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            mapView.heightAnchor.constraint(equalToConstant: 300),
            mapView.widthAnchor.constraint(equalToConstant: Device.width * 0.8),
            
            nameTextField.topAnchor.constraint(equalTo: mapView.bottomAnchor, constant: 20),
            nameTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            addShopButton.topAnchor.constraint(equalTo: nameTextField.bottomAnchor, constant: 20),
            addShopButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        )
        
        setUpMapView()
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(mapViewTapped(_:)))
        mapView.addGestureRecognizer(tapGesture)
    }
    
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        mapView.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: 300)
    }
    
    
    private func setUpMapView() {
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        mapView.showsUserLocation = true
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
        
        selectedCoordinate = coordinate
       }
    
    
    override func customizeViews() {
        nameTextField.placeholder = "Name"
        
        addShopButton.setTitle("Add Shop", for: .normal)
        addShopButton.action = addShopButtonClicked
    }
    
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
          guard let location = locations.last else { return }
          let coordinate = location.coordinate
          let region = MKCoordinateRegion(center: coordinate, latitudinalMeters: 1000, longitudinalMeters: 1000)
          mapView.setRegion(region, animated: true)
      }
    
        
    private func addShopButtonClicked() {
        guard
            let name = nameTextField.text,
            let shopLocation = selectedCoordinate
        else {
            return
        }
        
        showLoading()
        
        viewModel.addShop(name: name, latitude: shopLocation.latitude, longitude: shopLocation.longitude) {
            self.show(message: "Shop added succesfully", type: .success)
        }
    }
}
