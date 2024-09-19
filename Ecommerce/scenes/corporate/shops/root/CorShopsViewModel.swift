//
//  CorShopsViewModel.swift
//  Ecommerce
//
//  Created by Nejat Boy on 7.09.2024.
//


class CorShopsViewModel: ViewModel {
    
    
    func fetchMyShops(completion: Callback<[Shop]?>?) {
        DatabaseService.instance.getMyShops { shops in
            completion?(shops)
        }
    }
}
