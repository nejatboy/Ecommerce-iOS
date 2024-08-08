//
//  Extensions.swift
//  Ecommerce
//
//  Created by Nejat Boy on 7.08.2024.
//

import UIKit


//MARK: TypeAlias
typealias Handler = (() -> Void)
typealias Callback<T> = (T) -> Void



//MARK: UIFont
extension UIFont {
    
    static func setDynamicFont(size: CGFloat) -> UIFont {
        let width = Device.width
        let divisor: CGFloat = Device.isAnIpad ? 530 : 375
        let multiplier = width / divisor
        
        return UIFont.systemFont(ofSize: size * multiplier)
    }
}
