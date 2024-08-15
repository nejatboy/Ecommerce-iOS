//
//  RegisterViewModel.swift
//  Ecommerce
//
//  Created by muhammed dursun on 9.08.2024.
//

import Foundation
import FirebaseFirestore

class RegisterViewModel: ViewModel {
    
    
    var email : String
    var password : String
    var againPassword : String
    var name : String
    var surName : String
   
   
    init(email:String,password:String,againPassword:String,name:String,surName:String){
        self.email = email
        self.password = password
        self.againPassword = againPassword
        self.name = name
        self.surName = surName
    }
    
    required init() {
        fatalError("init() has not been implemented")
    }
    
    func getService(completion:@escaping(Bool)->Void){
        AuthService.instance.registerUser(email: email, password: password) { uid in
            let databaseData : [String:Any] = [
                "email" : self.email,
                "name" : self.name,
                "surName" : self.surName
            ]
            
            Firestore.firestore().collection("users").document(uid).setData(databaseData) { error in
                if let error = error{
                    completion(false)
                } else {
                    completion(true)
                }
            }
        }
    }
}
