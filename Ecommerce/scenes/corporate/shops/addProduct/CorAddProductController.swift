//
//  CorAddProductController.swift
//  Ecommerce
//
//  Created by Nejat Boy on 28.09.2024.
//


class CorAddProductController: Controller<CorAddProductViewModel, CorShopsNavigationController> {
    
    private let productImage = ImageView()
    private let productName = TextFieldLayout()
    private let productPrice = TextFieldLayout()
    private let addProductButton = ButtonSecondary()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Add Product"
        
        addSubviews(productImage, productName, productPrice, addProductButton)
        
        activateConstraints(
            productImage.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 15),
            productImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            productName.topAnchor.constraint(equalTo: productImage.bottomAnchor, constant: 20),
            productName.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            productPrice.topAnchor.constraint(equalTo: productName.bottomAnchor, constant: 15),
            productPrice.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            addProductButton.topAnchor.constraint(equalTo: productPrice.bottomAnchor, constant: 25),
            addProductButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        )
        productImage.set(cornerRadius: 110)
        productImage.load(photoUrl: "https://static.ticimax.cloud/40901/uploads/urunresimleri/dogal-klasik-kangal-sucuk-400-gr-295114.jpg")
    }
    
    
    override func customizeViews() {
        productName.placeholder = "Product Name"
        
        productPrice.placeholder = "Product Price"
        
        addProductButton.setTitle("Add Product", for: .normal)
    }
}
