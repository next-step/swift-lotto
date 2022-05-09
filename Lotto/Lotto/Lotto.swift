//
//  Lotto.swift
//  Lotto
//
//  Created by nylah.j on 2022/05/08.
//

import Foundation

struct LottoFactory {
    let lottoNumberGenerator: LottoNumberGenerator
    
    func create() -> Lotto {
        var lottoNumbers = Set<LottoNumber>()
        
        repeat {
            let lottoNumber = lottoNumberGenerator.generate()
            lottoNumbers.insert(lottoNumber)
        } while(lottoNumbers.count < Lotto.numberCount)
        
        return try! Lotto(numbers: Array(lottoNumbers))
    }
}

struct Lotto {
    enum Error: LocalizedError {
        case invalidNumberCount(Int)
        
        var errorDescription: String? {
            switch self {
            case .invalidNumberCount(let count):
                return "로또 번호 개수는 \(Lotto.numberCount)개입니다. 현재 입력된 로또 번호 개수: \(count)"
            }
        }
    }
    
    static let numberCount = 6
    let numbers: [LottoNumber]
    
    init(numbers: [LottoNumber]) throws {
        if numbers.count != Lotto.numberCount {
            throw Error.invalidNumberCount(numbers.count)
        }
        
        self.numbers = numbers
    }
    
    func equalNumberCount(with lotto: Lotto) -> Int {
        let count = lotto.numbers.filter {
            self.numbers.contains($0)
        }.count
        
        return count
    }
}
