//
//  IndProfileViewModel.swift
//  Ecommerce
//
//  Created by Nejat Boy on 26.10.2024.
//

class IndProfileViewModel: ViewModel {
    
    func logOut(completion: Handler?) {
        showLoading()
        
        AuthService.instance.logOut {
            completion?()
        }
        
        hideLoading()
    }
    
    
    func fetchUserInfos(completion: Callback<User>?) {
        guard let user = UserDefaultsService.instance.currentUser else {
            return
        }
        completion?(user)
    }
}
