//
//  CorProductsController.swift
//  Ecommerce
//
//  Created by Nejat Boy on 28.09.2024.
//


class CorProductsController: Controller<CorProductsViewModel, CorShopsNavigationController> {
    
    private let tableView = CorProductsTableView()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setNavButton(icon: .add) {
            self.navController?.productsToAddProduct(shopUid: self.viewModel.selectedShop?.uid)
        }
        
        navigationItem.title = viewModel.selectedShop?.name
        
        addSubviews(tableView)
        
        tableView.onItemSelected = onItemClicked
        
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
        
        viewModel.fetchCurrentShopProducts(completion: tableView.addItems)
    }
    
    
    private func onItemClicked(product: Product) {
        show(message: product.name, type: .success)
    }
}
