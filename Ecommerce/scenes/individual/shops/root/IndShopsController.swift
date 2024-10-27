//
//  IndShopsController.swift
//  Ecommerce
//
//  Created by Nejat Boy on 26.10.2024.
//

class IndShopsController: Controller<IndShopsViewModel, IndShopsNavigationController> {
    
    
    private let tableView = IndShopsTableView()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Shops"
        
        addSubviews(tableView)
        
        activateConstraints(
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        )
        
        viewModel.fetchLocation { coordinate in
            self.viewModel.fetchShops(coordinate: coordinate) { shops in
                if let shops = shops {
                    self.tableView.addItems(shops)
                }
                else {
                    let okAction = AlertModel(title: "OK")
                    self.showAlert(type: .error, message: "Dükkan bulunamadı.", actions: [okAction] )
                }
                
            }
        }
    }
    
  /*  override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        viewModel.fetchLocation { coordinate in
            self.viewModel.fetchShops(coordinate: coordinate) { shops in
                if let shops = shops {
                    self.tableView.addItems(shops)
                }
                else {
                    let okAction = AlertModel(title: "OK")
                    self.showAlert(type: .error, message: "Dükkan bulunamadı.", actions: [okAction] )
                }
                
            }
        }
    } */
    
}
