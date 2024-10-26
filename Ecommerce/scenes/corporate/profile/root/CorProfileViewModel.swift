//
//  CorProfileViewModel.swift
//  Ecommerce
//
//  Created by Nejat Boy on 7.09.2024.
//


class CorProfileViewModel: ViewModel {
    
    func logOut(completion: Handler?) {
        showLoading()
        AuthService.instance.logOut {
            completion?()
        }
        self.hideLoading()
    }
    
    
    func fetchUserInfos(completion: Callback<User>?) {
        guard let user = UserDefaultsService.instance.currentUser else {
            return
        }
        completion?(user)
    }
}
