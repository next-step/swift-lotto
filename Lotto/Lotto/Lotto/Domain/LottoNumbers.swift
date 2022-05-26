//
//  LottoNumbers.swift
//  Lotto
//
//  Created by 이우섭 on 2022/05/18.
//

import Foundation

class LottoNumbers {
    private var numbers: [LottoNumber]
    
    var count: Int {
        return numbers.count
    }
    
    var comparativeSet: Set<Int> {
        return Set<Int>(numbers.map({ $0.value }))
    }
    
    init(_ numbers: [LottoNumber]) {
        self.numbers = numbers
    }
    
    func match(with comparedNumbers: LottoNumbers) -> Int {
        let lhs = self.comparativeSet
        let rhs = comparedNumbers.comparativeSet
        
        return lhs.intersection(rhs).count
    }
    
    static func generateByRandom() throws -> LottoNumbers {
        var randomPool = Set<Int>(1...45)
        var numbers = [Int]()
        
        for _ in 0..<6 {
            let randomNumber = try randomPool.exportRandomElement()
            numbers.append(randomNumber)
        }

        return LottoNumbers(numbers.compactMap(LottoNumber.init))
    }
}


extension Set {
    mutating func exportRandomElement() throws -> Element {
        guard let element = self.randomElement() else { throw LottoError.invalidRandomNumber }
        self.remove(element)
        return element
    }
}
