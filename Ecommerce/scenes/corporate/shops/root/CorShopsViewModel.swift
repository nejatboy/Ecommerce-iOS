//
//  CorShopsViewModel.swift
//  Ecommerce
//
//  Created by Nejat Boy on 7.09.2024.
//


class CorShopsViewModel: ViewModel {
    
   
    func fetchMyShops(completion: Callback<[Shop]>?) {
        DatabaseService.instance.getMyShops { shops in
            guard let shops = shops else {
                return
            }
            completion?(shops)
        }
    }
    
    
    func deleteMyShop(shopUid: String?, completion: Handler?) {
        guard let shopUid = shopUid else {
            return
        }
        
        let noAction = AlertModel(title: "No")
        
        let yesAction = AlertModel(title: "Yes") {
            self.showLoading()
            
            DatabaseService.instance.deleteShop(shopUid: shopUid) {
                self.hideLoading()
                completion?()
            }
        }
        
        showAlert(type: .warning, message: "Do you want to delete the shop?", actions: [noAction, yesAction])
    }
}
