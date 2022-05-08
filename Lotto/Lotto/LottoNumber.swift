//
//  LottoNumber.swift
//  Lotto
//
//  Created by nylah.j on 2022/05/08.
//

import Foundation

struct LottoNumber {
    enum Error: LocalizedError{
        case invalidValue(Int)
        
        var errorDescription: String? {
            switch self {
            case .invalidValue(let value):
                return "로또 숫자는 1이상 45이하여야 합니다. 잘못된 숫자\(value)"
            }
        }
    }
    
    private static let minValue = 1
    private static let maxValue = 45
    let value: Int
    
    init(value: Int) throws {
        if value < Self.minValue || value > Self.maxValue {
            throw Self.Error.invalidValue(value)
        }
        self.value = value
    }
}
