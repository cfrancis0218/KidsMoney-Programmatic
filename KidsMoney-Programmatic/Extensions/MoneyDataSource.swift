//
//  MoneyDataSource.swift
//  KidsMoney-Programmatic
//
//  Created by Christian Elijah on 2020-10-27.
//

import Foundation
import UIKit

extension MainView: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        prices.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = moneyTableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! MoneyCell
        cell.priceLabel.text = prices[indexPath.row].price
        cell.priceLabel.textColor = .black
        cell.indexPosition = indexPath.row
        cell.priceLabel.font = UIFont.systemFont(ofSize: 17, weight: .bold)
        cell.addSubview(cell.priceLabel)
        cell.backgroundColor = .clear
        return cell
    }
}
