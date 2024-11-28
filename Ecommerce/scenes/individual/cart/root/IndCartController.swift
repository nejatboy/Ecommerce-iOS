//
//  IndCartController.swift
//  Ecommerce
//
//  Created by muhammed dursun on 13.11.2024.
//

class IndCartController: Controller<IndCartViewModel, IndCartNavigationController> {
    
    private let tableView = IndCartTableView()
    private let cartConfirmButton = ButtonPrimary()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Cart"
        
        addSubviews(tableView, cartConfirmButton)
    
        activateConstraints(
            cartConfirmButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -14),
            cartConfirmButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: cartConfirmButton.topAnchor, constant: -26),
            tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor)
        )
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        tableView.clear()
        
        viewModel.getAllProductsFromAllShops(completion: tableView.addItems)
    }
    
    
    override func customizeViews() {
        cartConfirmButton.setTitle("Confirm Cart", for: .normal)
    }
}
