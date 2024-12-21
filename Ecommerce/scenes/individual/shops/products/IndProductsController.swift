//
//  IndProductsController.swift
//  Ecommerce
//
//  Created by Nejat Boy on 3.11.2024.
//


class IndProductsController: Controller<IndProductsViewModel, IndShopsNavigationController> {
    
    private let collectionView = IndProductsCollectionView()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = viewModel.selectedShop?.name
        
        addSubviews(collectionView)
        
        collectionView.onItemSelected = navController?.productsToDetail
        navController?.getShop(shop: viewModel.selectedShop!)
        
        activateConstraints(
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.topAnchor.constraint(equalTo: view.topAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        )
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        collectionView.clear()
        
        viewModel.fetchCurrentShopProducts(completion: collectionView.setItems)
    }
}
