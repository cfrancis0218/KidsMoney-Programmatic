//
//  PricesList.swift
//  KidsMoney-Programmatic
//
//  Created by Christian Elijah on 2020-10-26.
//

import Foundation
import UIKit

class PricesList {
    var price = ""
    
    convenience init(price: String) {
        self.init()
        self.price = price
    }
}
