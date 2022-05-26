//
//  Lotto - main.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import Foundation

var customer = LottoCustomer()

let inputView = CustomerInputView()
let outputView = CustomerResultView()




if let price = inputView.readPrice() {
    customer.buyLotto(for: price)
    
    outputView.printLottos(of: customer)
    if let prizeNumbers = inputView.readPrizeNumbers() {
        let prizes = customer.lottos.compactMap({
            $0.getPrize(with: prizeNumbers)
        })
        outputView.printStatistics(of: prizes)
    }
    
    
}

