//
//  Extension.swift
//  Ecommerce
//
//  Created by muhammed dursun on 29.07.2024.
//

import UIKit

extension UIView{
    
    func currentAnchor(top:NSLayoutYAxisAnchor?,leading :NSLayoutXAxisAnchor?,bottom:NSLayoutYAxisAnchor?,trailing : NSLayoutXAxisAnchor?,padding : UIEdgeInsets = .zero,currentSize : CGSize = .zero){
        
        translatesAutoresizingMaskIntoConstraints = false
        if let top = top {
            topAnchor.constraint(equalTo: top, constant: padding.top).isActive = true
        }
        if let leading = leading {
            leadingAnchor.constraint(equalTo: leading, constant: padding.left).isActive = true
        }
        if let bottom = bottom {
            bottomAnchor.constraint(equalTo: bottom, constant: -padding.bottom).isActive = true
        }
        if let trailing = trailing{
            trailingAnchor.constraint(equalTo: trailing, constant: -padding.right).isActive = true
        }
        if currentSize.width != 0 {
            widthAnchor.constraint(equalToConstant: currentSize.width).isActive = true
        }
        if currentSize.height != 0{
            heightAnchor.constraint(equalToConstant: currentSize.height).isActive = true
        }
    }
    
    func currentAnchorSize(view:UIView){
        
        widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        heightAnchor.constraint(equalTo: view.heightAnchor).isActive = true
    }
    
    func fillSuperView(){
        
        currentAnchor(top: superview?.topAnchor, leading: superview?.leadingAnchor, bottom: superview?.bottomAnchor, trailing: superview?.trailingAnchor)
    }
}
