//
//  TrainingController.swift
//  Ecommerce
//
//  Created by Nejat Boy on 30.08.2024.
//

class TrainingController: Controller<TrainingViewModel, NavigationController> {
    
    let items: [TrainingModel] = [
        .init(title: "Elma"),
        .init(title: "Armut"),
        .init(title: "Kiraz"),
        .init(title: "Karpuz"),
        .init(title: "Kavun"),
        .init(title: "Portakal")
    ]
    
    private let collectionView = TrainingCollectionView()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addSubviews(collectionView)
        
        collectionView.onItemSelected = onItemClicked
        collectionView.setItems(items: items)
        
        activateConstraints(
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.topAnchor.constraint(equalTo: view.topAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        )
    }
    
    
    private func onItemClicked(item: TrainingModel) {
        print(item.title!)
    }
}
