//
//  IndCartTableView.swift
//  Ecommerce
//
//  Created by muhammed dursun on 20.11.2024.
//

import UIKit


class IndCartTableView: TableView<Product, IndCartTableViewCell> {
   
    
    override func configure() {
    
    }
    
}


class IndCartTableViewCell: TableViewCell<Product> {
    
    let productNameLabel = Label()
    let productPriceLabel = Label()
    let productImageView = ImageView()
    let numberOfProductsNumberPicker = NumberPickerField()
    
    var product: Product?
    var onPriceChanged: Callback<Product>?
    
    override func configure() {
        selectionBackgroundColor = .lightGray
        backgroundColor = .white
        
        productPriceLabel.textColor = .lightGray
        productPriceLabel.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
        
        productNameLabel.font = UIFont.boldSystemFont(ofSize: 20)
        
        numberOfProductsNumberPicker.font = UIFont.boldSystemFont(ofSize: 20)
        
        productImageView.contentMode = .scaleAspectFill
        productImageView.clipsToBounds = true
        productImageView.layer.cornerRadius = 10
        
        addSubviews(productNameLabel, productPriceLabel, productImageView, numberOfProductsNumberPicker)
        
        activateConstraints(
            productImageView.topAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.topAnchor, constant: 4),
            productImageView.leadingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.leadingAnchor, constant: 10),
            productImageView.widthAnchor.constraint(equalToConstant: 76),
            productImageView.heightAnchor.constraint(equalToConstant: 100),
            
            productNameLabel.topAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.topAnchor, constant: 6),
            productNameLabel.leadingAnchor.constraint(equalTo: productImageView.trailingAnchor, constant: 8),
            
            numberOfProductsNumberPicker.topAnchor.constraint(equalTo: productNameLabel.bottomAnchor, constant: 10),
            numberOfProductsNumberPicker.leadingAnchor.constraint(equalTo: productImageView.trailingAnchor, constant: 8),
            
            productPriceLabel.bottomAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.bottomAnchor, constant: -6),
            productPriceLabel.trailingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.trailingAnchor, constant: -10),
            contentView.bottomAnchor.constraint(equalTo: productImageView.bottomAnchor, constant: 10)
        )
        
        numberOfProductsNumberPicker.setItems(items: [1, 2, 3, 4, 5])
        numberOfProductsNumberPicker.onItemSelect = onItemNumberSelected
    }
    
    
    override func setItem(_ item: Product) {
        self.product = item
        productImageView.load(photoUrl: item.imageUrl)
        productNameLabel.text = item.name
        productPriceLabel.text = String(item.price ?? 0.0)

        numberOfProductsNumberPicker.text = "\(item.quantity ?? 1)"
    }
    
    
    private func onItemNumberSelected(number: Int) {
        print(number)
        
        guard var product = product else { return }
        product.quantity = number
        
        let productEndPrice = (product.price ?? 0.0) * Double(number)
        productPriceLabel.text = String(productEndPrice)
        
        onPriceChanged?(product)
    }
}
