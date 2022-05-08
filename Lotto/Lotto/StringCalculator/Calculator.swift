//
//  StringCalculator.swift
//  Lotto
//
//  Created by brian은석 on 2022/05/07.
//

import Foundation

struct Calculator {
    func sum(_ input: [Int]) -> Int {
        return input.reduce(0, +)
    }
    
}
