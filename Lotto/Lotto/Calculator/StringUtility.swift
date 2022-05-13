//
//  StringUtility.swift
//  Lotto
//
//  Created by 카카오VX on 2022/04/29.
//

import Foundation

struct StringUtiltity {
    static func convertStringArrayToIntArray(to stringArray: [String]) -> [Int] {
        stringArray.map { Int($0) ?? 0 }
    }
    
    static func convertSeparator(to inputExpression: String) -> String {
        inputExpression.replacingOccurrences(of: ":", with: ",")
    }
    
    static func splitExpression(to convertedExpression: String) -> [String] {
        convertedExpression.components(separatedBy: ",")
    }
    
    static func convertStringAmountToInt(to input: String) -> Int {
        let amount: Int = Int(input) ?? 0
        return amount / 1000
    }
    
    static func splitLottoNumbers(to convertedExpression: String) throws -> Set<Int> {
        let splited = convertedExpression.components(separatedBy: ", ").map { Int($0) ?? 0 }
        guard splited.count == 6 else { throw LottoError.invalidManualNumber }
        let result = Set(splited.map { $0 })
        guard result.count == 6 else { throw LottoError.duplicateInput }
        
        return result
    }
}
