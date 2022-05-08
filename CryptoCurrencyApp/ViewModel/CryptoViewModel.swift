//
//  CryptoViewModel.swift
//  CryptoCurrencyApp
//
//  Created by Mehmet Can Şimşek on 8.05.2022.
//

import Foundation

struct CryptoListViewModel {
    let cryptoCurrencyList : [CryptoCurrency]
    
}

struct CryptoViewModel {
    let cryptoCurrency : CryptoCurrency
    
}


extension CryptoListViewModel {
    func numberOfRowsInSection() -> Int {
        return self.cryptoCurrencyList.count
    }
    func cryptoAtIndex(_ index: Int) -> CryptoViewModel {
        let crypto = self.cryptoCurrencyList[index]
        return CryptoViewModel(cryptoCurrency: crypto)
    }
}

extension CryptoViewModel {
    var name : String {
        return self.cryptoCurrency.currency
    }
    var price : String {
        return self.cryptoCurrency.price
    }
}
