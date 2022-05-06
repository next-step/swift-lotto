//
//  Lotto.swift
//  Lotto
//
//  Created by ycsong on 2022/05/06.
//

enum LottoError: Error {
    case autoGenerateError
}

enum LottoRank: Int {
    case first      = 6
    case second     = 5
    case third      = 4
    case fourth     = 3
    case unknown    = 0
    case bang       = -1
}

enum LottoReward: Int {
    case first = 2000000000
    case second = 1500000
    case third = 50000
    case fourth = 5000
}

class Lotto {
    var numbers: [Int]
    var rank: LottoRank

    init(numbers: [Int], rank: LottoRank = .unknown) {
        self.numbers = numbers
        self.rank = rank
    }
    
    func match(from winningNumber: [Int]) {
        let matchCount = numbers.filter { winningNumber.contains($0) }.count
        self.rank = LottoRank(rawValue: matchCount) ?? .bang
    }
}
