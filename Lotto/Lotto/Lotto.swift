//
//  Lotto.swift
//  Lotto
//
//  Created by nylah.j on 2022/05/08.
//

import Foundation

enum LottoConstant {
    static let minValue = 1
    static let maxValue = 45
    static let numberRange = minValue...maxValue
    static let numberCount = 6
}

class Lotto {
    var numbers: Set<LottoNumber>
    
    init?<LottoNumbers>(numbers: LottoNumbers) where LottoNumbers: Collection, LottoNumbers.Element == Int {
        let lottoNumbers = numbers.map { LottoNumber($0) }
        self.numbers = Set(lottoNumbers)
    }
    
    func validateCount<LottoNumbers>(numbers: LottoNumbers) throws where LottoNumbers: Collection, LottoNumbers.Element == Int {
        let setNumbers = Set(numbers)
        guard setNumbers.count == LottoConstant.numberCount else {
            throw LottoError.invalidNumberCount(setNumbers.count)
        }
    }
    
    func validateRange<LottoNumbers>(numbers: LottoNumbers) throws where LottoNumbers: Collection, LottoNumbers.Element == Int {
        try numbers.forEach {
            try validateRange(number: $0)
        }
    }
    
    func validateRange(number: Int) throws {
        guard LottoConstant.numberRange.contains(number) else {
            throw LottoError.invalidLottoNumber
        }
    }
    
    func contains(number: LottoNumber) -> Bool {
        numbers.contains(number)
    }
}


enum LottoError: Error {
    case invalidNumberCount(Int)
    case invalidLottoNumber
    
    var errorDescription: String? {
        switch self {
        case .invalidNumberCount(let count):
            return "로또 번호 개수는 \(LottoConstant.numberCount)개입니다. 현재 입력된 로또 번호 개수: \(count)"
            
        
        case .invalidLottoNumber:
            return "로또 번호는 \(LottoConstant.minValue)~\(LottoConstant.maxValue) 이내여야 합니다."
        }
    }
}
