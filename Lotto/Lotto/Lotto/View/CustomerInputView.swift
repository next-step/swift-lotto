//
//  CustomerInputView.swift
//  Lotto
//
//  Created by 이우섭 on 2022/05/24.
//

import Foundation

struct CustomerInputView {
    func readPrice() -> Int? {
        print("구입금액을 입력해 주세요.")
        guard let input = readLine(), let price = Int(input) else { return nil }
        return price
    }
}
