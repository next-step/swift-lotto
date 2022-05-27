//
//  ConsumerInputView.swift
//  Lotto
//
//  Created by 이우섭 on 2022/05/24.
//

import Foundation

struct ConsumerInputView {
    func readPrice() -> Int? {
        guard let input = readInput(with: "구입금액을 입력해 주세요."), let price = Int(input) else { return nil }
        return price
    }
    
    func readPrizeNumbers() -> LottoNumbers? {
        guard let input = readInput(with: "지난 주 당첨 번호를 입력해 주세요.") else { return nil }
        print()
        let numbers = input.components(separatedBy: ", ")
            .compactMap(Int.init)
            .compactMap(LottoNumber.init)
        
        guard numbers.count == 6 else { return nil }
        return LottoNumbers(numbers: numbers)
    }
    
    func readBonusNumber() -> LottoNumber? {
        guard let input = readInput(with: "보너스 번호를 입력해 주세요."), let number = Int(input) else { return nil }
        return LottoNumber(number)
    }
    
    private func readInput(with comment: String) -> String? {
        print(comment)
        let input = readLine()
        return input
    }
}
