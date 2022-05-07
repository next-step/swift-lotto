//
//  Operator.swift
//  Lotto
//
//  Created by nylah.j on 2022/05/07.
//

import Foundation

protocol Operator {
    func operate(_ lhs: Int, _ rhs: Int) -> Int
}

struct Plus: Operator {
    func operate(_ lhs: Int, _ rhs: Int) -> Int {
        return lhs + rhs
    }
}
