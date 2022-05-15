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

struct Lotto {
    enum Error: LocalizedError {
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
    
    let numbers: Set<Int>
    
    init<LottoNumbers: Collection>(numbers: LottoNumbers) throws where LottoNumbers.Element == Int  {
        let setNumbers = Set(numbers)
        
        guard setNumbers.count == LottoConstant.numberCount else {
            throw Error.invalidNumberCount(numbers.count)
        }
        
        let hasValidNumbers = numbers.reduce(true) { partialResult, number in
            partialResult && LottoConstant.numberRange.contains(number)
        }
        if hasValidNumbers == false {
            throw Error.invalidLottoNumber
        }
    
        self.numbers = setNumbers
    }
    
    func equalNumberCount(with lotto: Lotto) -> Int {
        let count = lotto.numbers.filter {
            self.numbers.contains($0)
        }.count
        
        return count
    }
}
