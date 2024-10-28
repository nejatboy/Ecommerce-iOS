//
//  IndProfileViewModel.swift
//  Ecommerce
//
//  Created by Nejat Boy on 26.10.2024.
//

class IndProfileViewModel: ViewModel {
    
    
    func logOut(completion: Handler?) {
        let noAction = AlertModel(title: "No")
        
        let yesAction = AlertModel(title: "Yes") {
            self.showLoading()
            AuthService.instance.logOut {
                self.hideLoading()
                completion?()
            }
        }
        
        showAlert(type: .warning, message: "Do you want to go out?", actions: [noAction, yesAction])
    }
    
    
    func fetchUserInfos(completion: Callback<User>?) {
        guard let user = UserDefaultsService.instance.currentUser else {
            return
        }
        completion?(user)
    }
}
