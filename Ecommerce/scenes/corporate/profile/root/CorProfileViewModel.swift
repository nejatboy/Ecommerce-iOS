//
//  CorProfileViewModel.swift
//  Ecommerce
//
//  Created by Nejat Boy on 7.09.2024.
//


class CorProfileViewModel: ViewModel {
    
    func logOut(completion: Handler?) {
        let notLeaveAction = AlertModel(title: "No")
        
        let leaveAction = AlertModel(title: "Yes") {
            self.showLoading()
            AuthService.instance.logOut {
                self.hideLoading()
                completion?()
            }
        }
        
        showAlert(type: .warning, message: "Do you want to go out?", actions: [leaveAction,notLeaveAction])
    }
    
    
    func fetchUserInfos(completion: Callback<User>?) {
        guard let user = UserDefaultsService.instance.currentUser else {
            return
        }
        completion?(user)
    }
}
