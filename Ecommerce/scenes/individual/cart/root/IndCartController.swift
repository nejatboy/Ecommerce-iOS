//
//  IndCartController.swift
//  Ecommerce
//
//  Created by muhammed dursun on 13.11.2024.
//

class IndCartController: Controller<IndCartViewModel, IndCartNavigationController> {
    
    private let tableView = IndCartTableView()
    private let cartConfirmButton = ButtonSecondary()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Cart"
        
        addSubviews(tableView, cartConfirmButton)
    
        tableView.backgroundColor = .clear
        
        cartConfirmButton.backgroundColor = .systemRed
        
        activateConstraints(
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -160),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            cartConfirmButton.topAnchor.constraint(equalTo: tableView.bottomAnchor, constant: 10),
            cartConfirmButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -3),
            cartConfirmButton.centerXAnchor.constraint(equalTo: tableView.centerXAnchor)
        )
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        tableView.clear()
        
        viewModel.getAllProductsFromAllShops(completion: tableView.addItems)
    }
    
    override func customizeViews() {
        cartConfirmButton.setTitle("Confirm Cart", for: .normal)
        cartConfirmButton.setTitleColor(.white, for: .normal)
        cartConfirmButton.layer.cornerRadius = 20
    }
}
