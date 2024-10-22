//
//  CorProfileViewModel.swift
//  Ecommerce
//
//  Created by Nejat Boy on 7.09.2024.
//

import FirebaseAuth

class CorProfileViewModel: ViewModel {
    
    func fetchUserInfos(completion: Callback<User>?) {
        guard let uid = UserDefaultsService.instance.currentUser?.uid else {
            return
        }
                
        DatabaseService.instance.fetchUser(uid: uid, completion: completion)
    }
}
