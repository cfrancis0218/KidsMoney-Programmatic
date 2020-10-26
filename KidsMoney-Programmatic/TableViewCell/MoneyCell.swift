//
//  MoneyCell.swift
//  KidsMoney-Programmatic
//
//  Created by Christian Elijah on 2020-10-26.
//

import UIKit

class MoneyCell: UITableViewCell {

    var priceLabel: UILabel = {
        var pricesLabel = UILabel()
        pricesLabel.text = ""
        pricesLabel.textColor = .black
        pricesLabel.font = UIFont.systemFont(ofSize: 10, weight: .semibold)
        return pricesLabel
    }()
    
    required init?(coder aDecoder: NSCoder) {
        super.init(style: .value1, reuseIdentifier: "cell")
        
        contentView.addSubview(priceLabel)
    }
    
    var prices: [PricesList]?
    var indexPosition: Int?

}
