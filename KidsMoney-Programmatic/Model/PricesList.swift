//
//  PricesList.swift
//  KidsMoney-Programmatic
//
//  Created by Christian Elijah on 2020-10-26.
//

import Foundation
import UIKit

class PricesList {
    var prices = ""
    
    convenience init(prices: String) {
        self.init()
        self.prices = prices
    }
}
