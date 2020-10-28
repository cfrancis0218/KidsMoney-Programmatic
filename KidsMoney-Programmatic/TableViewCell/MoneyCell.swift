//
//  MoneyCell.swift
//  KidsMoney-Programmatic
//
//  Created by Christian Elijah on 2020-10-28.
//

import UIKit

class MoneyCell: UITableViewCell {
    
    
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
        NSLayoutConstraint.activate([
            priceLabel.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 15),
            priceLabel.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 20),
            priceLabel.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -180),
            priceLabel.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -15)
        ])
    }
    
}
