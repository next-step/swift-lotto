//
//  StringAdditionCaculator.swift
//  Lotto
//
//  Created by jinho jeong on 2022/05/04.
//

import Foundation


final class StringAdditionCaculator {
    
    let validator: StringAdditionValidator = StringAdditionValidator()
    
    func add(string: String) -> Int {
        return 0
    }
    
    private func sum(nums: [Int]) -> Int {
        return 0
    }
    
    private func separate(input: String) -> [String] {
        let numbers = input.components(separatedBy: ",")
        return numbers
    }
}
