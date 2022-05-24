//
//  Lotto - main.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import Foundation

var customer = LottoCustomer()

let outputView = CustomerResultView()

print("구입금액을 입력해 주세요.")
if let input = readLine(), let price = Int(input) {
    customer.buyLotto(for: price)
    outputView.printLottos(for: customer)
}

