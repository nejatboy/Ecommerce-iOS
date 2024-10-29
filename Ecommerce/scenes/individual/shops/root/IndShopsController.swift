//
//  IndShopsController.swift
//  Ecommerce
//
//  Created by Nejat Boy on 26.10.2024.
//

class IndShopsController: Controller<IndShopsViewModel, IndShopsNavigationController> {
    
    private let tableView = IndShopsTableView()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Shops"
        
        addSubviews(tableView)
        
        activateConstraints(
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        )
        
        viewModel.fetchLocation(listener: locationReceived)
    }
    
    
    private func locationReceived(coordinate: Coordinate) {
        viewModel.fetchShops(coordinate: coordinate) { shops in
            self.tableView.addItems(shops ?? [] )
        }
    }
}
