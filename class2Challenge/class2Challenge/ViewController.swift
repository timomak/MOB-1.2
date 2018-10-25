//
//  ViewController.swift
//  programmaticAutoLayout
//
//  Created by timofey makhlay on 10/25/18.
//  Copyright © 2018 Timofey Makhlay. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        let redView = UIView()
        redView.backgroundColor = .blue
        
        let blueView = UIView()
        blueView.backgroundColor = .white
        
//        let greenView = UIView()
//        greenView.backgroundColor = .green
//
        view.addSubview(redView)
        view.addSubview(blueView)
//        view.addSubview(greenView)
        
        
        // Enable AutoLayout
        redView.anchor(top: view.safeAreaLayoutGuide.topAnchor, leading: view.safeAreaLayoutGuide.leadingAnchor, bottom: nil, trailing: nil, padding: .init(top: 10, left: 10, bottom: 0, right: 10), size: .init(width: (view.bounds.width/2) - 20, height: 0))
        redView.heightAnchor.constraint(equalTo: redView.widthAnchor).isActive = true

        blueView.anchor(top: redView.topAnchor, leading: redView.trailingAnchor, bottom: redView.bottomAnchor, trailing: view.safeAreaLayoutGuide.trailingAnchor, padding: .init(top: 0, left: 10, bottom: 0, right: 10))
        blueView.anchorSize(to: redView)
        
        let myName = UILabel(frame: CGRect(x: 10, y: 10, width: 100, height: 100))
        myName.text = "Timo"
        myName.font = UIFont(name: "Avenir Next", size: 20)
        blueView.addSubview(myName)
        myName.anchor(top: blueView.topAnchor, leading: blueView.leadingAnchor, bottom: nil, trailing: nil, padding: .init(top: 45, left: 10, bottom: 0, right: 0), size: .init(width: blueView.bounds.width, height: blueView.bounds.height))
        
        let nameInfo = UILabel(frame: CGRect(x: 10, y: 10, width: 100, height: 100))
        nameInfo.text = "I'm from russia"
        nameInfo.font = UIFont(name: "Arial", size: 20)
        blueView.addSubview(nameInfo)
        nameInfo.anchor(top: myName.topAnchor, leading: blueView.leadingAnchor, bottom: nil, trailing: nil, padding: .init(top: myName.bounds.height/2, left: 10, bottom: 0, right: 0), size: .init(width: blueView.bounds.width, height: blueView.bounds.height))
        
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

