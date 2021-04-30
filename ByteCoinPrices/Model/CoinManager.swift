//
//  CoinManager.swift
//  ByteCoinPrices
//
//  Created by Rauh Andrei on 29.04.2021.
//  Copyright © 2021 Rauh Andrei. All rights reserved.
//

protocol CoinManagerDelegate {
    func uploadDataToUI(price: String, currency: String )
    func didFailWithError(error: Error)
}

import Foundation
struct CoinManager {
    var delegate: CoinManagerDelegate?
    
    let baseURL = "https://rest.coinapi.io/v1/exchangerate/BTC"
    let apiKey = "641A1577-7772-44CC-BA90-7F2A471DF40E"
    
    let currencyArray = ["AUD", "BRL","CAD","CNY","EUR","GBP","HKD","IDR","ILS","INR","JPY","MXN","NOK","NZD","PLN","RON","RUB","SEK","SGD","USD","ZAR"]
    
    
    func getCoinPrice(for currency: String) {
        let urlString = "\(baseURL)/\(currency)?apiKey=\(apiKey)"
        
        if let url = URL(string: urlString) {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { (data, response, error) in
                if error != nil {
                    self.delegate?.didFailWithError(error: error!)
                    return
                }
                if let safeData = data {
                    if let bitcoinPrice = self.parseJSON(safeData) {
                        let bitcoinPriceString = String(format: "%.2f", bitcoinPrice)
                        self.delegate?.uploadDataToUI(price: bitcoinPriceString, currency: currency)
                    }
                }
            }
            task.resume()
        }
    }
    
    
    func parseJSON(_ data: Data) -> Double? {
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode(CoinData.self, from: data)
            let lastPrice = decodedData.rate
            
            return lastPrice
            
        } catch {
            delegate?.didFailWithError(error: error)
            
            return nil
            
        }
    }
}
