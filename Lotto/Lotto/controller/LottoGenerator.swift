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
    
    public func autoNumbers() -> Lotto {
        var numbers: Set<Int> = []
        
        repeat {
            numbers.insert(randomNumber)
        } while numbers.count < Constants.defaultLottoCount
        
        return Lotto(numbers: numbers.sorted(by: <))
    }
    
    public func auto(n: Int) -> [Lotto] {
        print("\n\(n)개를 구매했습니다.")
        var lottos: [Lotto] = []
        
        for _ in 0..<n {
            let newLotto = autoNumbers()
            lottos.append(newLotto)
            print(newLotto.numbers)
        }
        
        return lottos
    }
    
}
