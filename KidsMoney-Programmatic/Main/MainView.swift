//
//  ViewController.swift
//  KidsMoney-Programmatic
//
//  Created by Christian Elijah on 2020-10-26.
//

import UIKit

class MainView: UIViewController, AddSavingsProtocol {
    
    var prices: [PricesList] = []
    
    let moneyTableView: UITableView = {
        var tableView = UITableView()
        tableView.backgroundColor = .white
        tableView.separatorColor = .black
        return tableView
    }()
    
    let kidsMoneyLabel: UILabel = {
        let label = UILabel()
        label.text = "Kids Money"
        label.numberOfLines = 2
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 45, weight: .black)
        return label
    }()
    
    let saveButton: UIButton = {
        var button = UIButton()
        button.backgroundColor = .systemBlue
        button.setTitle("SAVE", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 15, weight: .bold)
        button.layer.cornerRadius = 12
        button.layer.shadowColor = UIColor.lightGray.cgColor
        return button
    }()
    
    let safeModeText: UILabel = {
        var sMText = UILabel()
        sMText.text = "Safe Mode"
        sMText.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
        sMText.textColor = .white
        return sMText
    }()
    
    let safeModeView: UIView = {
        var sMView = UIView()
        sMView.layer.cornerRadius = 10
        sMView.layer.shadowColor = UIColor.darkGray.cgColor
        sMView.layer.shadowOpacity = 0.3
        sMView.layer.shadowOffset = .zero
        sMView.layer.shadowRadius = 10
        sMView.backgroundColor = .systemBlue
        return sMView
    }()
    
    let safeSwitch: UISwitch = {
        var aSwitch = UISwitch()
        aSwitch.onTintColor = .systemGray6
        aSwitch.isOn = false
        aSwitch.preferredStyle = .sliding
        aSwitch.thumbTintColor = .white
        return aSwitch
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationSetup()
        viewConstraints()
        view.backgroundColor = .white
        
        moneyTableView.delegate = self
        moneyTableView.dataSource = self
        
        moneyTableView.register(MoneyCell.self, forCellReuseIdentifier: "cell")
        
        // addTargets
        saveButton.addTarget(self, action: #selector(goToSaveScreen), for: .touchUpInside)
        safeSwitch.addTarget(self, action: #selector(safeModeToggle), for: .touchUpInside)
    }
    @objc func safeModeToggle() {
        if safeSwitch.isOn {
            let alertController = UIAlertController(title: "Safe Mode Activated", message: "", preferredStyle: .actionSheet)
            let closeAction = UIAlertAction(title: "Close", style: .cancel, handler: nil)
            alertController.addAction(closeAction)
            self.present(alertController, animated: true, completion: nil)
        } else {
            let alertController = UIAlertController(title: "Safe Mode Deactivated", message: "", preferredStyle: .actionSheet)
            let closeAction = UIAlertAction(title: "Close", style: .cancel, handler: nil)
            alertController.addAction(closeAction)
            self.present(alertController, animated: true, completion: nil)
        }
    }
    
    func addSaving(price: String) {
        prices.append(PricesList(prices: price))
        moneyTableView.reloadData()
    }
    
    @objc func goToSaveScreen() {
        navigationController?.pushViewController(SaveMoneyScreen(), animated: true)
    }
    
    private func navigationSetup() {
        navigationController?.isNavigationBarHidden = true
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = segue.destination as! SaveMoneyScreen
        vc.delegate = self
    }
    
    private func viewConstraints() {
        
        self.view.addSubview(kidsMoneyLabel)
        kidsMoneyLabel.translatesAutoresizingMaskIntoConstraints = false
        
        self.view.addSubview(moneyTableView)
        moneyTableView.translatesAutoresizingMaskIntoConstraints = false
        
        self.view.addSubview(saveButton)
        saveButton.translatesAutoresizingMaskIntoConstraints = false
        
        self.view.addSubview(safeModeView)
        safeModeView.translatesAutoresizingMaskIntoConstraints = false
        
        self.view.addSubview(safeSwitch)
        safeSwitch.translatesAutoresizingMaskIntoConstraints = false
        
        self.view.addSubview(safeModeText)
        safeModeText.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            
            kidsMoneyLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 40),
            kidsMoneyLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            kidsMoneyLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -200),
            kidsMoneyLabel.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -650),
            
            saveButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 40),
            saveButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            saveButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 250),
            saveButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -720),
            
            safeModeView.topAnchor.constraint(equalTo: view.topAnchor, constant: 200),
            safeModeView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            safeModeView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 10),
            safeModeView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -560),
            
            safeModeText.topAnchor.constraint(equalTo: view.topAnchor, constant: 200),
            safeModeText.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            safeModeText.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -150),
            safeModeText.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -560),
            
            safeSwitch.topAnchor.constraint(equalTo: view.topAnchor, constant: 210),
            safeSwitch.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 320),
            safeSwitch.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            safeSwitch.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -560),
            
            moneyTableView.topAnchor.constraint(equalTo: view.topAnchor, constant: 222),
            moneyTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            moneyTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -0),
            moneyTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0),
        ])
    }


}

