//
//  Device.swift
//  Ecommerce
//
//  Created by Nejat Boy on 30.07.2024.
//

import UIKit


struct Device {
    
    static let bounds = UIScreen.main.bounds
    static let size = bounds.size
    static let width = size.width
    static let height = size.height
    static let isAnIpad = UIDevice.current.userInterfaceIdiom == .pad
}
