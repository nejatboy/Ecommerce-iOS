//
//  CorShopsController.swift
//  Ecommerce
//
//  Created by Nejat Boy on 7.09.2024.
//

import Foundation


class CorShopsController: Controller<CorShopsViewModel, CorShopsNavigationController> {
    
    private let tableView = CorShopsTableView()
    private var shops = [Shop]()
    
    
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
     
        viewModel.fetchMyShops { shops in
            self.shops = shops
            self.tableView.addItems(shops)
        }
        
        tableView.swipeActions = [
            SwipeAction(title: "Delete", backgroundColor: .red, icon: .remove, handler: { index in
                self.viewModel.deleteMyShop(shopUid: self.shops[index].uid) {
                    print("Shop deleted.")
                }
            })
        ]
    }
}
