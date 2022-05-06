//
//  StringAdditionConverter.swift
//  Lotto
//
//  Created by jinho jeong on 2022/05/04.
//

import Foundation

final class StringAdditionConverter {
    
    func convertToInteger(from value: String?) -> Int? {
        guard let value = value else { return nil}
        return Int(value)
    }
}
