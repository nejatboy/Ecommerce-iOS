//
//  ViewModel.swift
//  Ecommerce
//
//  Created by Nejat Boy on 28.07.2024.
//


class ViewModel {
    
    required init() {
        
    }
    
    
    /// Kullanıcıya mesaj göstermek için kullanılırız
    ///
    /// - Parameters:
    ///   - message: Gösterilecek olan mesaj.
    ///   - type: Başarılı / Hata / Uyarı mesaj tipleridir.
    func show(message: String?, type: AlertType) {
        let okAction = AlertModel(title: "Okay")
        AlertView.instance.show(type: type, message: message, actions: [okAction])
    }
    
    
    /// Loading göstermek için kullanırız.
    func showLoading() {
        LoadingView.instance.show()
    }
    
    
    /// Loading gizlemek için kullanırız.
    func hideLoading() {
        LoadingView.instance.hide()
    }
    
    
    /// Kullanıcıya alert göstermek için kullanılırız.
    ///
    /// - Parameters:
    ///   - message: Gösterilecek olan mesaj.
    ///   - type: Başarılı / Hata / Uyarı mesaj tipleridir.
    ///   - actions: Tıklanma işlemleri
    func showAlert(type: AlertType, message: String?, actions: [AlertModel]) {
        AlertView.instance.show(type: type, message: message, actions: actions)
    }
}
