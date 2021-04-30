//
//  CoinManager.swift
//  ByteCoinPrices
//
//  Created by Rauh Andrei on 29.04.2021.
//  Copyright © 2021 Rauh Andrei. All rights reserved.
//

import Foundation
struct CoinManager {
    
    let baseURL = "https://rest.coinapi.io/v1/exchangerate/BTC/USD"
    let apiKey = "641A1577-7772-44CC-BA90-7F2A471DF40E"
    
    let currencyArray = ["AUD", "BRL","CAD","CNY","EUR","GBP","HKD","IDR","ILS","INR","JPY","MXN","NOK","NZD","PLN","RON","RUB","SEK","SGD","USD","ZAR"]

    
    func getCoinPrice(for currency: String) {
        
    }
    
}
