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
}
