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
    
    let productName = Label()
    let productPrice = Label()
    let productImage = ImageView()
    let sameNumberOfProductsLabel = Label()
    
    
    override func configure() {
        selectionBackgroundColor = .lightGray
        backgroundColor = .white
        
        productPrice.textColor = .lightGray
        productPrice.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
        
        productName.font = UIFont.boldSystemFont(ofSize: 20)
        
        sameNumberOfProductsLabel.font = UIFont.boldSystemFont(ofSize: 20)
        
        productImage.contentMode = .scaleAspectFill
        productImage.clipsToBounds = true
        productImage.layer.cornerRadius = 10
        
        addSubviews(productName, productPrice, productImage, sameNumberOfProductsLabel)
        
        activateConstraints(
            productImage.topAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.topAnchor, constant: 4),
            productImage.leadingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.leadingAnchor, constant: 10),
            productImage.widthAnchor.constraint(equalToConstant: 76),
            productImage.heightAnchor.constraint(equalToConstant: 100),
            
            productName.topAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.topAnchor, constant: 6),
            productName.leadingAnchor.constraint(equalTo: productImage.trailingAnchor, constant: 8),
            
            sameNumberOfProductsLabel.topAnchor.constraint(equalTo: productName.bottomAnchor, constant: 10),
            sameNumberOfProductsLabel.leadingAnchor.constraint(equalTo: productImage.trailingAnchor, constant: 8),
            
            productPrice.bottomAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.bottomAnchor, constant: -6),
            productPrice.trailingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.trailingAnchor, constant: -10),
            contentView.bottomAnchor.constraint(equalTo: productImage.bottomAnchor, constant: 10)
        )
    }
    
    
    override func setItem(_ item: Product) {
        productImage.load(photoUrl: item.imageUrl)
        productName.text = item.name
        productPrice.text = String(item.price ?? 0.0)
        sameNumberOfProductsLabel.text = "0 adet"
    }
}
