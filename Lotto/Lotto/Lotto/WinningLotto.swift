//
//  WinningLotto.swift
//  Lotto
//
//  Created by 카카오VX on 2022/04/30.
//

import Foundation

struct WinningLotto: Equatable {
    private(set) var numbers: [LottoNumber]
    
    func matchCount(numberToMatch: Lotto) -> Int {
        var result: Int = 0
        
        for number in numbers {
            result += count(numberToMatch: numberToMatch, number: number)
        }
        
        return result
    }
    
    private func count(numberToMatch: Lotto, number: LottoNumber) -> Int {
        numberToMatch.numbers.contains(number) ? 1 : 0
    }
}
