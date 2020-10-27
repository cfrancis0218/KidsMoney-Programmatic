//
//  ViewController.swift
//  KidsMoney-Programmatic
//
//  Created by Christian Elijah on 2020-10-26.
//

import UIKit

let reuseIdentifer = "cell"

class MainView: UIViewController, UITableViewDelegate, UITableViewDataSource, AddSavingsProtocol {
    
    var prices: [PricesList] = []
    var moneyTableView = MoneyTableView()
    
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
        self.moneyTableView.delegate = self
        self.moneyTableView.dataSource = self
        // prices.append(PricesList(price: "$ 500"))
        moneyTableView.register(MoneyCell.self, forCellReuseIdentifier: reuseIdentifer)
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
    
    func addSavings(price: String) {
        // MARK: CURRENT PROBLEM
        // Works in viewDidLoad ---> prices.append(PricesList(price: "$ 500"))
        // Doesn't Work prices.append(PricesList(price: price))
        prices.append(PricesList(price: price))
        moneyTableView.reloadData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = segue.destination as! SaveMoneyScreen
        vc.delegate = self
    }
    
    @objc func goToSaveScreen() {
        navigationController?.pushViewController(SaveMoneyScreen(), animated: true)
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
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        prices.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = moneyTableView.dequeueReusableCell(withIdentifier: reuseIdentifer, for: indexPath) as! MoneyCell
        cell.priceLabel.text = prices[indexPath.row].price
        cell.indexPosition =  indexPath.row
        cell.prices = prices
        cell.backgroundColor = .white
        return cell
    }
    
    

}

class MoneyCell: UITableViewCell {
    
    var prices: [PricesList]?
    var indexPosition: Int?
    
    let priceLabel: UILabel = {
        let pricesLabel = UILabel()
        pricesLabel.textColor = .black
        pricesLabel.font = UIFont.systemFont(ofSize: 25, weight: .semibold)
        return pricesLabel
    }()
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupLabel()
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupLabel()
    }
    
    func setupLabel() {
        contentView.addSubview(priceLabel)
        priceLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            priceLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            priceLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            priceLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            priceLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 10)
        ])
    }
}

