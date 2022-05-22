//
//  StringConverter.swift
//  Lotto
//
//  Created by brian은석 on 2022/05/08.
//

import Foundation

struct StringConverter {
    func split(_ input: String?, sepratedCharacterSet: CharacterSet = [",",":"]) -> [String] {
        guard let input = input else { return [""] }
        guard !input.isEmpty else { return [""] }
        
        return input.components(separatedBy: sepratedCharacterSet)
    }
    
    func stringsToInts(input: [String]) throws -> [Int] {
        var intArray: [Int] = []
        for value in input {
            let intValue = try stringToInt(input:value)
            intArray.append(intValue)
        }
        return intArray
    }
    
    func stringToInt(input: String?) throws -> Int {
        if let inputString = input, let intValue = Int(inputString) {
            return intValue
        }
        throw InputError.invalidNumber
    }
    
}

extension StringConverter {
    func emptyValueChangeZero(inputArray: [String]) -> [String] {
        var changedArray: [String] = []
        for value in inputArray {
            changedArray.append(emptyValueChangeZero(input:value))
        }
        return changedArray
    }
    
    private func emptyValueChangeZero(input: String) -> String {
        if input.isEmpty {
            return "0"
        }
        return input
    }

}
