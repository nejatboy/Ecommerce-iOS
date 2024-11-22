//
//  IndCartController.swift
//  Ecommerce
//
//  Created by muhammed dursun on 13.11.2024.
//

class IndCartController: Controller<IndCartViewModel, IndCartNavigationController> {
    
    let items : [ExampleModel] =  [
        .init(name: "Kazak"),
        .init(name: "Kazak"),
        .init(name: "Kazak")
    ]
    private let tableView = IndCartTableView()
    private let cartConfirmButton = ButtonSecondary()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Cart"
        
        addSubviews(tableView, cartConfirmButton)
    
        tableView.addItems(items)
        tableView.backgroundColor = .red
        
        cartConfirmButton.backgroundColor = .yellow
        
        activateConstraints(
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -160),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            cartConfirmButton.topAnchor.constraint(equalTo: tableView.bottomAnchor, constant: 15),
            cartConfirmButton.centerXAnchor.constraint(equalTo: tableView.centerXAnchor)
        )
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }
    
    override func customizeViews() {
        cartConfirmButton.setTitle("Cart Confirm", for: .normal)
    }
}
