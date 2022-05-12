//
//  Lotto.swift
//  Lotto
//
//  Created by ycsong on 2022/05/06.
//

import Foundation

enum LottoError: LocalizedError {
    case autoGenerateError
    case invalidInput
    case duplicateNumber
    
    var errorDescription: String {
        switch self {
        case .autoGenerateError: return "로또 번호 자동 생성 오류"
        case .invalidInput: return "사용자 입력 오류"
        case .duplicateNumber: return "중복 당첨 번호"
        }
    }
}

class LottoNumbers {
    let numbers: [Int]
    
    init(numbers: [Int]) throws {
        if numbers.count != Constants.defaultLottoCount {
            throw LottoError.autoGenerateError
        }
        self.numbers = numbers
    }
    
    func matchCount(from winningNumber: [Int]) -> Int {
        return numbers.filter { winningNumber.contains($0) }.count
    }
    
    func hasBonusNumber(for number: Int) -> Bool {
        return numbers.contains(number)
    }
}

extension LottoNumbers: CustomStringConvertible {
    var description: String {
        return String(describing: numbers)
    }
}

class Lotto {
    let numbers: LottoNumbers
    var result: Match

    init(numbers: LottoNumbers) {
        self.numbers = numbers
        self.result = Match(matchingCount: 0)
    }
    
    func match(from winningNumber: [Int], bonusNumber: Int) {
        let matchingCount = numbers.matchCount(from: winningNumber)
        let hasBonusNumber = numbers.hasBonusNumber(for: bonusNumber)
        self.result = Match(matchingCount: matchingCount, matchBonus: hasBonusNumber)
    }
}
