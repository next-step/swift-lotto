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

//        repeat {
//            numbers.insert(try LottoNumber(randomNumber))
//        } while numbers.count < Constants.defaultLottoCount

        numbers.insert(try LottoNumber(1))
        numbers.insert(try LottoNumber(2))
        numbers.insert(try LottoNumber(3))
        numbers.insert(try LottoNumber(4))
        numbers.insert(try LottoNumber(12))
        numbers.insert(try LottoNumber(13))
        
        return Lotto(try LottoNumbers(numbers: numbers.sorted(by: <)))
    }
    
    public func auto(n: Int) throws -> Lottos {
        ResultView.printPurchaseMessage(n)
        
        var lottos: [Lotto] = []

        for _ in 0..<n {
            let newLotto = try autoNumbers()
            lottos.append(newLotto)
            ResultView.printLottoNumbers(of: newLotto)
        }

        return Lottos(lottos)
    }
    
}
