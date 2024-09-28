//
//  CorShopsController.swift
//  Ecommerce
//
//  Created by Nejat Boy on 7.09.2024.
//


class CorShopsController: Controller<CorShopsViewModel, CorShopsNavigationController> {
    
    private let tableView = CorShopsTableView()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Shops"
        setNavButton(icon: .add, onClicked: navController?.shopsToAddShop)
        
        addSubviews(tableView)
        
        tableView.onItemSelected = navController?.shopsToProduct
        
        activateConstraints(
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        )
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        tableView.clear()
        
        viewModel.fetchMyShops(completion: tableView.addItems)
    }
}
