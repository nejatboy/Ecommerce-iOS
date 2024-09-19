//
//  CorAddShopViewModel.swift
//  Ecommerce
//
//  Created by Nejat Boy on 8.09.2024.
//

import MapKit


class CorAddShopViewModel: ViewModel {
    
    private(set) var selectedCoordinate : CLLocationCoordinate2D?
    
    
    func addShop(name: String, latitude: Double, longitude: Double, completion: Handler?) {
        let shop = Shop(name: name, latitude: latitude, longitude: longitude)
        DatabaseService.instance.addShop(shop: shop, completion: completion)
    }
    
    
    func updateCoordinate(for location: CLLocation) {
        selectedCoordinate = location.coordinate
    }
    
    
    func createRegion() -> MKCoordinateRegion? {
        guard let coordinate = selectedCoordinate else {
            return nil
        }
        return MKCoordinateRegion(center: coordinate, latitudinalMeters: 1000, longitudinalMeters: 1000)
    }
}
