//
//  MoneyTableView.swift
//  KidsMoney-Programmatic
//
//  Created by Christian Elijah on 2020-10-26.
//

import UIKit

class MoneyTableView: UITableView {

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        tableSetup()
    }
    
    override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: frame, style: .plain)
        tableSetup()
        
    }
    
    func tableSetup() {
        backgroundColor = .clear
        separatorColor = .black
    }
}
