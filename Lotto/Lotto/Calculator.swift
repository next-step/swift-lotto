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
    case valueIsInvalid
}

struct Calculator {
    func calculate(input: String) throws -> Int {
        let splitInput = split(input: input)
        
        return try add(input: splitInput)
    }
    
    func split(input: String) -> [String] {
        input.components(separatedBy: CharacterSet(charactersIn: SplitOption.combineSplitOption()))
    }
    
    func add(input: [String]) throws -> Int {
        let convertedValue = convertInputToInt(input: input)
        
        try convertedValue.forEach { num in
            try checkInputValid(input: num)
        }
        
        let result = convertedValue.reduce(0) { prev, next in
            prev + next
        }
        
        return result
    }
    
    private func checkInputValid(input: Int) throws {
        guard input > 0 else { throw InputError.valueIsInvalid }
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
