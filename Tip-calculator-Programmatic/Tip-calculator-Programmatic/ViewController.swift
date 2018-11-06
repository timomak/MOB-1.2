//
//  ViewController.swift
//  Programmatic-Tip-Calculator
//
//  Created by timofey makhlay on 11/1/18.
//  Copyright © 2018 Timofey Makhlay. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var darkMode = false
    
    private let navbar: UIView = {
        // Adding custom color and size to navbar
        let navigationBar = UIView()
        navigationBar.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        navigationBar.layer.shadowRadius = 8
        navigationBar.layer.shadowOpacity = 0.3
        return navigationBar
    }()

    // Addting title to Navbar
    let viewNavbarTitle: UITextView = {
        var title = UITextView()
        title.text = "Tip Calculator"
        title.font = UIFont.boldSystemFont(ofSize: 32)
        title.backgroundColor = nil
        title.textAlignment = .center
        title.isEditable = false
        title.isScrollEnabled = false
        return title
    }()
    
    private let inputLabelsView: UIView = {
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 0.09553630322, green: 0.04069456336, blue: 0.4362659324, alpha: 1)
        view.layer.cornerRadius = 8;
        view.layer.masksToBounds = true;
        return view
    }()
    
    // Bill amount
    let billTextView: UITextView = {
        let textView = UITextView()
        textView.text = "Bill Amount"
        textView.font = UIFont.systemFont(ofSize: 20)
        textView.backgroundColor = nil
        textView.textAlignment = .center
        textView.isEditable = false
        textView.isSelectable = false
        textView.isScrollEnabled = false
        textView.textColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        return textView
    }()
    
    // Bill Input
    let billTextField: UITextField = {
        let textField = UITextField()
        textField.text = "$0.00"
        textField.textAlignment = .center
        textField.font = UIFont.systemFont(ofSize: 15)
        textField.borderStyle = UITextField.BorderStyle.roundedRect
        textField.autocorrectionType = UITextAutocorrectionType.no
        textField.keyboardType = UIKeyboardType.numberPad
        textField.returnKeyType = UIReturnKeyType.done
        textField.clearButtonMode = UITextField.ViewMode.whileEditing;
        textField.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
        return textField
    }()
    // Tip percentage
    let tipTextView: UITextView = {
        let textView = UITextView()
        textView.text = "Tip %"
        textView.font = UIFont.systemFont(ofSize: 20)
        textView.backgroundColor = nil
        textView.textAlignment = .center
        textView.isEditable = false
        textView.isSelectable = false
        textView.isScrollEnabled = false
        textView.textColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        return textView
    }()
    
    // Tip Input
    let tipSegment: UISegmentedControl = {
        let segment = UISegmentedControl()
        segment.insertSegment(withTitle: "15%", at: 0, animated: true)
        segment.insertSegment(withTitle: "18%", at: 1, animated: true)
        segment.insertSegment(withTitle: "20%", at: 2, animated: true)
        segment.tintColor = #colorLiteral(red: 0.8549019694, green: 0.250980407, blue: 0.4784313738, alpha: 1)
        segment.addTarget(self, action: #selector(didPresscalculateButton), for:.allEvents)
        return segment
    }()
    
    private let outputLabelsView: UIView = {
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        view.layer.borderWidth = 1
        view.layer.borderColor = #colorLiteral(red: 0.8549019694, green: 0.250980407, blue: 0.4784313738, alpha: 1)
        view.layer.cornerRadius = 8;
        view.layer.masksToBounds = true;
        return view
    }()
    // Tip amount
    let tipAmountText: UITextView = {
        let textView = UITextView()
        textView.text = "Tip Amount"
        textView.font = UIFont.systemFont(ofSize: 20)
        textView.backgroundColor = nil
        textView.textAlignment = .center
        textView.isEditable = false
        textView.isSelectable = false
        textView.isScrollEnabled = false
        textView.textColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
        return textView
    }()
    let tipOutput: UITextView = {
        let textView = UITextView()
        textView.text = "$0.00"
        textView.font = UIFont.systemFont(ofSize: 20)
        textView.backgroundColor = nil
        textView.textAlignment = .center
        textView.isEditable = false
        textView.isSelectable = false
        textView.isScrollEnabled = false
        textView.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        return textView
    }()
    
    // Total
    let totalText: UITextView = {
        let textView = UITextView()
        textView.text = "Total"
        textView.font = UIFont.systemFont(ofSize: 20)
        textView.backgroundColor = nil
        textView.textAlignment = .center
        textView.isEditable = false
        textView.isSelectable = false
        textView.isScrollEnabled = false
        textView.textColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
        return textView
    }()
    
    // Total Output
    let totalOutput: UITextView = {
        let textView = UITextView()
        textView.text = "$0.00"
        textView.font = UIFont.systemFont(ofSize: 20)
        textView.backgroundColor = nil
        textView.textAlignment = .center
        textView.isEditable = false
        textView.isSelectable = false
        textView.isScrollEnabled = false
        textView.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        return textView
    }()
    
    // Reset Button
    private let resetButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = #colorLiteral(red: 0.09553630322, green: 0.04069456336, blue: 0.4362659324, alpha: 1)
        button.layer.cornerRadius = 8
        button.setTitle("RESET",for: .normal)
        button.addTarget(self, action: #selector(didPressResetButton), for: .touchUpInside)
        return button
    }()
    
    private let calculateButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .lightmodeOutline
        button.layer.cornerRadius = 8
        button.setTitle("CALCULATE",for: .normal)
        button.addTarget(self, action: #selector(didPresscalculateButton), for: .touchUpInside)
        return button
    }()
    
    private let calculateButtonInKeyboard: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Calculate!", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.addTarget(self, action: #selector(didPresscalculateButton), for: .touchUpInside)
        return button
    }()
    
    
    func addCustomNavbar() {
        view.addSubview(navbar)
        navbar.anchor(top: view.topAnchor, leading: view.leadingAnchor, bottom: nil, trailing: view.trailingAnchor, size: .init(width: view.bounds.width, height: 100))
        
        // Adding button to Navbar
        let switchButton = UISwitch()
        switchButton.addTarget(self, action: #selector(switchValueDidChange), for: .valueChanged)

        navbar.addSubview(switchButton)
        switchButton.anchor(top: navbar.topAnchor, leading: nil, bottom: navbar.bottomAnchor, trailing: navbar.trailingAnchor, padding: .init(top: 50, left: 0, bottom: 10, right: 30))
        

        navbar.addSubview(viewNavbarTitle)
        viewNavbarTitle.anchor(top: navbar.topAnchor, leading: navbar.leadingAnchor, bottom: navbar.bottomAnchor, trailing: nil, padding: .init(top: 40, left: 30, bottom: 5, right: 0))
        
    }
    
    func addInputViewWithLabels() {
        //Create toolbar
        let toolBar: UIToolbar = UIToolbar(frame:CGRect(x: 0, y: 0, width: view.bounds.width, height: 44))
        toolBar.barStyle = UIBarStyle.default
        // Add barbuttonitems to toolbar
        let flexsibleSpace: UIBarButtonItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: nil, action: nil)
        let calc = calculateButtonInKeyboard.toBarButtonItem()
        toolBar.items = [flexsibleSpace, calc, flexsibleSpace]
        billTextField.inputAccessoryView = toolBar
        toolBar.sizeToFit()
        
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

    func addOutputViewWithLabels() {
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
    
    func addResetButton(){
//        view.addSubview(resetButton)
//        resetButton.anchor(top: outputLabelsView.bottomAnchor, leading: outputLabelsView.leadingAnchor, bottom: view.safeAreaLayoutGuide.bottomAnchor, trailing: outputLabelsView.trailingAnchor, padding: .init(top: 20, left: 0, bottom: 20, right: 0))
//
        
        // Buttons Stack
        let buttonsStack = UIStackView(arrangedSubviews: [resetButton, calculateButton])
        buttonsStack.translatesAutoresizingMaskIntoConstraints = false
        buttonsStack.distribution = .fillEqually
        buttonsStack.axis = .horizontal
        buttonsStack.spacing = 20
        
        view.addSubview(buttonsStack)
        buttonsStack.anchor(top: outputLabelsView.bottomAnchor, leading: outputLabelsView.leadingAnchor, bottom: view.safeAreaLayoutGuide.bottomAnchor, trailing: outputLabelsView.trailingAnchor, padding: .init(top: 20, left: 0, bottom: 20, right: 0))

    }
    func reloadView() {
        addCustomNavbar()
        addInputViewWithLabels()
        addOutputViewWithLabels()
        addResetButton()
    }
    func setDarkTheme(isDark: Bool){
        if isDark == true {
            view.backgroundColor = .darkmodeFoundation

            navbar.backgroundColor = .darkmodeBase
            viewNavbarTitle.textColor = .white

            inputLabelsView.backgroundColor = .darkmodeBase

            billTextField.tintColor = .white
            tipSegment.tintColor = .darkmodeOutline

            outputLabelsView.backgroundColor = .darkmodeFoundation
            outputLabelsView.layer.borderColor = #colorLiteral(red: 0.3445012569, green: 0.8545694351, blue: 0.6445240378, alpha: 1)

            tipAmountText.textColor = .white
            tipOutput.textColor = .white

            totalText.textColor = .white
            totalOutput.textColor = .white


            resetButton.backgroundColor = .darkmodeBase
            calculateButton.backgroundColor = .darkmodeBase
            calculateButton.layer.borderWidth = 1
            calculateButton.layer.borderColor = #colorLiteral(red: 0.3445012569, green: 0.8545694351, blue: 0.6445240378, alpha: 1)
        }
        else {
            view.backgroundColor = .lightmodeFoundation
            
            navbar.backgroundColor = .lightmodeFoundation
            viewNavbarTitle.textColor = .black
            
            inputLabelsView.backgroundColor = .lightmodeBase
            
            billTextField.tintColor = .black
            tipSegment.tintColor = .lightmodeOutline
            
            outputLabelsView.backgroundColor = .lightmodeFoundation
            outputLabelsView.layer.borderColor = #colorLiteral(red: 0.8549019694, green: 0.250980407, blue: 0.4784313738, alpha: 1)

            
            tipAmountText.textColor = .black
            tipOutput.textColor = .black
            
            totalText.textColor = .black
            totalOutput.textColor = .black
            
            
            resetButton.backgroundColor = .lightmodeBase
            calculateButton.backgroundColor = .lightmodeOutline
            calculateButton.layer.borderWidth = 0
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        reloadView()
        hideKeyboardWhenTappedAround()
    }
    
    // Color switch function button
    @objc func switchValueDidChange() {
        if darkMode == false {
            darkMode = true
        } else {
            darkMode = false
        }
        setDarkTheme(isDark: darkMode)
    }
    
    // Calulate Button Pressed
    @objc func didPresscalculateButton() {
        print("Calculate Button pressed")
        view.endEditing(true)
        let billAmount = Double(billTextField.text!) ?? 0.00
        var tipAmount = 0.00
        if tipSegment.selectedSegmentIndex == 0 {
            tipAmount = 0.15
        }
        else if tipSegment.selectedSegmentIndex == 1 {
            tipAmount = 0.18
        }
        else if tipSegment.selectedSegmentIndex == 2 {
            tipAmount = 0.20
        }
        tipOutput.text = "$" + (String(format: "%.2f", billAmount * tipAmount) ?? "$0.00")
        totalOutput.text = "$" + (String(format: "%.2f", (billAmount * tipAmount) + billAmount) ?? "$0.00")
    }
    
    @objc func didPressResetButton() {
        print("pressed.")
        billTextField.text = "$0.00"
        tipSegment.isSelected = false
        tipOutput.text = "$0.00"
        totalOutput.text = "$0.00"
    }
    
}
