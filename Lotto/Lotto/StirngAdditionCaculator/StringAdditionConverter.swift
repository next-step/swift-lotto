//
//  StringAdditionConverter.swift
//  Lotto
//
//  Created by jinho jeong on 2022/05/04.
//

import Foundation

final class StringAdditionConverter {
    
    func convertToInteger(from string: String?) -> Int? {
        guard let string = string else { return nil}
        return  Int(string)
    }
}
