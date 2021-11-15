//
//  Calculator.swift
//  Lotto
//
//  Created by 조민호 on 2021/11/12.
//

import Foundation

enum SplitOption: String, CaseIterable {
    case comma = ","
    case colon = ":"
    
    static func combineSplitOption() -> String {
        allCases.map { ($0.rawValue) }.joined()
    }
}

enum InputError: Error {
    case valueIsNegativeOrNotInteger
}

struct Calculator {
    private let defaultNumber: Int = 1
    
    func calculate(input: String?) throws -> Int {
        guard checkInputValueIsNilOrEmpty(input: input) == defaultNumber else {
            return 0
        }
        
        let splitInput = split(input: input ?? "")
        
        return try add(input: splitInput)
    }
    
    private func split(input: String) -> [String] {
        input.components(separatedBy: CharacterSet(charactersIn: SplitOption.combineSplitOption()))
    }
    
    private func add(input: [String]) throws -> Int {
        let convertedValue = convertInputToInt(input: input)
        
        try convertedValue.forEach { num in
            try checkInputValueIsMinusOrNotInteger(input: num)
        }
        
        let result = convertedValue.reduce(0) { prev, next in
            prev + next
        }
        
        return result
    }
    
    private func checkInputValueIsNilOrEmpty(input: String?) -> Int {
        guard let input = input else {
            return 0
        }

        guard input.isNotEmpty else {
            return 0
        }
        
        return defaultNumber
    }
    
    private func checkInputValueIsMinusOrNotInteger(input: Int) throws {
        guard input > 0 else { throw InputError.valueIsNegativeOrNotInteger }
    }
    
    private func convertInputToInt(input: [String]) -> [Int] {
        input.compactMap { num in
            Int(num)
        }
    }
}

fileprivate extension Collection {
    /// 현재 쓰지 않지만 리뷰어님의 피드백을 듣고 만들어 보았습니다!
    var isNotEmpty: Bool {
        return !self.isEmpty
    }
}
