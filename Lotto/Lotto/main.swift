//
//  Lotto - main.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import Foundation

guard let input = InputView.readMoney(),
      let intInput = Int(input),
      let money = Money(value: intInput) else {
          OutputView.printMoneyError()
          exit(0)
      }


