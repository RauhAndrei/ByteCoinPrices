//
//  ViewController.swift
//  ByteCoinPrices
//
//  Created by Rauh Andrei on 29.04.2021.
//  Copyright © 2021 Rauh Andrei. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
let coinManager = CoinManager()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        currencyPicker.dataSource = self
        currencyPicker.delegate = self
    }


    @IBOutlet weak var bitcoinLabel: UILabel!
    @IBOutlet weak var currencyLabel: UILabel!
    @IBOutlet weak var currencyPicker: UIPickerView!
}

extension ViewController: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return coinManager.currencyArray.count
    }
}


extension ViewController: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return coinManager.currencyArray[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let selectedCurrency = coinManager.currencyArray[row]
        coinManager.getCoinPrice(for: selectedCurrency)
    }
    
}

