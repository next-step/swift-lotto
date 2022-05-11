//
//  LottoNumber.swift
//  Lotto
//
//  Created by nylah.j on 2022/05/08.
//

import Foundation

struct LottoNumber: Hashable {
    enum Error: LocalizedError {
        case invalidValue
        
        var errorDescription: String? {
            switch self {
            case .invalidValue: return "LottoNumber는 \(LottoNumber.minValue)이상 \(LottoNumber.maxValue)이하여야 합니다."
            }
        }
    }
                    
    static let minValue = 1
    static let maxValue = 45
    
    let value: Int
    
    init?(_ value: Int) {
        guard (LottoNumber.minValue...LottoNumber.maxValue).contains(value) else {
            return nil
        }
        
        self.value = value
    }
}
