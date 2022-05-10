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

enum LottoReward: Int {
    case first = 2_000_000_000
    case second = 30_000_000
    case third = 1_500_000
    case fourth = 50_000
    case fifth = 5_000
    case miss = 0
}

struct Match {
    enum Rank {
        case first, second, third, fourth, fifth
        case miss
    }
    
    let rank: Rank
    var reward: Int {
        switch self.rank {
        case .first: return LottoReward.first.rawValue
        case .second: return LottoReward.second.rawValue
        case .third: return LottoReward.third.rawValue
        case .fourth: return LottoReward.fourth.rawValue
        case .fifth: return LottoReward.fifth.rawValue
        case .miss: return LottoReward.miss.rawValue
        }
    }
    
    init(matchingCount: Int,
         matchBonus: Bool = false) {
        switch matchingCount {
        case 6: self.rank = .first
        case 5 where matchBonus: self.rank = .second
        case 5: self.rank = .third
        case 4: self.rank = .fourth
        case 3: self.rank = .fifth
        default: self.rank = .miss
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

    init (numbers: LottoNumbers) {
        self.numbers = numbers
        self.result = Match(matchingCount: 0)
    }
    
    func match(from winningNumber: [Int], bonusNumber: Int) {
        let matchingCount = numbers.matchCount(from: winningNumber)
        let hasBonusNumber = numbers.hasBonusNumber(for: bonusNumber)
        self.result = Match(matchingCount: matchingCount, matchBonus: hasBonusNumber)
    }
}
