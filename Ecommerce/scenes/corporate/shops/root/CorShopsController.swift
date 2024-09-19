//
//  CorShopsController.swift
//  Ecommerce
//
//  Created by Nejat Boy on 7.09.2024.
//

import Foundation

class CorShopsController: Controller<CorShopsViewModel, CorShopsNavigationController> {
    
    private let tableView = CorShopsTableView()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Shops"
        setNavButton(icon: .add, onClicked: navController?.shopsToAddShop)
        
        addSubviews(tableView)
        
        tableView.onItemSelected = onShopClicked
        
        activateConstraints(
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        )
        
        getShops()
    }
    
    
    private func onShopClicked(item: Shop) {
        show(message: item.name, type: .success)
    }
    
    private func getShops() {
        self.viewModel.fetchMyShops { [weak self] shops in
            self?.tableView.addItems(shops ?? [])
            self?.tableView.reloadData()
        }
    }
}
