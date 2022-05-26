//
//  UserLottoRule.swift
//  Lotto
//
//  Created by nylah.j on 2022/05/19.
//

import Foundation

enum UserLottoRule: LottoRuleElement, CaseIterable, LocalizedError {
    case numberCount
    case numberRange
    
    var gerrorDescription: String? {
        switch self {
        case .numberCount:
            return "로또 숫자가 부족합니다."
        case .numberRange:
            return "로또 숫자는 \(LottoConstant.minValue) 이상 \(LottoConstant.maxValue)이하여야 합니다."
        }
    }
    
    func validate<LottoNumbers: Collection>(numbers: LottoNumbers) throws
    where LottoNumbers.Element == Int {
        
        switch self {
        case .numberCount:
            let setNumbers = Set(numbers)
            guard setNumbers.count == LottoConstant.numberCount else { throw self }
        
        case .numberRange:
            let result = numbers.reduce(true) { partialResult, number in
                partialResult && LottoConstant.numberRange.contains(number)
            }
            guard result else { throw self }
        }
    }
}
