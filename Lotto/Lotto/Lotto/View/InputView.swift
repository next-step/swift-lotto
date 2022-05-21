//
//  InputView.swift
//  Lotto
//
//  Created by 강수진 on 2022/05/07.
//

import Foundation

struct InputView {
    
    private enum QuestionText: UserInformable {
        case purchaseMoney
        case manualBuyCount
        case manualNumbers
        case winningNumbers
        case bonusNumber
        
        var guideDescription: String {
            switch self {
            case .purchaseMoney:
                return "구입금액을 입력해 주세요."
            case .manualBuyCount:
                return "수동으로 구매할 로또 수를 입력해 주세요."
            case .manualNumbers:
                return "수동으로 구매할 번호를 입력해 주세요."
            case .winningNumbers:
                return "지난 주 당첨 번호를 입력해 주세요."
            case .bonusNumber:
                return "보너스 번호를 입력해주세요"
            }
        }
    }
    
    private let userGuider = UserGuider()
    private let stringConverter = StringConverter()
    private let userInputConverter = UserInputConverter()
    private let purchaseLottoValidator = PurchaseLottoValidator()
    private let lottoNumbersValidator = LottoNumbersValidator()
    private let lottoBonusNumberValidator = LottoBonusNumberValidator()
    
    func receivePurchaseMoney() throws -> Int {
        userGuider.printGuide(for: QuestionText.purchaseMoney)
        let purchaseMoney = try receiveInt()
        try purchaseLottoValidator.validateMoney(purchaseMoney)
        return purchaseMoney
    }
    
    func receiveManualBuyCount(inBudget purchaseMoney: Int) throws -> Int {
        userGuider.printGuide(for: QuestionText.manualBuyCount)
        
        let manualBuyCount = try receiveInt()
        
        try purchaseLottoValidator.validateCount(manualBuyCount,
                                                 inBudget: purchaseMoney)
        return manualBuyCount
    }
    
    func receiveManualLottos(for buyCount: Int) throws -> [Lotto] {
        userGuider.printGuide(for: QuestionText.manualNumbers)
        
        let lottos: [Lotto] = try (0..<buyCount).map { _ -> Lotto in
            let lotto: Lotto = try receiveLotto()
            return lotto
        }
        return lottos
    }
    
    func receiveWinningLotto() throws -> Lotto {
        userGuider.printGuide(for: QuestionText.winningNumbers)
        
        let lotto: Lotto = try receiveLotto()
        return lotto
    }
    
    private func receiveLotto() throws -> Lotto {
        let userInput: String? = readLine()
        let unwrappedUserInput: String = try stringConverter.unwrapOptional(from: userInput)
        let lottoNumbers: [Int] = try userInputConverter.convertToLottoNumbers(from: unwrappedUserInput)
        let lotto = try Lotto(numbers: lottoNumbers)
        return lotto
    }
    
    func receiveBonusNumber(in winningLotto: Lotto) throws -> Int {
        userGuider.printGuide(for: QuestionText.bonusNumber)
        let bonusNumber = try receiveInt()
        try lottoBonusNumberValidator.validate(bonusNumber, in: winningLotto)
        return bonusNumber
    }
    
    private func receiveInt() throws ->  Int {
        let userInput: String? = readLine()
        let unwrappedUserInput: String = try stringConverter.unwrapOptional(from: userInput)
        let userInputInt = try userInputConverter.convertToInt(from: unwrappedUserInput)
        return userInputInt
    }
}
