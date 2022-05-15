//
//  LottoNumberGenerator.swift
//  Lotto
//
//  Created by nylah.j on 2022/05/08.
//

import Foundation

protocol LottoNumberGenerator {
    func generate() throws -> LottoNumber
}

struct RandomLottoNumberGenerator: LottoNumberGenerator {
    enum Error: LocalizedError {
        case invalidValue
        
        var errorDescription: String? {
            switch self {
            case .invalidValue: return "LottoNumber는 \(minValue)이상 \(maxValue)이하여야 합니다."
            }
        }
    }
                    
    private static let minValue = 1
    private static let maxValue = 45
    private var lottoNumberRange: ClosedRange<Int> { return Self.minValue...Self.maxValue }
    
    func generate() throws -> LottoNumber {
        let randomNumber = Int.random(in: lottoNumberRange)
        guard lottoNumberRange.contains(randomNumber) else {
            throw Error.invalidValue
        }
    
        return .init(randomNumber)
    }
}
