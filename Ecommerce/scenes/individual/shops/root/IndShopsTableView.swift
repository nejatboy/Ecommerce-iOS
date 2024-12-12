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
   
    private let shopsImageView = ImageView()
    private let shopsName = Label()
    private let distanceShopsLabel = Label()
    
    
    override func configure() {
        selectionBackgroundColor = .lightGray
        backgroundColor = .clear
        
        shopsName.textColor =  .black.withAlphaComponent(1.0)
        shopsName.font = .setDynamicFont(size: 16)
        
        distanceShopsLabel.textColor = .lightGray
        distanceShopsLabel.font = .setDynamicFont(size: 16)
        
        shopsImageView.contentMode = .scaleAspectFill
        shopsImageView.clipsToBounds = true
        shopsImageView.layer.cornerRadius = 10
        
        addSubviews(shopsImageView, shopsName, distanceShopsLabel)
        
        activateConstraints(
            shopsImageView.topAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.topAnchor, constant: 6),
            shopsImageView.leadingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.leadingAnchor, constant: 6),
            shopsImageView.widthAnchor.constraint(equalToConstant: 80),
            shopsImageView.heightAnchor.constraint(equalToConstant: 80),
            
            shopsName.topAnchor.constraint(equalTo: shopsImageView.topAnchor, constant: 4),
            shopsName.leadingAnchor.constraint(equalTo: shopsImageView.trailingAnchor, constant: 6),
            
            distanceShopsLabel.topAnchor.constraint(equalTo: shopsName.bottomAnchor, constant: 6),
            distanceShopsLabel.leadingAnchor.constraint(equalTo: shopsName.leadingAnchor, constant: 0),
            
            contentView.bottomAnchor.constraint(equalTo: shopsImageView.bottomAnchor, constant: 10)
        )
    }
    
    
    override func setItem(_ item: Shop) {
        shopsName.text = item.name
        shopsImageView.load(photoUrl: item.imageUrl)
        distanceShopsLabel.text = "5 km"
    }
}
