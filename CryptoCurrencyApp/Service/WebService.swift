//
//  WebService.swift
//  CryptoCurrencyApp
//
//  Created by Mehmet Can Şimşek on 8.05.2022.
//

import Foundation

class WebService {
    func dowloadCurrency(url: URL, completion : @escaping([CryptoCurrency]?) -> ()) {
        URLSession.shared.dataTask(with: url) { data, responce, error in
            if let error = error {
                print(error.localizedDescription)
                completion(nil)
            }else if let data = data {
                
                let cryptoList = try? JSONDecoder().decode([CryptoCurrency].self, from: data)
                    if let cryptoList = cryptoList {
                        completion(cryptoList)
                    }
                
        }
        }.resume()
}
    
}
