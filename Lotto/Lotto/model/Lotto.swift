//
//  Lotto.swift
//  Lotto
//
//  Created by ycsong on 2022/05/06.
//

import Foundation
import AppKit

enum LottoError: LocalizedError {
    case invalidLottoNumber
    case digitError
    case winnerNumberError
    case invalidInput
    case duplicateNumber
    
    var errorDescription: String {
        switch self {
        case .invalidLottoNumber: return "잘못된 로또 번호"
        case .digitError: return "로또 번호 자릿수 오류"
        case .winnerNumberError: return  "잘못된 당첨 번호"
        case .invalidInput: return "사용자 입력 오류"
        case .duplicateNumber: return "중복 당첨 번호"
        }
    }
}

<<<<<<< HEAD
struct LottoNumber: Hashable, Comparable, CustomStringConvertible {
    private let wrapped: Int
    
    var description: String {
        return String(describing: wrapped)
    }
    
    init(_ value: Int) throws {
        guard Constants.defaultLottoRange.contains(value) else {
            throw LottoError.invalidLottoNumber
        }
        self.wrapped = value
    }
    
    static func < (lhs: LottoNumber, rhs: LottoNumber) -> Bool {
        return lhs.wrapped < rhs.wrapped
    }
}

struct LottoNumbers: CustomStringConvertible {
    private let value: [LottoNumber]
    
    var description: String {
        return String(describing: value)
    }
    
    init(numbers: [LottoNumber]) throws {
        guard Constants.defaultLottoCount == numbers.count,
              Constants.defaultLottoCount == Set(numbers).count else {
            throw LottoError.digitError
        }
        self.value = numbers
    }
    
    func contains(_ element: LottoNumber) -> Bool {
        value.contains(element)
    }
    
    func matchCount(from winnerNumbers: LottoNumbers) -> Int {
        value.filter { winnerNumbers.contains($0) }.count
    }
}

struct Lotto: CustomStringConvertible {
    private let value: LottoNumbers
    
    var description: String {
        return String(describing: value)
    }
    
    init(_ value: LottoNumbers) {
        self.value = value
    }
    
    func match(from winnerLotto: WinnerLotto) -> Match {
        let matchBonus = value.contains(winnerLotto.bonusNumber)
        return Match(matchingCount: value.matchCount(from: winnerLotto.numbers), matchBonus: matchBonus)
    }
}

struct WinnerLotto {
    let numbers: LottoNumbers
    let bonusNumber: LottoNumber
    
    init(_ lotto: LottoNumbers, bonus: LottoNumber) throws {
        if lotto.contains(bonus) {
            throw LottoError.duplicateNumber
        }
        self.bonusNumber = bonus
        self.numbers = lotto
    }
}

struct Lottos {
    private let value: [Lotto]
    
    public var count: Int {
        value.count
    }
    
    init(_ lottos: [Lotto]) {
        self.value = lottos
    }
    
    private func placeAll(from winnerLotto: WinnerLotto) -> [Match] {
        return value.map { (lotto) in
            lotto.match(from: winnerLotto)
        }
    }
    
    func placeCount(of rank: Match.Rank, from winnerLotto: WinnerLotto) -> Int {
        return value.filter { (lotto) in
            lotto.match(from: winnerLotto).rank == rank
        }.count
    }
    
    func profit(from winnerLotto: WinnerLotto) -> Double {
        let places = placeAll(from: winnerLotto)
        let amount = (Double) (places.map { $0.reward }.reduce(0, +))
        let price = (Double) (count * Constants.lottoPrice)
        
        return amount / price
=======
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

    init(numbers: LottoNumbers) {
        self.numbers = numbers
        self.result = Match(matchingCount: 0)
    }
    
    func match(from winningNumber: [Int], bonusNumber: Int) {
        let matchingCount = numbers.matchCount(from: winningNumber)
        let hasBonusNumber = numbers.hasBonusNumber(for: bonusNumber)
        self.result = Match(matchingCount: matchingCount, matchBonus: hasBonusNumber)
>>>>>>> yuchansong
    }
}
