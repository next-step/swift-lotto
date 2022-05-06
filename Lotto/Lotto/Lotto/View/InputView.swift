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
    
    func recievePurchaseMoney() throws -> Int {
        userGuider.guide(for: Question.purchaseMoney)
        return try userInputConverter.convertToMoney(from: readLine())
    }
    
    func recieveWinningNumbers() throws -> [Int] {
        userGuider.guide(for: Question.winningNumbers)
        return try userInputConverter.convertToWinningNumbers(from: readLine())
    }
}
