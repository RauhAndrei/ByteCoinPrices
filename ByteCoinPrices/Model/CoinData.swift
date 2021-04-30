//
//  CoinData.swift
//  ByteCoinPrices
//
//  Created by Rauh Andrei on 30.04.2021.
//  Copyright © 2021 Rauh Andrei. All rights reserved.
//

import Foundation

//MARK: - Created for decoding data and take Bitcoin rate(price)

struct CoinData: Codable{
    var rate: Double
}
