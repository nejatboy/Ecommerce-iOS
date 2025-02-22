//
//  TableView.swift
//  Ecommerce
//
//  Created by Nejat Boy on 30.08.2024.
//

import UIKit


//MARK: TableView
class TableView<I: ListItem, C: TableViewCell<I>>: UITableView, UITableViewDelegate, UITableViewDataSource {
    
    fileprivate var items: [I] = []
    private let cellId = UUID().uuidString
    
    ///Tıklanan item'ı handle etmek için kullanırız.
    var onItemSelected: Callback<I>?
    
    /// Swipe işlemi için set etmemiz yeterli.
    var swipeActions: [SwipeAction<I>]?
    
    
    required init() {
        super.init(frame: .zero, style: .plain)
        
        translatesAutoresizingMaskIntoConstraints = false
        delegate = self
        dataSource = self
        backgroundColor = .clear
        register(C.self, forCellReuseIdentifier: cellId)
        
        configure()
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        items.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = dequeueReusableCell(withIdentifier: cellId) as? C else { return .init() }
        
        let item = items[indexPath.row]
        cell.setItem(item)
        
        handle(cell: cell, indexPath: indexPath)
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let item = items[indexPath.row]
        onItemSelected?(item)
        
        deselectRow(at: indexPath, animated: true)
    }
    
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        guard let swipeActions = swipeActions, !swipeActions.isEmpty else {
            return nil
        }
        
        let actions: [UIContextualAction] = swipeActions.map { swipeAction in
            let item = UIContextualAction(style: .destructive, title: swipeAction.title) { _, _, completionHandler in
                swipeAction.handler?(self.items[indexPath.row])
                completionHandler(true)
            }
            
            item.image = swipeAction.icon
            item.backgroundColor = swipeAction.backgroundColor
            
            return item
        }
        
        return UISwipeActionsConfiguration(actions: actions)
    }
    
    
    ///TableView'ın elemanlarını set etmek için kullanırız.
    func setItems(_ items: [I]) {
        self.items = items
        reloadData()
    }
    
    
    ///TableView'a liste halinde eleman eklemek için kullanırız.
    func addItems(_ newItems: [I]) {
        items.append(contentsOf: newItems)
        reloadData()
    }
    
    
    /// Listenin başına eleman eklemek için kullanırız.
    ///
    /// - Parameters:
    ///   - withScroll: Eleman eklendikten sonra o item'a scroll etmek istiyorsak true set ederiz.
    func addToFirst(item: I, withScroll: Bool) {
        items.insert(item, at: 0)
        
        let indexPath = IndexPath(row: 0, section: 0)

        beginUpdates()
        insertRows(at: [indexPath], with: .fade)
        endUpdates()
        
        if withScroll {
            scrollToRow(at: indexPath, at: .top, animated: true)
        }
    }
    
    
    /// Listenin sonuna eleman eklemek için kullanırız.
    ///
    /// - Parameters:
    ///   - withScroll: Eleman eklendikten sonra o item'a scroll etmek istiyorsak true set ederiz.
    func addToLast(item: I, withScroll: Bool) {
        items.append(item)
        
        let indexPath = IndexPath(row: items.count - 1, section: 0)

        beginUpdates()
        insertRows(at: [indexPath], with: .fade)
        endUpdates()
        
        if withScroll {
            scrollToRow(at: indexPath, at: .bottom, animated: true)
        }
    }
    
    
    ///Listeyi temizlemek için kullanırız.
    func clear() {
        items.removeAll()
        reloadData()
    }
    
    
    ///Bir item'ı listeden silmek için kullanırız.
    func remove(item: I, animation: UITableView.RowAnimation) {
        guard let index = (items.firstIndex { $0.uid == item.uid }) else {
            return
        }
        
        items.remove(at: index)
        
        let indexPath = IndexPath(row: index, section: 0)
        deleteRows(at: [indexPath], with: animation)
    }
    
    
    ///TableView'ın çoğu özellikleri zaten ayarlanmıştır. Ayrıca ayarlamak istediğimiz özellik var ise override ediniz.
    func configure() { }
    
    
    /// cellForRowAt metoduna ek olarak hücrede değişiklik yapmak istenirse override edilir.
    func handle(cell: C, indexPath: IndexPath) {}
}




//MARK: TableViewCell
class TableViewCell<I: ListItem>: UITableViewCell {
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        configure()
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    ///Özelleştirmek için override ediniz.
    func configure() {}
    
    
    /// Dizi haline contentView'a eklemek istediğimiz view'ları verebiliriz.
    func addSubviews(_ subview: UIView...) {
        subview.forEach {
            contentView.addSubview($0)
        }
    }
    
    
    /// Gelen item'ı arayüze bağlamak için override ediniz.
    func setItem(_ item: I) {}
    
    
    /// Aktif etmek istediğimiz constraint'leri dizi halince verebiliriz.
    func activateConstraints(_ constraints: NSLayoutConstraint...) {
        NSLayoutConstraint.activate(constraints)
    }
    
    
    /// Seçilen item'a renk atamak için set ediniz.
    var selectionBackgroundColor: UIColor? {
        get {
            selectedBackgroundView?.backgroundColor
        }
        
        set {
            let selectionView = View()
            selectionView.backgroundColor = newValue
            selectedBackgroundView = selectionView
        }
    }
    
    
    /// Hücreden ilgili item'a erişmek için kullanırız.
    var item: I? {
        guard 
            let tableView = superview as? TableView<I, Self>,
            let indexPath = tableView.indexPath(for: self)
        else {
            return nil
        }
        
        return tableView.items[indexPath.row]
    }
}
