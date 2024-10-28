//
//  IndShopsViewModel.swift
//  Ecommerce
//
//  Created by Nejat Boy on 26.10.2024.
//

import CoreLocation


class IndShopsViewModel: ViewModel {
    
    
    func fetchLocation(listener: Callback<Coordinate>?) {
        LocationService.instance.request(listener: listener)
    }
    
    
    func fetchShops(coordinate: Coordinate, completion: Callback<[Shop]?>?) {
        DatabaseService.instance.getShops(coordinate: coordinate) { shops in
            guard let shops = shops else {
                return
            }
            completion?(shops)
        }
    }
}
