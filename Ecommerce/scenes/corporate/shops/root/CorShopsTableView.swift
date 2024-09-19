//
//  CorShopTableView.swift
//  Ecommerce
//
//  Created by muhammed dursun on 16.09.2024.
//


class CorShopsTableView: TableView<Shop, CorShopsCell> {
    
    
    override func configure() {
        backgroundColor = .systemGray
    }
}


class CorShopsCell: TableViewCell<Shop> {
    
    private let shopLabel = Label()
    
    
    override func configure() {
        selectionBackgroundColor = .blue
        backgroundColor = .clear
        
        shopLabel.textColor = .red
        
        addSubviews(shopLabel)
        
        activateConstraints(
            shopLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            shopLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            
            contentView.bottomAnchor.constraint(equalTo: shopLabel.bottomAnchor, constant: 10)
        )
    }
    
    
    override func setItem(_ item: Shop) {
        shopLabel.text = item.name
        shopLabel.font = .setDynamicFont(size: 25)
    }
    
}
