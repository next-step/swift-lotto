//
//  ConsumerInputView.swift
//  Lotto
//
//  Created by 이우섭 on 2022/05/24.
//

import Foundation

struct ConsumerInputView {
    func readPrice() -> Int? {
        print("구입금액을 입력해 주세요.")
        guard let input = readLine(), let price = Int(input) else { return nil }
        return price
    }
    
    func readPrizeNumbers() -> LottoNumbers? {
        print("지난 주 당첨 번호를 입력해 주세요.")
        guard let input = readLine() else { return nil }
        print()
        let numbers = input.components(separatedBy: ", ")
            .compactMap(Int.init)
            .compactMap(LottoNumber.init)
        
        guard numbers.count == 6 else { return nil }
        return LottoNumbers(numbers)
    }
}
