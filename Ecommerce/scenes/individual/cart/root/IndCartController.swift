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
    
        let headerView = View()
        headerView.backgroundColor = .white
        tableView.tableHeaderView = headerView
        
        cartConfirmButton.backgroundColor = .systemRed
        cartConfirmButton.translatesAutoresizingMaskIntoConstraints = false
        
        activateConstraints(
            tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -60),
            tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            
            cartConfirmButton.topAnchor.constraint(equalTo: tableView.bottomAnchor, constant: 8),
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
