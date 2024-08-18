//
//  SegmentView.swift
//  Ecommerce
//
//  Created by Nejat Boy on 18.08.2024.
//

import UIKit


class SegmentView<E: CaseIterable>: UISegmentedControl where E: RawRepresentable, E.RawValue == String {
    
    var listener: Callback<E>?
    
    
    init() {
        let titles = E.allCases.map {
            $0.rawValue
        }
        
        super.init(items: titles)
        
        translatesAutoresizingMaskIntoConstraints = false
        widthAnchor.constraint(equalToConstant: Device.width * 0.8).isActive = true
        selectedSegmentIndex = 0
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    var currentElement: E {
        Array(E.allCases)[selectedSegmentIndex]
    }
    
    
    @objc private func valueChanged() {
        let element = Array(E.allCases)[selectedSegmentIndex]
        listener?(element)
    }
}
