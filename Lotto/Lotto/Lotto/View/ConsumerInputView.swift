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
        print()
        return price
    }
    
    func readManualLottos() -> [LottoNumbers]? {
        guard let input = readInput(with: "수동으로 구매할 로또 수를 입력해 주세요."),
              let count = Int(input), count != 0 else { return nil }
        print()
        
        var manuallyGenerated: [LottoNumbers?] = []
        for _ in 0..<count {
            let numbers = readLottoNumbers()
            manuallyGenerated.append(numbers)
        }
        print()
        
        let vaildGenerated = manuallyGenerated
            .compactMap({ $0 })
            .filter({ $0.count == 6 })
        
        guard vaildGenerated.count == count else { return nil }
        return vaildGenerated
    }
    
    
    
    func readPrizeNumbers() -> LottoNumbers? {
        print("지난 주 당첨 번호를 입력해 주세요.")
        guard let numbers = readLottoNumbers() else { return nil }
        guard numbers.count == 6 else { return nil }
        return numbers
    }
    
    func readBonusNumber() -> LottoNumber? {
        guard let input = readInput(with: "보너스 번호를 입력해 주세요."), let number = Int(input) else { return nil }
        print()
        return LottoNumber(number)
    }
    
    private func readLottoNumbers() -> LottoNumbers? {
        guard let input = readLine() else { return nil }
        let numbers = input.components(separatedBy: ", ")
            .compactMap(Int.init)
            .compactMap(LottoNumber.init)
        return LottoNumbers(numbers: numbers)
    }
    
    private func readInput(with comment: String) -> String? {
        print(comment)
        let input = readLine()
        return input
    }
}
