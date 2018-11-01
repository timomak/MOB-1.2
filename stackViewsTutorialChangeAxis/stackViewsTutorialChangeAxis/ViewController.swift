//
//  ViewController.swift
//  stackViewsTutorialChangeAxis
//
//  Created by timofey makhlay on 11/1/18.
//  Copyright © 2018 Timofey Makhlay. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    private let stack: UIStackView = {
        // Create 3 views
        let greenView = UIView()
        let blueView = UIView()
        let redView = UIView()
        redView.backgroundColor = .red
        greenView.backgroundColor = .green
        blueView.backgroundColor = .blue
        
        let bottomControlsStackView = UIStackView(arrangedSubviews: [greenView, blueView, redView])
        bottomControlsStackView.translatesAutoresizingMaskIntoConstraints = false
        bottomControlsStackView.distribution = .fillEqually
        return bottomControlsStackView
    } ()
    
    // Create button to change axis
    private let axis: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Axis", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitleColor(.gray, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        button.addTarget(self, action:  #selector(ViewController.buttonTapped), for: .touchUpInside)
        return button
    }()
    @objc func buttonTapped() {
        print("Pressed")
        if stack.axis == .vertical {
            stack.axis = .horizontal
        } else {
            stack.axis = .vertical
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    
        

//        let bottomControlsStackView = UIStackView(arrangedSubviews: [greenView, blueView, redView])
//        bottomControlsStackView.translatesAutoresizingMaskIntoConstraints = false
//        bottomControlsStackView.distribution = .fillEqually
        view.addSubview(stack)
        stack.fillSafeAreaSuperview()
        
        
        view.addSubview(axis)
        axis.anchor(top: nil, leading: view.safeAreaLayoutGuide.leadingAnchor, bottom: view.safeAreaLayoutGuide.bottomAnchor, trailing: nil, padding: .init(top: 0, left: 30, bottom: 0, right: 0))
        
        
        
    }


}

extension UIView {
    func fillSuperview() {
        anchor(top: superview?.topAnchor, leading: superview?.leadingAnchor, bottom: superview?.bottomAnchor, trailing: superview?.trailingAnchor)
    }
    
    func fillSafeAreaSuperview() {
        anchor(top: superview?.safeAreaLayoutGuide.topAnchor, leading: superview?.safeAreaLayoutGuide.leadingAnchor, bottom: superview?.safeAreaLayoutGuide.bottomAnchor, trailing: superview?.safeAreaLayoutGuide.trailingAnchor)
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
