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
    private let navbar: UIView = {
        // Adding custom color and size to navbar
        let navigationBar = UIView()
        navigationBar.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        navigationBar.layer.shadowRadius = 8
        navigationBar.layer.shadowOpacity = 0.3
        return navigationBar
    }()
    
    func addCustomNavbar() {
        view.addSubview(navbar)
        navbar.anchor(top: view.topAnchor, leading: view.leadingAnchor, bottom: nil, trailing: view.trailingAnchor, size: .init(width: view.bounds.width, height: 100))
        
        // Adding button to Navbar
        let switchButton = UISwitch()
        navbar.addSubview(switchButton)
        switchButton.anchor(top: navbar.topAnchor, leading: nil, bottom: navbar.bottomAnchor, trailing: navbar.trailingAnchor, padding: .init(top: 50, left: 0, bottom: 10, right: 30))
        
        // Addting title to Navbar
        let title = UITextView()
        title.text = "Tip Calculator"
//        title.font = UIFont.systemFont(ofSize: 15)
        title.font = UIFont.boldSystemFont(ofSize: 32)
        title.backgroundColor = nil
        title.textAlignment = .center
        title.isEditable = false
        title.isScrollEnabled = false
        
        navbar.addSubview(title)
        title.anchor(top: navbar.topAnchor, leading: navbar.leadingAnchor, bottom: navbar.bottomAnchor, trailing: nil, padding: .init(top: 40, left: 30, bottom: 5, right: 0))
        
    }
    private let inputLabelsView: UIView = {
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 0.09553630322, green: 0.04069456336, blue: 0.4362659324, alpha: 1)
        view.layer.cornerRadius = 8;
        view.layer.masksToBounds = true;
        return view
    }()
    
    private let calculateButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Calculate!", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
