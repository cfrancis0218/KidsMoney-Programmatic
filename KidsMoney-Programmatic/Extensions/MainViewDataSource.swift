//
//  MainViewDataSource.swift
//  KidsMoney-Programmatic
//
//  Created by Christian Elijah on 2020-10-26.
//

import Foundation
import UIKit



extension MainView: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        prices.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = moneyTableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! MoneyCell
        cell.priceLabel.text = prices[indexPath.row].prices
        cell.indexPosition =  indexPath.row
        cell.prices = prices
        return cell
    }
    
    
}