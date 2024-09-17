//
//  CorShopsViewModel.swift
//  Ecommerce
//
//  Created by Nejat Boy on 7.09.2024.
//


class CorShopsViewModel: ViewModel {
    
    private var items = [Shop]()
    
    func fetchMyShops(completion: Callback<[Shop]?>?) {
        DatabaseService.instance.getMyShops { shops in
            self.items = shops!
            completion?(self.items)
        }
    }
}
