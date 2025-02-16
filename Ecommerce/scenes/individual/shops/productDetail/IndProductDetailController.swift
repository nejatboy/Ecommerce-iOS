//
//  IndProductDetailController.swift
//  Ecommerce
//
//  Created by Nejat Boy on 8.12.2024.
//

class IndProductDetail: Controller<IndProductDetailViewModel, IndShopsNavigationController> {
    
    private let productImageView = ImageView()
    private let productNameLabel = Label()
    private let productDescriptionLabel = Label()
    private let numberOfProductsNumberPicker = NumberPickerField()
    private let priceButton = ButtonPrimary()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Product Detail"
        
        addSubviews(productImageView, productNameLabel, productDescriptionLabel, numberOfProductsNumberPicker, priceButton)
        
        activateConstraints(
            productImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 18),
            productImageView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 60),
            productImageView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -60),
            productImageView.heightAnchor.constraint(equalToConstant: 260),
            
            productNameLabel.topAnchor.constraint(equalTo: productImageView.bottomAnchor, constant: 6),
            productNameLabel.leadingAnchor.constraint(equalTo: productImageView.leadingAnchor, constant: 130),
            productNameLabel.trailingAnchor.constraint(equalTo: productImageView.trailingAnchor, constant: -130),
            
            numberOfProductsNumberPicker.topAnchor.constraint(equalTo: productNameLabel.bottomAnchor, constant: 6),
            numberOfProductsNumberPicker.centerXAnchor.constraint(equalTo: productNameLabel.centerXAnchor),
            
            productDescriptionLabel.topAnchor.constraint(equalTo: numberOfProductsNumberPicker.bottomAnchor, constant: 6),
            productDescriptionLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 6),
            productDescriptionLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -6),
            
            priceButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -24),
            priceButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        )
    }
    
    override func customizeViews() {
        let totalPrice = viewModel.calculatePrice(quantity: 1)
        priceButton.setTitle(totalPrice, for: .normal)
        priceButton.action = addProductToCart
        
        productImageView.tintColor = .lightGray
        productImageView.contentMode = .scaleAspectFill
        productImageView.clipsToBounds = true
        productImageView.layer.cornerRadius = 18
        productImageView.load(photoUrl: viewModel.selectedProduct?.imageUrl)
        
        productNameLabel.text = viewModel.selectedProduct?.name
        
        numberOfProductsNumberPicker.setItems(items: [1, 2, 3, 4, 5])
        numberOfProductsNumberPicker.onItemSelect = onItemNumberSelected
        
        productDescriptionLabel.text = viewModel.selectedProduct?.description
        productDescriptionLabel.textColor = .lightGray
        productDescriptionLabel.numberOfLines = 0
        productDescriptionLabel.textAlignment = .center
    }
    
    
    private func addProductToCart() {
        viewModel.addProductToCart(quantity: numberOfProductsNumberPicker.value, completion: navController?.productsDetailToCart)
    }
    
    
    private func onItemNumberSelected(number: Int) {
        let totalPrice = viewModel.calculatePrice(quantity: number)
        priceButton.setTitle(totalPrice, for: .normal)
    }
}
