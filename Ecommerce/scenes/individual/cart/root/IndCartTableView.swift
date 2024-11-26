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
    let sameNumberOfProductsLabel = Label()
    
    
    override func configure() {
        selectionBackgroundColor = .lightGray
        backgroundColor = .white
        
        productPriceLabel.textColor = .lightGray
        productPriceLabel.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
        
        productNameLabel.font = UIFont.boldSystemFont(ofSize: 20)
        
        sameNumberOfProductsLabel.font = UIFont.boldSystemFont(ofSize: 20)
        
        productImageView.contentMode = .scaleAspectFill
        productImageView.clipsToBounds = true
        productImageView.layer.cornerRadius = 10
        
        addSubviews(productNameLabel, productPriceLabel, productImageView, sameNumberOfProductsLabel)
        
        activateConstraints(
            productImageView.topAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.topAnchor, constant: 4),
            productImageView.leadingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.leadingAnchor, constant: 10),
            productImageView.widthAnchor.constraint(equalToConstant: 76),
            productImageView.heightAnchor.constraint(equalToConstant: 100),
            
            productNameLabel.topAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.topAnchor, constant: 6),
            productNameLabel.leadingAnchor.constraint(equalTo: productImageView.trailingAnchor, constant: 8),
            
            sameNumberOfProductsLabel.topAnchor.constraint(equalTo: productNameLabel.bottomAnchor, constant: 10),
            sameNumberOfProductsLabel.leadingAnchor.constraint(equalTo: productImageView.trailingAnchor, constant: 8),
            
            productPriceLabel.bottomAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.bottomAnchor, constant: -6),
            productPriceLabel.trailingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.trailingAnchor, constant: -10),
            contentView.bottomAnchor.constraint(equalTo: productImageView.bottomAnchor, constant: 10)
        )
    }
    
    
    override func setItem(_ item: Product) {
        productImageView.load(photoUrl: item.imageUrl)
        productNameLabel.text = item.name
        productPriceLabel.text = String(item.price ?? 0.0)
        sameNumberOfProductsLabel.text = "0 adet"
    }
}
