//
//  IndCartTableView.swift
//  Ecommerce
//
//  Created by muhammed dursun on 20.11.2024.
//

struct ExampleModel {
    let name: String?
}

class IndCartTableView: TableView<ExampleModel, IndCartTableViewCell> {
   
    
    override func configure() {
        
    }
}


class IndCartTableViewCell: TableViewCell<ExampleModel> {
    
    let productName = Label()
    let productPrice = Label()
    let productImage = ImageView()
    let sameNumberOfProductsLabel = Label()
    
    
    override func configure() {
        selectionBackgroundColor = .lightGray
        backgroundColor = .gray
        
        productName.textColor = .red
        productPrice.textColor = .orange
        sameNumberOfProductsLabel.backgroundColor = .gray
        productName.backgroundColor = .purple
        
        addSubviews(productName, productPrice, productImage, sameNumberOfProductsLabel)
        
        activateConstraints(
            productImage.topAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.topAnchor, constant: 3),
            productImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 3),
            
            productName.topAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.topAnchor, constant: 18),
            productName.leadingAnchor.constraint(equalTo: productImage.trailingAnchor, constant: 8), // Daha sonra yüklenecek olan image'in sağına yerleştirilecek.
            
            sameNumberOfProductsLabel.topAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.topAnchor, constant: 18),
            sameNumberOfProductsLabel.leadingAnchor.constraint(equalTo: productName.trailingAnchor, constant: 28),
            
            productPrice.topAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.topAnchor, constant: 30),
            productPrice.leadingAnchor.constraint(equalTo: sameNumberOfProductsLabel.trailingAnchor, constant: 30),
            contentView.bottomAnchor.constraint(equalTo: productName.bottomAnchor, constant: 10)
        )
    }
    
    
    override func setItem(_ item: ExampleModel) {
     //   productImage.load(photoUrl: item.imageUrl)
        productName.text = item.name
     //   productPrice.text = String(item.price ?? 0.0)
        sameNumberOfProductsLabel.text = "0"
    }
}
