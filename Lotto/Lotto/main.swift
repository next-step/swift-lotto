//
//  Lotto - main.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import Foundation

do {
    ResultView.printOperand(try Calculator.calculate(to: InputView.readExpression()))
}
catch {
    print(CalculatorError.unSupportedNegativeNumber.message)
}


