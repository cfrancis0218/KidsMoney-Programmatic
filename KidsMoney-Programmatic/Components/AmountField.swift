//
//  AmountField.swift
//  KidsMoney-Programmatic
//
//  Created by Christian Elijah on 2020-10-27.
//

import UIKit

class AmountField: UITextField, UITextFieldDelegate {

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        fieldSetup()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        fieldSetup()
    }
    
    func fieldSetup() {
        isEnabled = true
        backgroundColor = .white
        textColor = .black
        attributedPlaceholder = NSAttributedString(string: "$ Amount", attributes: [NSAttributedString.Key.foregroundColor: UIColor.black])
        borderStyle = .roundedRect
    }
}
