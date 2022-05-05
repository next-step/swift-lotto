//
//  Lotto - main.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import Foundation

do {
    let inputStr: String = "1,2:3"
    let inputStrArray: Array<String> = inputStr.components(separatedBy: CharacterSet(charactersIn: ",:"))
    let integerArray: Array<Int> = try inputStrArray.map { (value) in
        return try Validator.validNumber(from: value)
    }

    let result = StringCalculator.sum(of: integerArray)
    print("결과: \(result)")
} catch let error as StringCalculatorError {
    print(error.localizedDescription)
}
