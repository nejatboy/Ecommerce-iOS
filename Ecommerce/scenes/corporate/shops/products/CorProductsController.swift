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
            guard let shop = self.viewModel.selectedShop else {
                return
            }
            self.navController?.productsToAddProduct(shopUid: shop.uid ?? "")
        }
        
        navigationItem.title = viewModel.selectedShop?.name
        
        addSubviews(tableView)
        
        tableView.addItems(viewModel.products)
        tableView.onItemSelected = onItemClicked
        
        activateConstraints(
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        )
    }
    
    
    private func onItemClicked(product: Product) {
        show(message: product.name, type: .success)
    }
}
