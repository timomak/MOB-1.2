//
//  ViewController.swift
//  Programmatic-Tip-Calculator
//
//  Created by timofey makhlay on 11/1/18.
//  Copyright © 2018 Timofey Makhlay. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    // TODO: Make navbar with title and switch
    func addCustomNavbar() {
        // Adding custom color and size to navbar
        let navbar = UIView()
        navbar.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        view.addSubview(navbar)
        navbar.anchor(top: view.topAnchor, leading: view.leadingAnchor, bottom: nil, trailing: view.trailingAnchor, size: .init(width: view.bounds.width, height: 100))
        
        // Adding button to Navbar
        let switchButton = UISwitch()
        navbar.addSubview(switchButton)
        switchButton.anchor(top: navbar.topAnchor, leading: nil, bottom: navbar.bottomAnchor, trailing: navbar.trailingAnchor, padding: .init(top: 40, left: 0, bottom: 10, right: 30))
        
        // Addting title to Navbar
        let title = UITextField()
        title.text = "Tip Calculator"
        navbar.addSubview(title)
        title.anchor(top: switchButton.topAnchor, leading: navbar.leadingAnchor, bottom: switchButton.bottomAnchor, trailing: nil, padding: .init(top: 0, left: 30, bottom: 0, right: 0))
    }
    
    
    
    // TODO: Make View with label and segment control
    
    
    
    
    
    // TODO: Second view displaying math results in two labels
    
    
    
    
   // TODO: Button to Reset
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addCustomNavbar()
        
    }


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
}
