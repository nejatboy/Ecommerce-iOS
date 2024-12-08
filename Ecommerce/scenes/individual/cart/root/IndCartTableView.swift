//
//  IndCartTableView.swift
//  Ecommerce
//
//  Created by muhammed dursun on 20.11.2024.
//


class IndCartTableView: TableView<Product, IndCartTableViewCell> {
   
    
    override func configure() {
    
    }
    
}


class IndCartTableViewCell: TableViewCell<Product> {
    
    let productNameLabel = Label()
    let productPriceLabel = Label()
    let productImageView = ImageView()
    let numberOfProductsNumberPicker = NumberPickerField()

    var onPriceChanged: Callback<Product>?
    
    
    override func configure() {
        selectionBackgroundColor = .lightGray
        backgroundColor = .white
        
        productPriceLabel.textColor = .lightGray
        productPriceLabel.font = .setDynamicFont(size: 20)
        
        productNameLabel.font = .setDynamicFont(size: 20)
        
        numberOfProductsNumberPicker.font = .setDynamicFont(size: 20)
        
        productImageView.contentMode = .scaleAspectFill
        productImageView.clipsToBounds = true
        productImageView.layer.cornerRadius = 10
        
        numberOfProductsNumberPicker.setItems(items: [1, 2, 3, 4, 5])
        numberOfProductsNumberPicker.onItemSelect = onItemNumberSelected
        
        addSubviews(productNameLabel, productPriceLabel, productImageView, numberOfProductsNumberPicker)
        
        activateConstraints(
            productImageView.topAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.topAnchor, constant: 4),
            productImageView.leadingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.leadingAnchor, constant: 10),
            productImageView.widthAnchor.constraint(equalToConstant: 80),
            productImageView.heightAnchor.constraint(equalToConstant: 80),
            
            productNameLabel.topAnchor.constraint(equalTo: productImageView.topAnchor, constant: 6),
            productNameLabel.leadingAnchor.constraint(equalTo: productImageView.trailingAnchor, constant: 8),
            
            numberOfProductsNumberPicker.topAnchor.constraint(equalTo: productNameLabel.bottomAnchor, constant: 10),
            numberOfProductsNumberPicker.leadingAnchor.constraint(equalTo: productNameLabel.leadingAnchor),
            
            productPriceLabel.bottomAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.bottomAnchor, constant: -6),
            productPriceLabel.trailingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.trailingAnchor, constant: -10),
            
            contentView.bottomAnchor.constraint(equalTo: numberOfProductsNumberPicker.bottomAnchor, constant: 10)
        )
    }
    
    
    override func setItem(_ item: Product) {
        productImageView.load(photoUrl: item.imageUrl)
        productNameLabel.text = item.name
        productPriceLabel.text = String(item.price ?? 0.0)

        numberOfProductsNumberPicker.text = "\(item.quantity ?? 1)"
    }
    
    
    private func onItemNumberSelected(number: Int) {
        guard var item = item else { return }
        item.quantity = number
        
        let productEndPrice = (item.price ?? 0.0) * Double(number)
        productPriceLabel.text = String(productEndPrice)
        
        onPriceChanged?(item)
    }
}
