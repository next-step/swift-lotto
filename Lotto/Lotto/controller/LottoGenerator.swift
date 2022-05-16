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
<<<<<<< HEAD

    private func autoNumbers() throws -> Lotto {
        var numbers: Set<LottoNumber> = []

=======
    
    private func autoNumbers() throws -> Lotto {
        var numbers: Set<Int> = []
        
>>>>>>> yuchansong
        repeat {
            numbers.insert(try LottoNumber(randomNumber))
        } while numbers.count < Constants.defaultLottoCount
        
<<<<<<< HEAD
        return Lotto(try LottoNumbers(numbers: numbers.sorted(by: <)))
    }
    
    public func auto(n: Int) throws -> Lottos {
        ResultView.printPurchaseMessage(n)
        
        let lottos: [Lotto] = try (0..<n).map { _ in
            let newLotto = try autoNumbers()
            print(newLotto)
            return newLotto
=======
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
>>>>>>> yuchansong
        }
        
        return Lottos(lottos)
    }
    
}
