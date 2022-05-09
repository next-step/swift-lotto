//
//  Converter.swift
//  Lotto
//
//  Created by YooBin Jo on 2022/05/07.
//

import Foundation

final class Converter {
    
    static func convert(_ numbers: [String]) throws -> [Int] {
        try numbers.forEach { number in
            try Validator.check(number)
        }
        
        return numbers.map { return Int($0) ?? 0 }
    }
}
