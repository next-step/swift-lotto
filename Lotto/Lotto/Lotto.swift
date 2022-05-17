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

protocol Lotto {
    var numbers: Set<Int> { get }
    func contains(number: Int) -> Bool 
}

extension Lotto {
    func contains(number: Int) -> Bool {
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
