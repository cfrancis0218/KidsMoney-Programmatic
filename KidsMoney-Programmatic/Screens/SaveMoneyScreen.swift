//
//  SaveMoneyScreen.swift
//  KidsMoney-Programmatic
//
//  Created by Christian Elijah on 2020-10-26.
//

import UIKit

protocol AddSavingsProtocol {
    func addSavings(price: String)
}

class SaveMoneyScreen: UIViewController {
    
    var doneButton = UIToolbar()
    
    var screenColor = UIColor.white
    
    var delegate: AddSavingsProtocol?
    
    let amountField: UITextField = {
        let field = UITextField()
        field.backgroundColor = .white
        field.textColor = .black
        field.attributedPlaceholder = NSAttributedString(string: "$ Amount", attributes: [NSAttributedString.Key.foregroundColor: UIColor.black])
        field.borderStyle = .roundedRect
        return field
    }()
    
    let addButton: UIButton = {
        var button = UIButton()
        button.layer.cornerRadius = 15
        button.layer.shadowColor = UIColor.darkGray.cgColor
        button.layer.shadowOffset = .zero
        button.layer.shadowRadius = 15
        button.layer.shadowOpacity = 0.3
        button.backgroundColor = .systemBlue
        button.setTitle("Add Amount", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        itemConstraints()
        doneButtonSetup()
        view.backgroundColor = screenColor
        addButton.addTarget(self, action: #selector(goToRootView), for: .touchUpInside)
    }
    
    @objc func goToRootView() {
        if amountField.text != "" {
            delegate?.addSavings(price: amountField.text!)
            navigationController?.popToRootViewController(animated: true)
        }
    }
    
    private func doneButtonSetup() {
        // Setup
        let done: UIBarButtonItem = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(doneButtonAction))
        // Style
        doneButton.tintColor = .white
        doneButton.barStyle = .default
        // Items
        let items = NSMutableArray()
        items.addObjects(from: [done])
        
        doneButton.items = (items as! [UIBarButtonItem])
        doneButton.sizeToFit()
        
        amountField.inputAccessoryView = doneButton
    }
    
    @objc func doneButtonAction() {
        amountField.resignFirstResponder()
    }
    
    private func itemConstraints() {
        
        self.view.addSubview(amountField)
        amountField.translatesAutoresizingMaskIntoConstraints = false
        
        self.view.addSubview(addButton)
        addButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            
            amountField.topAnchor.constraint(equalTo: view.topAnchor, constant: 200),
            amountField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            amountField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            amountField.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -200),
            
            addButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 650),
            addButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            addButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            addButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -40),
        ])
    }
}
