//
//  ViewController.swift
//  Ecommerce
//
//  Created by Nejat Boy on 28.07.2024.
//

import UIKit



//MARK: Controller
class Controller<VM: ViewModel, NC: NavigationController>: UIViewController {
    
    lazy var viewModel = VM()
    private var navigationBarClicked: Handler?
    
    
    override func loadView() {
        super.loadView()
        
        view.backgroundColor = UIColor(named: "snow")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        customizeViews()
    }
    
    
    ///navigationController yerine özelleştirilmiş olan navController kullanacağız.
    var navController: NC? {
        navigationController as? NC
    }
    
    
    ///Sayfadaki view'ları özelleştireceksek. Override edip içerisinde yapabiliriz.
    func customizeViews() {
        
    }
    
    
    /// Dizi haline controller'da eklemek istediğimiz view'ları verebiliriz.
    func addSubviews(_ subview: UIView...) {
        subview.forEach {
            view.addSubview($0)
        }
    }
    
    /// Aktif etmek istediğimiz constraint'leri dizi halince verebiliriz.
    func activateConstraints(_ constraints: NSLayoutConstraint...) {
        NSLayoutConstraint.activate(constraints)
    }
    
    
    ///Navigation Bar'ın sağına button eklemek için kullanırız.
    func setNavButton(icon: UIImage?, onClicked: Handler?) {
        navigationBarClicked = onClicked
        navigationItem.rightBarButtonItem = .init(image: icon, style: .done, target: self, action: #selector(navButtonClicked))
    }
    
    
    @objc private func navButtonClicked() {
        navigationBarClicked?()
    }
}



//MARK: ControllerHasImagePicker
class ControllerHasImagePicker<VM: ViewModel, NC: NavigationController>: Controller<VM, NC>, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    
    func openImagePicker() {
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.allowsEditing = true
        imagePicker.sourceType = .photoLibrary
        
        present(imagePicker, animated: true)
    }
    
    
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        picker.dismiss(animated: true)
        
        if let image = info[.editedImage] as? UIImage {
            onImageSelected(image: image)
        }
    }
    
    
    ///Seçilen image'i handle etmek için override ederiz.
    func onImageSelected(image: UIImage) {}
}
