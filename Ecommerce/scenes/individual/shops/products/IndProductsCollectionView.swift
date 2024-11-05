//
//  IndProductsCollectionView.swift
//  Ecommerce
//
//  Created by muhammed dursun on 5.11.2024.
//


class IndProductsCollectionView: CollectionView<Product, IndProductCollectionViewCell, IndProductCollectionViewFlowLayout> {
    
}


class IndProductCollectionViewCell: CollectionViewCell<Product> {
    
    private let productName = Label()
    private let priceLabel = Label()
    private let productImage = ImageView()
    
    
    override func configure() {
        backgroundColor = .clear
        layer.cornerRadius = 8
        
        contentView.addSubview(productName)
        contentView.addSubview(priceLabel)
        contentView.addSubview(productImage)
        
        activateConstraints(
            productImage.topAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.topAnchor, constant: 5),
            productImage.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            
            productName.topAnchor.constraint(equalTo: productImage.bottomAnchor, constant: 15),
            productName.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
        
            priceLabel.topAnchor.constraint(equalTo: productName.bottomAnchor, constant: 15),
            priceLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor)
        )
        
        productImage.set(cornerRadius: 60)
        productImage.clipsToBounds = true
    }
    
    
    override func setItem(item: Product) {
        productImage.load(photoUrl: item.imageUrl)
        
        productName.text = item.name
    
        priceLabel.text = String(item.price ?? 0)
    }
}


class IndProductCollectionViewFlowLayout: CollectionViewFlowLayout {
    
    
    override var margin: Int {
        10
    }
    
    
    override var numberOfColumn: Int {
        3
    }
    
    
    override var itemHeightMultiplier: Double {
        1.75
    }
}
