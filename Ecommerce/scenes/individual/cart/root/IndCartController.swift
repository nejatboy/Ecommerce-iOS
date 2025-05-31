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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Cart"
        
        tableView.swipeActions = [
            SwipeAction(title: "Remove", backgroundColor: .red, icon: .iconDelete, handler: onItemDeleted)
        ]
        
        addSubviews(tableView, totalPriceLabel, cartConfirmButton)
        
        activateConstraints(
            cartConfirmButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -14),
            cartConfirmButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            totalPriceLabel.bottomAnchor.constraint(equalTo: cartConfirmButton.topAnchor, constant: -16),
            totalPriceLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -10),
            
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: totalPriceLabel.topAnchor, constant: -8)
        )
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
         tableView.clear()
        
        if let cart = viewModel.cart {
            totalPriceCalculate(cart: cart, completion: { products in
                self.tableView.setItems(products!)
            })
        }
    }
    
    
    override func customizeViews() {
        cartConfirmButton.setTitle("Confirm Cart", for: .normal)
    }
    
    
    func cartChanged(newCard: Cart) {
        totalPriceCalculate(cart: newCard, completion: { products in
            print("PRİNT: TOPLAM FİYAT DEĞİŞTİİİİİİ......")
        })
    }
    
    
    func totalPriceCalculate(cart: Cart, completion: Callback<[Product]?>) {
        let products = cart.items.map { $0.product }
        
        let totalPrice = cart.items.map { (Double ( $0.quantity) * ($0.product.price ?? 0.0))}.reduce(0.0, +)
        
        totalPriceLabel.text = " Toplam Fiyat : \(totalPrice)"
        
        completion(products)
    }
    
    
    private func onItemDeleted(product: Product) {
        let cartItem = CartItem(product: product, quantity: 0)
        
        viewModel.deleteProduct(item: cartItem) {
            self.tableView.remove(item: product, animation: .fade)
            
            if ((self.viewModel.cart?.items.isEmpty) != nil) {
                self.totalPriceLabel.isHidden = true
                self.cartConfirmButton.isHidden = true
            }
            
            else {
                self.totalPriceLabel.isHidden = false
                self.cartConfirmButton.isHidden = false
            }
        }
    }
}
