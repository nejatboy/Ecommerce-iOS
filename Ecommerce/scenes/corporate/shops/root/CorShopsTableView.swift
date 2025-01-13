//
//  CorShopTableView.swift
//  Ecommerce
//
//  Created by muhammed dursun on 16.09.2024.
//


class CorShopsTableView: TableView<Shop, CorShopsCell> {
    
    
    override func configure() {
        
    }
}


class CorShopsCell: TableViewCell<Shop> {
    
    private let shopNameLabel = Label()
    private let shopImageView = ImageView()
    private let distanceLabel = Label()
    
    
    override func configure() {
        selectionBackgroundColor = .lightGray
        backgroundColor = .clear
        
        distanceLabel.textColor = .lightGray
        
        shopImageView.contentMode = .scaleAspectFill
        shopImageView.clipsToBounds = true
        shopImageView.layer.cornerRadius = 16
        
        addSubviews(shopNameLabel, shopImageView, distanceLabel)
        
        activateConstraints(
            shopImageView.topAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.topAnchor, constant: 4),
            shopImageView.leadingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.leadingAnchor, constant: 4),
            shopImageView.heightAnchor.constraint(equalToConstant: 90),
            shopImageView.widthAnchor.constraint(equalToConstant: 90),
            
            shopNameLabel.topAnchor.constraint(equalTo: shopImageView.topAnchor, constant: 4),
            shopNameLabel.leadingAnchor.constraint(equalTo: shopImageView.trailingAnchor, constant: 4),
            
            distanceLabel.topAnchor.constraint(equalTo: shopNameLabel.bottomAnchor, constant: 4),
            distanceLabel.leadingAnchor.constraint(equalTo: shopNameLabel.leadingAnchor, constant: 0),
            
            contentView.bottomAnchor.constraint(equalTo: distanceLabel.bottomAnchor, constant: 48)
        )
    }
    
    
    override func setItem(_ item: Shop) {
        shopNameLabel.text = item.name
        distanceLabel.text = "0.4 km"
        shopImageView.load(photoUrl: item.imageUrl)
    }
    
}
