//
//  IndCartController.swift
//  Ecommerce
//
//  Created by muhammed dursun on 13.11.2024.
//

import Foundation


class IndCartController: Controller<IndCartViewModel, IndCartNavigationController> {
    
    private let tableView = IndCartTableView()
    private let cartConfirmButton = ButtonPrimary()
    private let totalPriceLabel = Label()
    
    private var products: [Product] = []

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Cart"
        
        
        tableView.swipeActions = [
            SwipeAction(title: "Remove", backgroundColor: .red, icon: .remove, handler: {
                print("Delete action triggered.")
            })]
        
        addSubviews(tableView, totalPriceLabel, cartConfirmButton)
        
        activateConstraints(
            cartConfirmButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -14),
            cartConfirmButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            totalPriceLabel.bottomAnchor.constraint(equalTo: cartConfirmButton.topAnchor, constant: -14),
            totalPriceLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -10),
            
            tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: totalPriceLabel.topAnchor, constant: 2),
            tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor)
        )
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        tableView.clear()
        
        viewModel.getAllProductsFromAllShops { [self] products in
            self.tableView.addItems(products)
            
            self.products = products
            
            for index in 0..<products.count {
                let indexPath = IndexPath(row: index, section: 0)
                if let cell = self.tableView.cellForRow(at: indexPath) as? IndCartTableViewCell {
                    cell.onPriceChanged = onPriceChanged
                }
            }
        }
    }
    
    
    override func customizeViews() {
        cartConfirmButton.setTitle("Confirm Cart", for: .normal)
    }
    
    
    private  func onPriceChanged(product: Product) {
        if let index = products.firstIndex(where: { $0.uid == product.uid }) {
            products[index].quantity = product.quantity
        }
        
        let totalPrice = products.reduce(0.0) { (result, product) -> Double in
            return result + (product.price ?? 0.0) * Double(product.quantity ?? 1)
        }
        
        self.totalPriceLabel.text = "Toplam: \(totalPrice)"
    }
}
