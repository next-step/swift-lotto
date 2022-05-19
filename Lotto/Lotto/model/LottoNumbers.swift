//
//  LottoNumbers.swift
//  Lotto
//
//  Created by ycsong on 2022/05/19.
//

struct LottoNumbers: CustomStringConvertible {
    private let value: [LottoNumber]
    
    var description: String {
        return String(describing: value)
    }
    
    init(numbers: [LottoNumber]) throws {
        guard Constants.defaultLottoCount == numbers.count,
              Constants.defaultLottoCount == Set(numbers).count else {
            throw LottoError.digitError
        }
        self.value = numbers
    }
    
    func contains(_ element: LottoNumber) -> Bool {
        value.contains(element)
    }
    
    func matchCount(from winnerNumbers: LottoNumbers) -> Int {
        value.filter { winnerNumbers.contains($0) }.count
    }
}
