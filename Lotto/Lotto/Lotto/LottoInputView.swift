//
//  LottoInputView.swift
//  Lotto
//
//  Created by 카카오VX on 2022/04/30.
//

import Foundation

struct LottoInputView {
    static func read(with description: String) -> String {
        print(description)
        let line = readLine() ?? ""
        return line
    }
    
    static func readPurchaseAmount() -> String {
        return read(with: "구매금액을 입력해 주세요.")
    }
    
    static func readNumberOfManualPurchase() -> Int {
        return Int(read(with: "수동으로 구매할 로또 수를 입력해 주세요.")) ?? 0
    }
    
    static func readManualLotto(number: Int) -> [String] {
        print("수동으로 구매할 번호를 입력해 주세요.")
        var result: [String] = []
        
        for _ in 0..<number {
            result.append(read(with: ""))
        }
        
        return result
    }
    
    static func readLastWeakWinningNumber() -> String {
        return read(with: "지난 주 당첨 번호를 입력해 주세요.")
    }
    
    static func readBonushNumber() -> Int {
        return Int(read(with: "보너스 번호를 입력해 주세요.")) ?? 0
    }
}
