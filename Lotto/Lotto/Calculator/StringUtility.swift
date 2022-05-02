//
//  StringUtility.swift
//  Lotto
//
//  Created by 카카오VX on 2022/04/29.
//

import Foundation

struct StringUtiltity {
    static func convertSeparator(to inputExpression: String) -> String {
        inputExpression.replacingOccurrences(of: ":", with: ",")
    }
    
    static func splitExpression(to convertedExpression: String) -> [Int] {
        convertedExpression.components(separatedBy: ",").map { Int($0) ?? 0 }
    }
    
    static func convertStringAmountToInt(to input: String) -> Int {
        let amount: Int = Int(input) ?? 0
        return amount / 1000
    }
    
    static func splitLottoNumbers(to convertedExpression: String) -> [Int] {
        convertedExpression.components(separatedBy: ", ").map { Int($0) ?? 0 }
    }
}
