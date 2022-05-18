//
//  LottoNumber.swift
//  Lotto
//
//  Created by ycsong on 2022/05/19.
//

struct LottoNumber: Hashable, Comparable, CustomStringConvertible {
    private let wrapped: Int
    
    var description: String {
        return String(describing: wrapped)
    }
    
    init(_ value: Int) throws {
        guard Constants.defaultLottoRange.contains(value) else {
            throw LottoError.invalidLottoNumber
        }
        self.wrapped = value
    }
    
    static func < (lhs: LottoNumber, rhs: LottoNumber) -> Bool {
        return lhs.wrapped < rhs.wrapped
    }
}
