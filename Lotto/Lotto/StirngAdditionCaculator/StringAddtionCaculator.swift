//
//  StringAdditionCaculator.swift
//  Lotto
//
//  Created by jinho jeong on 2022/05/04.
//

import Foundation


final class StringAdditionCaculator {
    
    let validator: StringAdditionValidator = StringAdditionValidator()
    let printer: StringAdditionPrinter = StringAdditionPrinter()
    func add(string: String) {
        do {
            let strings = separate(input: string)
            let positiveNumbers: [Int] = try strings.map { try validator.checkValidationIncorrectString(string: $0)}
            let totalSum = sum(nums: positiveNumbers)
            printer.printResult(sum: totalSum)
        } catch let error {
            printer.printError(error: error as! StringAdditionError)
        }
    }
    
    private func sum(nums: [Int]) -> Int {
        return nums.reduce(0, +)
    }
    
    private func separate(input: String) -> [String] {
        let numbers = input.components(separatedBy: ",")
        return numbers
    }
}
