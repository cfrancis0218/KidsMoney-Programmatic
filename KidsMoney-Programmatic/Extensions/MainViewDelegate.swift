//
//  MainViewDelegate.swift
//  KidsMoney-Programmatic
//
//  Created by Christian Elijah on 2020-10-26.
//

import Foundation
import UIKit

extension MainView: UITableViewDelegate {
    
    // Allows Editing
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    // Controls Swipe Check w/ Safe Switch
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        if safeSwitch.isOn {
            return nil
        } else {
            let deleteAction = UIContextualAction(style: .destructive, title: "Delete") { _, _, complete in
                self.prices.remove(at: indexPath.row)
                self.moneyTableView.deleteRows(at: [indexPath], with: .automatic)
                complete(true)
            }
            
            deleteAction.backgroundColor = UIColor.systemGray6
            
            let config = UISwipeActionsConfiguration(actions: [deleteAction])
            config.performsFirstActionWithFullSwipe = true
            return config
        }
    }
}
