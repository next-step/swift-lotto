//
//  Lottos.swift
//  Lotto
//
//  Created by ycsong on 2022/05/19.
//

struct Lottos: CustomStringConvertible {
    
    private let value: [Lotto]
    
    var description: String {
        return value.map { (lotto) in
            String(describing: lotto)
        }.joined(separator: "\n")
    }
    
    var count: Int {
        value.count
    }
    
    init(_ lottos: [Lotto]) {
        self.value = lottos
    }
    
    static func + (lhs: Lottos, rhs: Lottos) -> Lottos {
        Lottos(lhs.value + rhs.value)
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
