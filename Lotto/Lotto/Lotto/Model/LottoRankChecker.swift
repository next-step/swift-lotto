//
//  LottoRankChecker.swift
//  Lotto
//
//  Created by 강수진 on 2022/05/06.
//

import Foundation

struct LottoRankChecker {
    
    let winningNumbers: [Int]
    
    init(winningNumbers: [Int]) throws {
        self.winningNumbers = winningNumbers
    }
    
    func rank(of numbers: [Int]) throws -> LottoRank {
        return .first
    }
}
