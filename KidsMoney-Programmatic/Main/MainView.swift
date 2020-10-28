//
//  ViewController.swift
//  KidsMoney-Programmatic
//
//  Created by Christian Elijah on 2020-10-26.
//

import UIKit

let reuseIdentifer = "cell"

class MainView: UIViewController, AddSavingsProtocol {
    
    var prices: [Prices] = []
    var moneyTableView = MoneyTableView()
    
    let kidsMoneyLabel: UILabel = {
        let label = UILabel()
        label.text = "Kids Money"
        label.numberOfLines = 2
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 45, weight: .bold)
        return label
    }()
    
    let saveButton: UIButton = {
        var button = UIButton()
        button.backgroundColor = UIColor(red: 34 / 255.0, green: 36 / 255.0, blue: 24 / 255.0, alpha: 1.0)
        button.setTitle("SAVE", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
        button.layer.cornerRadius = 12
        button.layer.shadowColor = UIColor(red: 23 / 255.0, green: 24 / 255.0, blue: 26 / 255.0, alpha: 1.0).cgColor
        button.layer.shadowOffset = .zero
        button.layer.shadowOpacity = 0.2
        button.layer.shadowRadius = 6
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
        sMView.layer.shadowColor = UIColor.black.cgColor
        sMView.layer.shadowOpacity = 0.3
        sMView.layer.shadowOffset = .zero
        sMView.layer.shadowRadius = 10
        sMView.backgroundColor = UIColor(red: 23 / 255.0, green: 24 / 255.0, blue: 26 / 255.0, alpha: 1.0)
        return sMView
    }()
    
    let safeSwitch: UISwitch = {
        var aSwitch = UISwitch()
        aSwitch.onTintColor = .systemPink
        aSwitch.isOn = false
        aSwitch.preferredStyle = .sliding
        aSwitch.thumbTintColor = .white
        return aSwitch
    }()
    
    let GreyColor = {
        UIColor(red: 255 / 255.0, green: 255 / 255.0, blue: 255 / 255.0, alpha: 1.0)
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Color
        view.backgroundColor = GreyColor
        navigationSetup()
        viewConstraints()
        delegateSetup()
        // Registry
        moneyTableView.register(MoneyCell.self, forCellReuseIdentifier: "cell")
        // addTargets
        saveButton.addTarget(self, action: #selector(goToSaveScreen), for: .touchUpInside)
        safeSwitch.addTarget(self, action: #selector(safeModeToggle), for: .touchUpInside)
    }
    
    func delegateSetup() {
        self.moneyTableView.delegate = self
        self.moneyTableView.dataSource = self
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = segue.destination as! SaveMoneyScreen
        vc.delegate = self
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
    
    func addSavings(price: String) {
        prices.append(Prices(price: price))
        moneyTableView.reloadData()
    }
    
    
    @objc func goToSaveScreen() {
        let saveMoneyScreen = SaveMoneyScreen()
        saveMoneyScreen.delegate = self
        navigationController?.pushViewController(saveMoneyScreen, animated: true)
    }
    
    private func navigationSetup() {
        navigationController?.isNavigationBarHidden = true
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
            
            moneyTableView.topAnchor.constraint(equalTo: view.topAnchor, constant: 265),
            moneyTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            moneyTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -0),
            moneyTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0),
        ])
    }
}

