//
//  Lotto - main.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import Foundation

do {
    let count = try InputView.readPurchasePrice()

    let generator = LottoGenerator()
    let lottos = try generator.auto(n: count)
    
//    let prev = try InputView.readPrevWinningNumber()
    
    let winningNumbers = try LottoNumbers(numbers: [
                                            try LottoNumber(1),
                                            try LottoNumber(2),
                                            try LottoNumber(3),
                                            try  LottoNumber(4),
                                            try  LottoNumber(5),
                                            try  LottoNumber(6)])
    
    ResultView.printResult(of: lottos, winningNumbers: winningNumbers)
} catch let error as LottoError {
    print(error.errorDescription)
}
