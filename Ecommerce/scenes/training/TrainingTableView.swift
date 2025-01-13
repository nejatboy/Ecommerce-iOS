//
//  TrainingTableView.swift
//  Ecommerce
//
//  Created by Nejat Boy on 30.08.2024.
//


struct TrainingModel: ListItem {
    let title: String?
    
    var uid: String? {
        nil
    }
}



class TrainingTableView: TableView<TrainingModel, TrainingCell> {
    
    
    override func configure() {
        backgroundColor = .systemGray
    }
}



class TrainingCell: TableViewCell<TrainingModel> {
    
    private let label = Label()
    
    
    override func configure() {
        selectionBackgroundColor = .systemPurple
        backgroundColor = .clear
        
        label.textColor = .black
        
        addSubviews(label)
        
        activateConstraints(
            label.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            label.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            
            contentView.bottomAnchor.constraint(equalTo: label.bottomAnchor, constant: 10)
        )
    }
    
    
    override func setItem(_ item: TrainingModel) {
        label.text = item.title
        label.font = .setDynamicFont(size: 50)
    }
}
