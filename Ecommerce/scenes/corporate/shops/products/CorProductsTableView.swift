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
        
        productName.textColor = .black
        productPrice.textColor = .gray
        
        addSubviews(productImage, productName, productPrice)
        
        activateConstraints(
            productImage.topAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.topAnchor, constant: 2),
            productImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 3),
            
            productName.topAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.topAnchor, constant: 2),
            productName.leadingAnchor.constraint(equalTo: productImage.trailingAnchor, constant: 5),
            
            productPrice.topAnchor.constraint(equalTo: productName.bottomAnchor, constant: 3),
            productPrice.leadingAnchor.constraint(equalTo: productName.leadingAnchor, constant: 0),
            
            contentView.bottomAnchor.constraint(equalTo: productPrice.bottomAnchor, constant: 10)
        )
        
        productImage.set(cornerRadius: 25)
        productImage.clipsToBounds = true
    }
    
    
    override func setItem(_ item: Product) {
        productImage.load(photoUrl: item.imageUrl)
        productName.text = item.name
        productPrice.text = String(item.price ?? 0.0)
    }
}