//        button.setTitleColor(.gray, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        return button
    }()
    
    func addInputViewWithLabels() {
        // Bill amount
        let billTextView = UITextView()
        billTextView.text = "Bill Amount"
        billTextView.font = UIFont.systemFont(ofSize: 20)
        billTextView.backgroundColor = nil
        billTextView.textAlignment = .center
        billTextView.isEditable = false
        billTextView.isScrollEnabled = false
        billTextView.textColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        
        // Bill Input
        let billTextField = UITextField()
        billTextField.text = "$0.00"
        billTextField.textAlignment = .center
        billTextField.font = UIFont.systemFont(ofSize: 15)
        billTextField.borderStyle = UITextField.BorderStyle.roundedRect
        billTextField.autocorrectionType = UITextAutocorrectionType.no
        billTextField.keyboardType = UIKeyboardType.numberPad
        billTextField.returnKeyType = UIReturnKeyType.done
        billTextField.clearButtonMode = UITextField.ViewMode.whileEditing;
        billTextField.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
        
        // Tip percentage
        let tipTextView = UITextView()
        tipTextView.text = "Tip %"
        tipTextView.font = UIFont.systemFont(ofSize: 20)
        tipTextView.backgroundColor = nil
        tipTextView.textAlignment = .center
        tipTextView.isEditable = false
        tipTextView.isScrollEnabled = false
        tipTextView.textColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)

        // Tip Input
        let tipSegment = UISegmentedControl()
        tipSegment.insertSegment(withTitle: "15%", at: 0, animated: true)
        tipSegment.insertSegment(withTitle: "18%", at: 1, animated: true)
        tipSegment.insertSegment(withTitle: "20%", at: 2, animated: true)
        tipSegment.tintColor = #colorLiteral(red: 0.8549019694, green: 0.250980407, blue: 0.4784313738, alpha: 1)
        
        //create toolbar object
        let toolBar: UIToolbar = UIToolbar(frame:CGRect(x: 0, y: 0, width: view.bounds.width, height: 44))
        toolBar.barStyle = UIBarStyle.default
        //add barbuttonitems to toolbar
        let flexsibleSpace: UIBarButtonItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: nil, action: nil) // flexible space to add left end side
        let calc = calculateButton.toBarButtonItem()
        toolBar.items = [flexsibleSpace, calc, flexsibleSpace]
        //assing toolbar as inputAccessoryView
        billTextField.inputAccessoryView = toolBar
        toolBar.sizeToFit()
        
        // Colored View
        view.addSubview(inputLabelsView)
        inputLabelsView.anchor(top: navbar.bottomAnchor, leading: nil, bottom: nil, trailing: nil, padding: .init(top: 20, left: 20, bottom: 0, right: 20), size: .init(width: view.bounds.width - 40, height: view.bounds.height/3.2))
        inputLabelsView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        // Bill stack
        let billStack = UIStackView(arrangedSubviews: [billTextView, billTextField])
        billStack.translatesAutoresizingMaskIntoConstraints = false
        billStack.distribution = .fillEqually
        
        // Tip Stack
        let tipStack = UIStackView(arrangedSubviews: [tipTextView, tipSegment])
        tipStack.translatesAutoresizingMaskIntoConstraints = false
        tipStack.distribution = .fillEqually
        
        // Input Stack
        let inputStack = UIStackView(arrangedSubviews: [billStack, tipStack])
        inputStack.translatesAutoresizingMaskIntoConstraints = false
        inputStack.distribution = .fillEqually
        inputStack.axis = .vertical
        inputStack.spacing = 30
        
        inputLabelsView.addSubview(inputStack)
        inputStack.anchor(top: nil, leading: inputLabelsView.leadingAnchor, bottom: nil, trailing: inputLabelsView.trailingAnchor, padding: .init(top: 0, left: 0, bottom: 0, right: 20))
        inputStack.centerYAnchor.constraint(equalTo: inputLabelsView.centerYAnchor).isActive = true
    }
    
    @objc func didPressDoneButton() {
        print("pressed.")
    }
    // TODO: Second view displaying math results in two labels
    private let outputLabelsView: UIView = {
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        view.layer.borderWidth = 1
        view.layer.borderColor = #colorLiteral(red: 0.8549019694, green: 0.250980407, blue: 0.4784313738, alpha: 1)
        view.layer.cornerRadius = 8;
        view.layer.masksToBounds = true;
        return view
    }()
    
    func addOutputViewWithLabels() {
        // Tip amount
        let tipAmountText = UITextView()
        tipAmountText.text = "Tip Amount"
        tipAmountText.font = UIFont.systemFont(ofSize: 20)
        tipAmountText.backgroundColor = nil
        tipAmountText.textAlignment = .center
        tipAmountText.isEditable = false
        tipAmountText.isScrollEnabled = false
        tipAmountText.textColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)

        let tipOutput = UITextView()
        tipOutput.text = "$0.00"
        tipOutput.font = UIFont.systemFont(ofSize: 20)
        tipOutput.backgroundColor = nil
        tipOutput.textAlignment = .center
        tipOutput.isEditable = false
        tipOutput.isScrollEnabled = false
        tipOutput.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)

        // Total
        let totalText = UITextView()
        totalText.text = "Tip %"
        totalText.font = UIFont.systemFont(ofSize: 20)
        totalText.backgroundColor = nil
        totalText.textAlignment = .center
        totalText.isEditable = false
        totalText.isScrollEnabled = false
        totalText.textColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
        
        // Total Output
        let totalOutput = UITextView()
        totalOutput.text = "$0.00"
        totalOutput.font = UIFont.systemFont(ofSize: 20)
        totalOutput.backgroundColor = nil
        totalOutput.textAlignment = .center
        totalOutput.isEditable = false
        totalOutput.isScrollEnabled = false
        totalOutput.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        
        // Colored View
        view.addSubview(outputLabelsView)
        outputLabelsView.anchor(top: inputLabelsView.bottomAnchor, leading: nil, bottom: nil, trailing: nil, padding: .init(top: 20, left: 20, bottom: 0, right: 20))
        outputLabelsView.anchorSize(to: inputLabelsView)
        outputLabelsView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        
        // Tip stack
        let tipAmountStack = UIStackView(arrangedSubviews: [tipAmountText, tipOutput])
        tipAmountStack.translatesAutoresizingMaskIntoConstraints = false
        tipAmountStack.distribution = .fillEqually

        // Total Stack
        let totalStack = UIStackView(arrangedSubviews: [totalText, totalOutput])
        totalStack.translatesAutoresizingMaskIntoConstraints = false
        totalStack.distribution = .fillEqually

        // Output Stack
        let outputStack = UIStackView(arrangedSubviews: [tipAmountStack, totalStack])
        outputStack.translatesAutoresizingMaskIntoConstraints = false
        outputStack.distribution = .fillEqually
        outputStack.axis = .vertical
        outputStack.spacing = 30

        outputLabelsView.addSubview(outputStack)
        outputStack.anchor(top: nil, leading: outputLabelsView.leadingAnchor, bottom: nil, trailing: outputLabelsView.trailingAnchor, padding: .init(top: 0, left: 0, bottom: 0, right: 20))
        outputStack.centerYAnchor.constraint(equalTo: outputLabelsView.centerYAnchor).isActive = true
    }
    
    // TODO: Button to Reset
    private let resetButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = #colorLiteral(red: 0.09553630322, green: 0.04069456336, blue: 0.4362659324, alpha: 1)
        button.layer.cornerRadius = 8
        return button
    }()
    
    func addResetButton(){
        view.addSubview(resetButton)
        resetButton.anchor(top: outputLabelsView.bottomAnchor, leading: outputLabelsView.leadingAnchor, bottom: view.safeAreaLayoutGuide.bottomAnchor, trailing: outputLabelsView.trailingAnchor, padding: .init(top: 20, left: 0, bottom: 20, right: 0))
        // Button Text
        let resetText = UITextView()
        resetText.text = "RESET"
        resetText.font = UIFont.boldSystemFont(ofSize: 30)
        resetText.backgroundColor = nil
        resetText.textAlignment = .center
        resetText.isEditable = false
        resetText.isScrollEnabled = false
        resetText.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        resetButton.addSubview(resetText)
        resetText.anchor(top: nil, leading: resetButton.leadingAnchor, bottom: nil, trailing: resetButton.trailingAnchor)
        resetText.centerVerticalOfView(to: resetButton)
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addCustomNavbar()
        addInputViewWithLabels()
        addOutputViewWithLabels()
        addResetButton()
        
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
