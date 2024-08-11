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



//MARK: UIImage
extension UIImage {
    static let iconWarning = UIImage(systemName: "exclamationmark.triangle")
    static let iconError = UIImage(systemName: "exclamationmark.circle")
    static let iconSuccess = UIImage(systemName: "checkmark.circle")
//    static let iconBack = UIImage(systemName: "arrow.backward")
//    static let iconAdd = UIImage(systemName: "plus")
//    static let iconEdit = UIImage(systemName: "pencil")
//    static let iconLocation = UIImage(systemName: "mappin.and.ellipse")
//    static let iconRight = UIImage(systemName: "chevron.right")
//    static let iconInfo = UIImage(systemName: "info.circle")
//    static let iconLeft = UIImage(systemName: "chevron.left")
//    static let iconRemove = UIImage(systemName: "minus")
//    static let iconCircle = UIImage(systemName: "circle.fill")
//    static let iconBlock = UIImage(systemName: "hand.raised")
//    static let iconCheck = UIImage(systemName: "checkmark.square.fill")
//    static let iconUncheck = UIImage(systemName: "square")
}



//MARK: UIColor
//extension UIColor {
//    static let error = UIColor(named: "error")!
//    static let success = UIColor(named: "success")!
//    static let warning = UIColor(named: "warning")!
//    static let snow = UIColor(named: "snow")!
//}
