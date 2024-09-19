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
        .init(title: "Portakal"),
    ]
    
    private let tableView = TrainingTableView()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addSubviews(tableView)
        
        tableView.addItems(items)
        tableView.onItemSelected = onItemClicked
        
        activateConstraints(
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        )
        
        LocationService.instance.request(listener: locationReceived)
    }
    
    
    private func locationReceived(coordinate: Coordinate) {
        show(message: "Konum alındı.", type: .success)
    }
    
    
    private func onItemClicked(item: TrainingModel) {
        show(message: item.title, type: .success)
    }
}
