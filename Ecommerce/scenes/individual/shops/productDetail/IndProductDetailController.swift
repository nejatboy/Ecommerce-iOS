//
//  IndProductDetailController.swift
//  Ecommerce
//
//  Created by Nejat Boy on 8.12.2024.
//

class IndProductDetail: Controller<IndProductDetailViewModel, IndShopsNavigationController> {
    
    private let imageView = ImageView()
    private let name = Label()
    private let productDescription = Label()
    private let numberPicker = NumberPickerField()
    private let priceButton = ButtonPrimary()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Product Detail"
        
        addSubviews(imageView, name, productDescription, numberPicker, priceButton)
        
        numberPicker.setItems(items: [1, 2, 3, 4, 5])
        numberPicker.onItemSelect = onItemNumberSelected
        
        activateConstraints(
            imageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 18),
            imageView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 60),
            imageView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -60),
            imageView.heightAnchor.constraint(equalToConstant: 260),
            
            name.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 6),
            name.centerXAnchor.constraint(equalTo: imageView.centerXAnchor),
           
            numberPicker.topAnchor.constraint(equalTo: name.bottomAnchor, constant: 6),
            numberPicker.centerXAnchor.constraint(equalTo: name.centerXAnchor),
            
            productDescription.topAnchor.constraint(equalTo: numberPicker.bottomAnchor, constant: 6),
            productDescription.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 6),
            productDescription.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -6),
            
            priceButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -24),
            priceButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        )
    }
    
    override func customizeViews() {
        priceButton.setTitle("\(viewModel.selectedProduct?.price ?? 0) TL", for: .normal)
        priceButton.action = addProductToCart
        
        imageView.tintColor = .lightGray
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 18
        imageView.load(photoUrl: viewModel.selectedProduct?.imageUrl)
        
        name.text = viewModel.selectedProduct?.name
        numberPicker.text = "1"
        
        productDescription.text = viewModel.selectedProduct?.description
        productDescription.textColor = .lightGray
    }
    
    
    private func addProductToCart() {
        viewModel.productAddingControl(
            image: imageView.image,
            name: name.text,
            quantity: Int(numberPicker.text ?? "1"),
            description: productDescription.text, completion: navController?.productsDetailToCart
        )
    }
    
    
    private func onItemNumberSelected(number: Int) {
        numberPicker.text = "\(number)"
        priceButton.setTitle("\((viewModel.selectedProduct?.price ?? 0) * Double(number)) TL", for: .normal)
    }
}
