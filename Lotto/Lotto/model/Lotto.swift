//
//  Lotto.swift
//  Lotto
//
//  Created by ycsong on 2022/05/06.
//

import Foundation
import AppKit

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

struct LottoNumber: Hashable, Comparable, CustomStringConvertible {
    private let wrapped: Int
    
    var description: String {
        return String(describing: wrapped)
    }
    
    init(_ value: Int) throws {
        guard Constants.defaultLottoRange.contains(value) else {
            throw LottoError.autoGenerateError
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
        guard Constants.defaultLottoCount == Set(numbers).count else {
            throw LottoError.duplicateNumber
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
//    let rank: Match.Rank
    
    var description: String {
        return String(describing: value)
    }
    
    init(_ value: LottoNumbers, _ rank: Match.Rank = .miss) {
        self.value = value
//        self.rank = rank
    }
    
    func getRank(winningNumbers: LottoNumbers) -> Match {
        Match(matchingCount: value.matchCount(from: winningNumbers))
    }
}

struct Lottos {
    private var value: [Lotto]
//    private let fifthPlace: Int = 0
    
    init(_ value: [Lotto]) {
        self.value = value
    }
    
    mutating func append(_ v: Lotto) {
        self.value.append(v)
    }
    
    func place(with rank: Match.Rank, winningNumbers: LottoNumbers) -> Int {
        value.map { $0.getRank(winningNumbers: winningNumbers)}.filter { $0.rank == rank}.count
    }
       
}
