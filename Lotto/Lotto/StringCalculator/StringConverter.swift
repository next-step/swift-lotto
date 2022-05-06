//
//  StringConverter.swift
//  Lotto
//
//  Created by 강수진 on 2022/05/05.
//

import Foundation

struct StringConverter {
    private enum StringConverterError: Error {
        case convertToIntFail
    }
    
    func convertToInt(from input: String?) throws -> Int {
        guard let input = input,
            let result = Int(input) else {
            throw StringConverterError.convertToIntFail
        }
        return result
    }
}
