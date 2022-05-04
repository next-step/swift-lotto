//
//  StringCalculatorInputSplitter.swift
//  Lotto
//
//  Created by 강수진 on 2022/05/04.
//

import Foundation

struct StringCalculatorInputSplitter {
    
    private enum Separator: String, CaseIterable {
        case colon = ":"
        case comma = ","
    }
    
    private let separators: CharacterSet = {
        let joinedSeparator: String = Separator.allCases
            .map { separator in
                separator.rawValue
            }
            .joined()
        return CharacterSet(charactersIn: joinedSeparator)
    }()
    
    func split(_ input: String) -> [String] {
        let splitComponents = input.components(separatedBy: separators)
        return splitComponents
    }
}
