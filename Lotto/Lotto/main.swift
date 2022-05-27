//
//  Lotto - main.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import Foundation

let lottoController = LottoController()

do {
    try lottoController.playLotto()
} catch {
    print("Lotto Error: \(error)")
}

