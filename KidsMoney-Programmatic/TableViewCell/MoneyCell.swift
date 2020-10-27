//
//  MoneyCell.swift
//  KidsMoney-Programmatic
//
//  Created by Christian Elijah on 2020-10-26.
//

import UIKit



class MoneyCell: UITableViewCell {
    
    var prices: [PricesList]?
    var indexPosition: Int?
    
    let priceLabel: UILabel = {
        let pricesLabel = UILabel()
        pricesLabel.text = "da"
        pricesLabel.textColor = .black
        pricesLabel.font = UIFont.systemFont(ofSize: 5, weight: .semibold)
        return pricesLabel
    }()
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.addSubview(priceLabel)
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: "cell")
        self.addSubview(priceLabel)
    }
}
