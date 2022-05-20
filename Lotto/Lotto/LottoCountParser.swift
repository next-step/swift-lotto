//
//  LottoCountParser.swift
//  Lotto
//
//  Created by nylah.j on 2022/05/20.
//

import Foundation

enum LottoCountParser {
    enum Error: LocalizedError {
        case invalid
        
        var errorDescription: String? {
            switch self {
            case .invalid: return "로또 개수는 0개 이상이어야 합니다."
            }
        }
    }
    
    static func parse(_ lottoCountInput: String?) throws -> LottoCount {
        guard let input = lottoCountInput,
              let lottoCountValue = Int(input),
              let lottoCount = LottoCount(lottoCountValue) else {
                  throw Error.invalid
              }
        return lottoCount
    }
}
