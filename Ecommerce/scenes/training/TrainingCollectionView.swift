//
//  TrainingCollectionView.swift
//  Ecommerce
//
//  Created by Nejat Boy on 3.11.2024.
//


class TrainingCollectionView: CollectionView<TrainingModel, TrainingCollectionViewCell, TrainingFlowLayout> {
    
    
}



class TrainingFlowLayout: CollectionViewFlowLayout {
    
    override var margin: Int {
        10
    }
    
    override var numberOfColumn: Int {
        2
    }
    
    override var itemHeightMultiplier: Double {
        1.75
    }
}



class TrainingCollectionViewCell: CollectionViewCell<TrainingModel> {
    
    private let label = Label()
    
    
    override func configure() {
        backgroundColor = .systemBlue
        layer.cornerRadius = 10
        
        contentView.addSubview(label)
        
        activateConstraints(
            label.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        )
    }
    
    
    override func setItem(item: TrainingModel) {
        label.text = item.title
    }
}
