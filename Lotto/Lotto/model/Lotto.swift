//
//  Lotto.swift
//  Lotto
//
//  Created by ycsong on 2022/05/06.
//

import Foundation

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
    }
}
