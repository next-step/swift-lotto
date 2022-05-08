//
//  UserLotto.swift
//  Lotto
//
//  Created by 카카오VX on 2022/04/30.
//

import Foundation

struct UserLotto: Equatable {
    private(set) var purchasedLottos: [Lotto]
    
    static func == (lhs: UserLotto, rhs: UserLotto) -> Bool {
        lhs.purchasedLottos == rhs.purchasedLottos
    }
}
