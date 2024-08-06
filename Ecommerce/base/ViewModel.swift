//
//  ViewModel.swift
//  Ecommerce
//
//  Created by Nejat Boy on 28.07.2024.
//


class ViewModel {
    
    required init() {
        
    }
    
    
    /// Loading göstermek için kullanırız
    func showLoading() {
        LoadingView.instance.show()
    }
    
    
    /// Loading gizlemek için kullanırız
    func hideLoading() {
        LoadingView.instance.hide()
    }
}
