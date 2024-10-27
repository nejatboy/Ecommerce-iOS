//
//  IndShopsViewModel.swift
//  Ecommerce
//
//  Created by Nejat Boy on 26.10.2024.
//

import CoreLocation


class IndShopsViewModel: ViewModel {
    
    /// MARK : KONUM OLARAK XCODE'DA Feature bölümünden simülatörün konumu Ankaranın enlem ve boylam değerleri girildi.
    func fetchShops(coordinate: Coordinate, completion: Callback<[Shop]?>?) {
        DatabaseService.instance.getShops(coordinate: coordinate) { shops in
            guard let shops = shops else {
                return
            }
          
            let userLocation = CLLocation(latitude: coordinate.latitude!, longitude: coordinate.longitude!)
            
            let maxDistance: CLLocationDistance = 900 * 100
            
            let nearbyShops = shops.filter { shop in
                let shopLocation = CLLocation(latitude: shop.latitude!, longitude: shop.longitude!)
                return userLocation.distance(from: shopLocation) <= maxDistance
            }
            completion?(nearbyShops)
        }
    }
    
    
    func fetchLocation(listener: Callback<Coordinate>?) {
        LocationService.instance.request(listener: listener)
    }
}
