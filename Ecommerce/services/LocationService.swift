//
//  LocationService.swift
//  Ecommerce
//
//  Created by Nejat Boy on 19.09.2024.
//

import UIKit
import CoreLocation


class LocationService: NSObject, CLLocationManagerDelegate {
    
    static let instance = LocationService()
    private var locationManager: CLLocationManager?
    private var locationReceived: Callback<Coordinate>?
    
    
    private override init() { }
    
    
    /// Kullanıcın konumunu bir kez almak için çağırmamız yeterlidir.
    ///
    /// - Parameters:
    ///   - listener: Kullanıcı konumu başarılı şekilde alındığında tetiklenir ve konum alma durdurulur.
    func request(listener: Callback<Coordinate>?) {
        let manager = CLLocationManager()
        manager.delegate = self
        manager.requestWhenInUseAuthorization()
        
        locationReceived = listener
        locationManager = manager
    }
    
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        if #available(iOS 14.0, *) {
            receivedPermission(status: manager.authorizationStatus)
        }
    }
    
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        receivedPermission(status: status)
    }
    
    
    private func receivedPermission(status: CLAuthorizationStatus) {
        guard status != .notDetermined else {
            return
        }
        
        if status == .authorizedWhenInUse {
            locationManager?.startUpdatingLocation()
            return
        }
        
        let cancelAction = AlertModel(title: "Cancel")
        let againAction = AlertModel(title: "Settings", action: goToSettings)
        
        AlertView.instance.show(
            type: .warning,
            message: "Location cannot get.",
            actions: [cancelAction, againAction]
        )
    }
    
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.first else {
            return
        }
        
        manager.stopUpdatingLocation()
        locationManager = nil
        
        let coordinate = Coordinate(latitude: location.coordinate.latitude, longitude: location.coordinate.longitude)
        locationReceived?(coordinate)
    }
    
    
    private func goToSettings() {
        guard
            let settingsUrl = URL(string: UIApplication.openSettingsURLString),
            UIApplication.shared.canOpenURL(settingsUrl)
        else {
            return
        }

        UIApplication.shared.open(settingsUrl, options: [:]) { _ in
            exit(0)
        }
    }
}

