//
//  IndCartTableView.swift
//  Ecommerce
//
//  Created by muhammed dursun on 20.11.2024.
//

import UIKit

struct ExampleModel {
    let name: String?
}

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
        backgroundColor = .gray
        
     /*   productName.textColor = .yellow
        productPrice.textColor = .orange
        sameNumberOfProductsLabel.backgroundColor = .green
        productName.backgroundColor = .purple */
        
        addSubviews(productName, productPrice, productImage, sameNumberOfProductsLabel)
        
        activateConstraints(
            productImage.topAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.topAnchor, constant: 3),
            productImage.leadingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.leadingAnchor, constant: 12),
            productImage.trailingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.trailingAnchor, constant: -285),
            productImage.heightAnchor.constraint(equalTo: productImage.widthAnchor),
            
            productName.topAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.topAnchor, constant: 6),
            productName.leadingAnchor.constraint(equalTo: productImage.trailingAnchor, constant: 8), // Daha sonra yüklenecek olan image'in sağına yerleştirilecek.
            productName.trailingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.trailingAnchor, constant: -10),
            productName.bottomAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.bottomAnchor, constant: -110),
            
            sameNumberOfProductsLabel.topAnchor.constraint(equalTo: productName.bottomAnchor, constant: 5),
            sameNumberOfProductsLabel.leadingAnchor.constraint(equalTo: productImage.trailingAnchor, constant: 8),
            sameNumberOfProductsLabel.trailingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.trailingAnchor, constant: -240),
            sameNumberOfProductsLabel.bottomAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.bottomAnchor, constant: -77),
            
            productPrice.bottomAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.bottomAnchor, constant: -3),
            productPrice.trailingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.trailingAnchor, constant: -15),
            contentView.bottomAnchor.constraint(equalTo: productImage.bottomAnchor, constant: 10)
        )
        
        productImage.layer.cornerRadius = 30
        productImage.clipsToBounds = true
    }
    
    
    override func setItem(_ item: Product) {
        productImage.load(photoUrl: item.imageUrl)
        productName.text = item.name
        productPrice.text = String(item.price ?? 0.0)
        sameNumberOfProductsLabel.text = "0"
    }
}
