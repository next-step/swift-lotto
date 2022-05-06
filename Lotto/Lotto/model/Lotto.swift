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
    
    var errorDescription: String {
        switch self {
        case .autoGenerateError: return "로또 번호 자동 생성 오류"
        case .invalidInput: return "사용자 입력 오류"
        }
    }
}

enum LottoRank: Int {
    case first      = 6
    case second     = 5
    case third      = 4
    case fourth     = 3
    case bang       = 0
    case unknown     = -1
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
