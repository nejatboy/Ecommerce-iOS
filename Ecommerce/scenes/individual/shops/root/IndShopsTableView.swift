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
    
    private let shopsName = Label()
    
    
    override func configure() {
        selectionBackgroundColor = .lightGray
        backgroundColor = .clear
        
        shopsName.textColor = .black
        
        addSubviews(shopsName)
        
        activateConstraints(
            shopsName.topAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.topAnchor, constant: 3),
            shopsName.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 3),
            
            contentView.bottomAnchor.constraint(equalTo: shopsName.bottomAnchor, constant: 10)
        )
    }
    
    
    override func setItem(_ item: Shop) {
        shopsName.text = item.name
    }
}
