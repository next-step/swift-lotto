//
//  Lotto - main.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import Foundation

do {
    let input = InputView.readInput()
    
    let splitter = Splitter()
    let inputParser = InputParser(splitter: splitter, numberGenerator: PositiveNumberGenerator.self)
    let operands = try inputParser.parse(input: input)
    
    var plusOperator = [Operator]()
    for _ in 0..<operands.count - 1 {
        plusOperator.append(Plus())
    }
    
    let result = Calculator().calculate(operands: operands, operators: plusOperator)
    OutputView.print(result)
} catch(let error) {
    print(error.localizedDescription)
}







