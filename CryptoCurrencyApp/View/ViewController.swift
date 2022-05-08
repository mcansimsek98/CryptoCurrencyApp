//
//  ViewController.swift
//  CryptoCurrencyApp
//
//  Created by Mehmet Can Şimşek on 8.05.2022.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
 
    
    @IBOutlet weak var tableView: UITableView!
    private var cryptoListViewModel : CryptoListViewModel!
    var colorArray = [UIColor]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        navigationController?.navigationBar.topItem?.title = "Crypto Currency"
        getData()
      
        self.colorArray = [
            UIColor(red: 55/255, green: 67/255, blue: 170/255, alpha: 1.0),
            UIColor(red: 175/255, green: 15/255, blue: 74/255, alpha: 1.0),
            UIColor(red: 75/255, green: 54/255, blue: 134/255, alpha: 1.0),
            UIColor(red: 70/255, green: 32/255, blue: 54/255, alpha: 1.0),
            UIColor(red: 124/255, green: 88/255, blue: 97/255, alpha: 1.0),
            UIColor(red: 12/255, green: 167/255, blue: 65/255, alpha: 1.0),
            UIColor(red: 98/255, green: 34/255, blue: 85/255, alpha: 1.0),
            UIColor(red: 138/255, green: 134/255, blue: 97/255, alpha: 1.0),
            UIColor(red: 180/255, green: 157/255, blue: 244/255, alpha: 1.0)
        ]
        
    }

    
    func getData(){
        let url = URL(string: "https://raw.githubusercontent.com/atilsamancioglu/K21-JSONDataSet/master/crypto.json")!
        WebService().dowloadCurrency(url: url) { cryptos in
            if let cryptos = cryptos {
                self.cryptoListViewModel = CryptoListViewModel(cryptoCurrencyList: cryptos)
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
        }
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.cryptoListViewModel == nil ? 0 : self.cryptoListViewModel.numberOfRowsInSection()
        
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CryptoCell", for: indexPath) as! CryptoTableViewCell
        let cryptoViewModel = self.cryptoListViewModel.cryptoAtIndex(indexPath.row)
        cell.priceLabel.text = cryptoViewModel.price
        cell.currencyLabel.text = cryptoViewModel.name
        cell.backgroundColor = self.colorArray[indexPath.row % 6]
        return cell
    }

}

