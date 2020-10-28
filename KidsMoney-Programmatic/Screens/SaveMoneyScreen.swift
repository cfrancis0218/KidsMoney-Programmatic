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
    
    var screenColor =  UIColor(red: 23 / 255.0, green: 24 / 255.0, blue: 26 / 255.0, alpha: 1.0)
    
    var delegate: AddSavingsProtocol?
    
    let amountField = AmountField()
    
    let addButton: UIButton = {
        var button = UIButton()
        button.layer.cornerRadius = 15
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOffset = .zero
        button.layer.shadowRadius = 15
        button.layer.shadowOpacity = 0.3
        button.backgroundColor = UIColor(red: 23 / 255.0, green: 24 / 255.0, blue: 26 / 255.0, alpha: 1.0)
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
            self.delegate?.addSavings(price: amountField.text!)
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
            
            amountField.topAnchor.constraint(equalTo: view.topAnchor, constant: 300),
            amountField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            amountField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            amountField.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -450),
            
            addButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 700),
            addButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            addButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            addButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -40),
        ])
    }
}
