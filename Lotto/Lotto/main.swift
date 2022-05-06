//
//  Lotto - main.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import Foundation

do {
    ResultView.printOperand(try Calculator.calculate(to: InputView.readExpression()))
}
catch CalculatorError.unSupportedSeparator {
    ResultView.printError(CalculatorError.unSupportedSeparator.message)
}
catch CalculatorError.unSupportedNegativeNumber {
    ResultView.printError(CalculatorError.unSupportedNegativeNumber.message)
}


