//
//  ViewController.swift
//  Ecommerce
//
//  Created by Nejat Boy on 28.07.2024.
//

import UIKit


class Controller<VM: ViewModel>: UIViewController {
    
    lazy var viewModel = VM()
    
    
    override func loadView() {
        super.loadView()
        
        view.backgroundColor = UIColor(named: "snow")
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
