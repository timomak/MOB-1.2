//
//  designOfView.swift
//  Tip-calculator-Programmatic
//
//  Created by timofey makhlay on 11/2/18.
//  Copyright © 2018 Timofey Makhlay. All rights reserved.
//

import UIKit

extension UIColor {
    static var lightmodeFoundation = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
    static var lightmodeBase = #colorLiteral(red: 0.09553630322, green: 0.04069456336, blue: 0.4362659324, alpha: 1)
    static var lightmodeOutline = #colorLiteral(red: 0.8549019694, green: 0.250980407, blue: 0.4784313738, alpha: 1)
    
    static var darkmodeFoundation = #colorLiteral(red: 0.1365320385, green: 0.1640076339, blue: 0.1980843842, alpha: 1)
    static var darkmodeBase = #colorLiteral(red: 0.2041161656, green: 0.2344051898, blue: 0.2852919698, alpha: 1)
    static var darkmodeOutline = #colorLiteral(red: 0.3445012569, green: 0.8545694351, blue: 0.6445240378, alpha: 1)
}


extension UIView {
    func fillSuperview() {
        anchor(top: superview?.topAnchor, leading: superview?.leadingAnchor, bottom: superview?.bottomAnchor, trailing: superview?.trailingAnchor)
    }
    
    func anchorSize(to view: UIView) {
        widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        heightAnchor.constraint(equalTo: view.heightAnchor).isActive = true
    }
    
    
    
    func anchor(top: NSLayoutYAxisAnchor?, leading: NSLayoutXAxisAnchor?, bottom: NSLayoutYAxisAnchor?, trailing: NSLayoutXAxisAnchor?, padding: UIEdgeInsets = .zero, size: CGSize = .zero) {
        translatesAutoresizingMaskIntoConstraints = false
        
        if let top = top {
            topAnchor.constraint(equalTo: top, constant: padding.top).isActive = true
            
        }
        
        if let leading = leading {
            leadingAnchor.constraint(equalTo: leading, constant: padding.left).isActive = true
            
        }
        
        if let bottom = bottom {
            bottomAnchor.constraint(equalTo: bottom , constant: -padding.bottom).isActive = true
            
        }
        
        if let trailing = trailing {
            trailingAnchor.constraint(equalTo: trailing, constant: -padding.right).isActive = true
            
        }
        
        if size.width != 0 {
            widthAnchor.constraint(equalToConstant: size.width).isActive = true
        }
        
        if size.height != 0 {
            heightAnchor.constraint(equalToConstant: size.height).isActive = true
        }
    }
    func centerHorizontalOfView(to view: UIView) {
        centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }
    func centerVerticalOfView(to view: UIView) {
        centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }
    
    func centerOfView(to view: UIView) {
        centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }
    
    
    
}
extension UIButton {
    func toBarButtonItem() -> UIBarButtonItem {
        return UIBarButtonItem(customView: self)
    }
}
extension UIViewController {
    // Hide the keyboard when tapped away from it.
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}
