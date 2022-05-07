//
//  InputView.swift
//  Lotto
//
//  Created by 강수진 on 2022/05/07.
//

import Foundation

struct InputView {
    
    private enum Question: UserInformable {
        case purchaseMoney
        case winningNumbers
        
        var guideDescription: String {
            switch self {
            case .purchaseMoney:
                return "구입금액을 입력해 주세요."
            case .winningNumbers:
                return "지난 주 당첨 번호를 입력해 주세요."
            }
        }
    }
    
    private let userGuider = UserGuider()
    private let userInputConverter = UserInputConverter()
    private let purchaseMoneyValidator = PurchaseMoneyValidator()
    private let lottoNumbersValidator = LottoNumbersValidator()
    
    func recievePurchaseMoney() throws -> Int {
        userGuider.printGuide(for: Question.purchaseMoney)
        
        let userInput: String? = readLine()
        let purchaseMoney = try userInputConverter.convertToMoney(from: userInput)
        try purchaseMoneyValidator.validate(of: purchaseMoney)
        return purchaseMoney
    }
    
    func recieveWinningNumbers() throws -> [Int] {
        userGuider.printGuide(for: Question.winningNumbers)
        
        let userInput: String? = readLine()
        let winningNumbers = try userInputConverter.convertToWinningNumbers(from: userInput)
        try lottoNumbersValidator.validate(of: winningNumbers)
        return winningNumbers
    }
}
