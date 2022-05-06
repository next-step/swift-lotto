//
//  LottoGenerator.swift
//  Lotto
//
//  Created by ycsong on 2022/05/06.
//

class LottoGenerator {
    
    private var randomNumber: Int {
        return Int.random(in: Constants.defaultLottoRange)
    }
    
    private func autoNumbers() -> Lotto {
        var numbers: Set<Int> = []
        
        repeat {
            numbers.insert(randomNumber)
        } while numbers.count < Constants.defaultLottoCount
        
        return Lotto(numbers: numbers.sorted(by: <))
    }
    
    public func auto(n: Int) -> [Lotto] {
        var lottos: [Lotto] = []
        
        for _ in 0..<n {
            lottos.append(autoNumbers())
        }
        
        return lottos
    }
    
}
