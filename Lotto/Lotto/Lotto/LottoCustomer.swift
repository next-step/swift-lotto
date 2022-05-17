//
//  LottoCustomer.swift
//  Lotto
//
//  Created by 이우섭 on 2022/05/17.
//

import Foundation

class LottoCustomer {
    
    var lottos = [Lotto]()
    
    func buyLotto(for price: Int) {
        let lottoCount = price / 1000
        for _ in 0..<lottoCount {
            let lotto = Lotto()
            lottos.append(lotto)
        }
    }
}

struct Lotto {
    var numbers = [Int]()
    
    static func generate(by lottoNumbers: LottoNumbers) -> Lotto {
        var lotto = Lotto()
        for _ in 0..<6 {
            lotto.numbers.append(lottoNumbers.pop())
        }
        return lotto
    }
}

class LottoNumbers {
    private var numbers: [LottoNumber]
    
    init(_ numbers: [LottoNumber]) {
        self.numbers = numbers
    }
    
    func pop() -> Int {
        return numbers.removeFirst().value
    }
}

struct LottoNumber {
    let value: Int
    
    init?(_ value: Int) {
        guard 1...45 ~= value else { return nil }
        self.value = value
    }
}
