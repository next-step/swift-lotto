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
    
    func caculate(input: String) {
        do {
            let separatedStringArray: [String] = separate(input: input)
            let numbers: [Int] = try separatedStringArray.map { try validator.validNumber(from: $0)}
            let total: Int = sum(of: numbers)
            printer.printResult(total: total)
        } catch let error as StringAdditionError {
            printer.printError(error: error)
        } catch let error {
            printer.printError(error: error)
        }
    }
    
    private func sum(of numbers: [Int]) -> Int {
        return numbers.reduce(0, +)
    }
    
    private func separate(input: String) -> [String] {
        let separatedStringArray = input.components(separatedBy: CharacterSet(charactersIn: ",:"))
        return separatedStringArray
    }
}

