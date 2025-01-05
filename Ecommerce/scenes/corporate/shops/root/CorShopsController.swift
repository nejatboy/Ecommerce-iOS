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
        
        activateConstraints(
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        )
    }
    
    
    override func customizeViews() {
        tableView.onItemSelected = navController?.shopsToProduct
        
        tableView.swipeActions = [
            SwipeAction(title: "Delete", backgroundColor: .red, icon: .iconDelete, handler: onItemDeleted)
        ]
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        tableView.clear()
        viewModel.fetchMyShops(completion: tableView.addItems)
    }
    
    private func onItemDeleted(shop: Shop) {
        viewModel.deleteMyShop(shopUid: shop.uid) {
            self.tableView.remove(item: shop, animation: .fade)
        }
    }
}
