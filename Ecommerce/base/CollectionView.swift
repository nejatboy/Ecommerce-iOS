//
//  CollectionView.swift
//  Ecommerce
//
//  Created by Nejat Boy on 2.11.2024.
//

import UIKit


//MARK: CollectionView
private protocol Source: UICollectionViewDelegate, UICollectionViewDataSource {
    associatedtype ITEM
    
    func setItems(items: [ITEM])
    func addItem(item: ITEM)
    func addItems(newItems: [ITEM])
}


//MARK: CollectionView
class CollectionView<ITEM, C: CollectionViewCell<ITEM>, L: CollectionViewFlowLayout>: UICollectionView, Source {
    
    private let cellId = UUID().uuidString
    private var items: [ITEM] = []
    var onItemClicked: Callback<ITEM>?
    
    
    init() {
        super.init(frame: .zero, collectionViewLayout: .init())
        
        translatesAutoresizingMaskIntoConstraints = false
        register(C.self, forCellWithReuseIdentifier: cellId)
        backgroundColor = .clear
        collectionViewLayout = L()
        delegate = self
        dataSource = self
        
        configure()
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func configure() { }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        items.count
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as? C else { return .init() }
        
        let item = items[indexPath.item]
        cell.setItem(item: item)
        
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let onItemClicked = onItemClicked else {
            return
        }

        let item = items[indexPath.item]
        onItemClicked(item)
        
        //TODO: deselect
        guard let cell = cellForItem(at: indexPath) else {
            return
        }
        
        UIView.animate(withDuration: 0.2) {
            cell.alpha = 0.5
        } completion: { _ in
            UIView.animate(withDuration: 0.2) {
                cell.alpha = 1
            }
        }
    }
    
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        .init()
    }
    
    
    func setItems(items: [ITEM]) {
        self.items = items
        reloadData()
    }
    
    
    func addItem(item: ITEM) {
        items.append(item)
        let indexPath = IndexPath(item: items.count - 1, section: 0)
        reloadItems(at: [indexPath])
    }
    
    
    func addItems(newItems: [ITEM]) {
        items.append(contentsOf: newItems)
        
        let startIndex = items.count - newItems.count
        
        let indexPaths: [IndexPath] = (startIndex ..< items.count).map {
            .init(item: $0, section: 0)
        }
        
        reloadItems(at: indexPaths)
    }
}



//MARK: FlowLayout
class CollectionViewFlowLayout: UICollectionViewFlowLayout {
    
    
    required override init() {
        super.init()
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}




//MARK: CollectionViewCell
class CollectionViewCell<ITEM>: UICollectionViewCell {
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configure()
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func configure() { }
    
    
    func setItem(item: ITEM) { }
    
    
    func activateConstraints(_ constraints: NSLayoutConstraint...) {
        NSLayoutConstraint.activate(constraints)
    }
}

