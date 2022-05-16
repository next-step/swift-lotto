//
//  LottoGenerator.swift
//  Lotto
//
//  Created by ycsong on 2022/05/06.
//

class LottoGenerator {
    
    var randomNumber: Int {
        return Int.random(in: Constants.defaultLottoRange)
    }

    private func autoNumbers() throws -> Lotto {
        var numbers: Set<LottoNumber> = []

        repeat {
            numbers.insert(try LottoNumber(randomNumber))
        } while numbers.count < Constants.defaultLottoCount
        
        return Lotto(try LottoNumbers(numbers: numbers.sorted(by: <)))
    }
    
    public func auto(n: Int) throws -> Lottos {
        ResultView.printPurchaseMessage(n)
        
        let lottos: [Lotto] = try (0..<n).map { _ in
            let newLotto = try autoNumbers()
            print(newLotto)
            return newLotto
        }
        
        return Lottos(lottos)
    }
    
}
