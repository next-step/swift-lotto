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
    func equalNumberCount(with lotto: Lotto) -> Int
}

extension Lotto {
    func equalNumberCount(with lotto: Lotto) -> Int {
        let count = lotto.numbers.filter {
            self.numbers.contains($0)
        }.count
        
        return count
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

struct WinningLotto: Lotto {
    var numbers: Set<Int>
    let bonusNumber: Int
    
    init<LottoNumbers: Collection>(numbers: LottoNumbers, bonusNumber: Int) throws where LottoNumbers.Element == Int {
        let setNumbers = Set(numbers)
        
        guard setNumbers.count == LottoConstant.numberCount else {
            throw LottoError.invalidNumberCount(numbers.count)
        }
        
        let hasValidNumbers = numbers.reduce(true) { partialResult, number in
            partialResult && LottoConstant.numberRange.contains(number)
        }
        if hasValidNumbers == false {
            throw LottoError.invalidLottoNumber
        }
    
        if bonusNumber < 0 { throw LottoError.invalidLottoNumber }
        self.numbers = setNumbers
        self.bonusNumber = bonusNumber
    }
    
    func checkBonusNumber(in lotto: Lotto) -> Bool {
        let count = lotto.numbers.filter { $0 == bonusNumber }.count
        return count > 0
    }
}

struct DefaultLotto: Lotto {
    let numbers: Set<Int>
    
    init<LottoNumbers: Collection>(numbers: LottoNumbers) throws where LottoNumbers.Element == Int  {
        let setNumbers = Set(numbers)
        
        guard setNumbers.count == LottoConstant.numberCount else {
            throw LottoError.invalidNumberCount(numbers.count)
        }
        
        let hasValidNumbers = numbers.reduce(true) { partialResult, number in
            partialResult && LottoConstant.numberRange.contains(number)
        }
        if hasValidNumbers == false {
            throw LottoError.invalidLottoNumber
        }
    
        self.numbers = setNumbers
    }
}
