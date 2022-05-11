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
    
    private func autoNumbers() throws -> Lotto {
        var numbers: Set<Int> = []
        
        repeat {
            numbers.insert(randomNumber)
        } while numbers.count < Constants.defaultLottoCount
        
        let lottoNumber: LottoNumbers = try LottoNumbers(numbers: numbers.sorted(by: <))
        return Lotto(numbers: lottoNumber)
    }
    
    public func auto(n: Int) throws -> [Lotto] {
        print("\n\(n)개를 구매했습니다.")
        var lottos: [Lotto] = []
        
        for _ in 0..<n {
            let newLotto = try autoNumbers()
            print(newLotto.numbers)
            lottos.append(newLotto)
        }
        
        return lottos
    }
    
}
