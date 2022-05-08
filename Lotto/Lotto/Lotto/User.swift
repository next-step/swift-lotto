//
//  User.swift
//  Lotto
//
//  Created by 카카오VX on 2022/04/30.
//

import Foundation

struct User {
    private let userLotto: UserLotto
    private let center: LottoCenterPort
    
    init(userLotto: UserLotto, center: LottoCenterPort) {
        self.userLotto = userLotto
        self.center = center
    }
    
    func winning() -> [Rank] {
         center.match(userLotto: userLotto)
    }
}
