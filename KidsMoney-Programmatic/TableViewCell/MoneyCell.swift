//
//  MoneyCell.swift
//  KidsMoney-Programmatic
//
//  Created by Christian Elijah on 2020-10-28.
//

import UIKit

class MoneyCell: UITableViewCell {
    
    lazy var dollarSignLabel: UILabel = {
        var dollarSign = UILabel()
        dollarSign.textColor = .black
        dollarSign.translatesAutoresizingMaskIntoConstraints = false
        dollarSign.text = "$ "
        dollarSign.font = UIFont.systemFont(ofSize: 17, weight: .regular)
        dollarSign.contentMode = .left
        dollarSign.baselineAdjustment = .alignBaselines
        dollarSign.lineBreakMode = .byTruncatingTail
        dollarSign.translatesAutoresizingMaskIntoConstraints = false
        return dollarSign
    }()
    
    
    lazy var priceLabel: UILabel = {
        var lbl = UILabel(frame: CGRect(x: 0, y: 0, width: 100, height: 20))
        lbl.textColor = .black
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.font = UIFont.systemFont(ofSize: 17, weight: .regular)
        lbl.contentMode = .left
        lbl.baselineAdjustment = .alignBaselines
        lbl.lineBreakMode = .byTruncatingTail
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    var prices: [Prices]?
    var indexPosition: Int?
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .default, reuseIdentifier: reuseIdentifier)
        labelSetup()
        cellSetup()
    }
    
    
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        labelSetup()
        cellSetup()
    }
    
    func cellSetup() {
        selectionStyle = .blue
        accessoryType = .none
        editingAccessoryType = .none
        backgroundColor = .clear
        clipsToBounds = true
        autoresizesSubviews = true
        contentMode = .scaleToFill
        indentationLevel = 1
        
    }
    
    func labelSetup() {
        self.addSubview(priceLabel)
        self.addSubview(dollarSignLabel)
        
        NSLayoutConstraint.activate([
            
            dollarSignLabel.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 15),
            dollarSignLabel.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 20),
            dollarSignLabel.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -180),
            dollarSignLabel.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -15),
            
            priceLabel.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 15),
            priceLabel.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 40),
            priceLabel.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -160),
            priceLabel.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -15)
        ])
    }
    
}
