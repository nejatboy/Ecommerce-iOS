//
//  IndShopsTableView.swift
//  Ecommerce
//
//  Created by muhammed dursun on 27.10.2024.
//

class IndShopsTableView: TableView<Shop, IndShopsCell> {
    
    override func configure() {
        
    }
}


class IndShopsCell: TableViewCell<Shop> {
   
    private let shopImageView = ImageView()
    private let shopNameLabel = Label()
    private let distanceLabel = Label()
    
    
    override func configure() {
        selectionBackgroundColor = .lightGray
        backgroundColor = .clear
        
        shopNameLabel.textColor = .black
        shopNameLabel.font = .setDynamicFont(size: 16)
        
        distanceLabel.textColor = .lightGray
        distanceLabel.font = .setDynamicFont(size: 16)
        
        shopImageView.contentMode = .scaleAspectFill
        shopImageView.clipsToBounds = true
        shopImageView.layer.cornerRadius = 10
        
        addSubviews(shopImageView, shopNameLabel, distanceLabel)
        
        activateConstraints(
            shopImageView.topAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.topAnchor, constant: 6),
            shopImageView.leadingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.leadingAnchor, constant: 6),
            shopImageView.widthAnchor.constraint(equalToConstant: 100),
            shopImageView.heightAnchor.constraint(equalToConstant: 100),
            
            shopNameLabel.topAnchor.constraint(equalTo: shopImageView.topAnchor, constant: 4),
            shopNameLabel.leadingAnchor.constraint(equalTo: shopImageView.trailingAnchor, constant: 6),
            
            distanceLabel.topAnchor.constraint(equalTo: shopNameLabel.bottomAnchor, constant: 8),
            distanceLabel.leadingAnchor.constraint(equalTo: shopNameLabel.leadingAnchor, constant: 0),
            
            contentView.bottomAnchor.constraint(equalTo: distanceLabel.bottomAnchor, constant: 52)
        )
    }
    
    
    override func setItem(_ item: Shop) {
        shopNameLabel.text = item.name
        shopImageView.load(photoUrl: item.imageUrl)
        distanceLabel.text = "5 km"
    }
}
