//
//  Calculator.swift
//  Lotto
//
//  Created by YooBin Jo on 2022/05/07.
//

import Foundation

final class Calculator {
    
    static func add(_ numbers: [Int]) -> Int {
        var previous: Int = numbers[0]
        var numberIndex: Int = 1
        while numberIndex != numbers.count {
            previous += numbers[numberIndex]
            numberIndex += 1
        }
        
        return previous
    }
    
    
}
