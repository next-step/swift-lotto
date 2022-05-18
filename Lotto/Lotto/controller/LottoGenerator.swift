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
        var numbers: Set<LottoNumber> = []

        repeat {
            numbers.insert(try LottoNumber(randomNumber))
        } while numbers.count < Constants.defaultLottoCount
        
        return Lotto(try LottoNumbers(numbers: numbers.sorted(by: <)))
    }
    
    func auto(n: Int) throws -> Lottos {
        let lottos: [Lotto] = try (0..<n).map { _ in
            return try autoNumbers()
        }
        
        return Lottos(lottos)
    }
    
    func purchase(manualLottos: Lottos, autoCount: Int) throws -> Lottos {
        ResultView.printPurchaseMessage(manual: manualLottos.count, auto: autoCount)
        
        let autoLottos = try auto(n: autoCount)
        return manualLottos + autoLottos
    }
    
}
