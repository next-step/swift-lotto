//
//  Lotto.swift
//  Lotto
//
//  Created by ycsong on 2022/05/06.
//

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
