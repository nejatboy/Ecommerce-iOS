//
//  CorProductsTableView.swift
//  Ecommerce
//
//  Created by muhammed dursun on 28.09.2024.
//


class CorProductsTableView: TableView<Product, CorProductsCell> {
    
    
    override func configure() {
    
    }
}


class CorProductsCell: TableViewCell<Product> {
    
    private let productName = Label()
    private let productPrice = Label()
    private let productImage = ImageView()
    
    
    override func configure() {
        selectionBackgroundColor = .lightGray
        backgroundColor = .clear
        
        productName.textColor = .systemOrange
        productPrice.textColor = .systemBlue
        
        addSubviews(productImage,productName, productPrice)
        
        activateConstraints(
            productImage.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 3),
            productImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 3),
            productImage.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 3),
            productImage.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 3),
            
            productName.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 3),
            productName.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            
            productPrice.topAnchor.constraint(equalTo: productName.bottomAnchor, constant: 3),
            productPrice.leadingAnchor.constraint(equalTo: productName.leadingAnchor, constant: 0),
            productPrice.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 6),
            
            contentView.bottomAnchor.constraint(equalTo: productImage.bottomAnchor, constant: 100)
        )
    }
    
    
    override func setItem(_ item: Product) {
       // productImage.image = item.imageUrl
        productName.text = item.name
        if let price = item.price {
            productPrice.text = String(format: "%.2f", price)
        } else {
            productPrice.text = "Ürün fiyatı girilmemiş."
        }
    }
}
