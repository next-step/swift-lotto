//
//  Controller.swift
//  Lotto
//
//  Created by brian은석 on 2022/05/11.
//

import Foundation

final class LottoController {
    private let inputView = InputView()
    private let resultView = ResultView()
    private let lottoGenerator = LottoGenerator()
    private let stringConverter = StringConverter()
    private var lottos: [Lotto] = []
    private var inputMoney: Int = 0
    
    
    func lotterySetting() throws {
        let stringMoney = inputView.inputMoney()
        let intMoney = try inputView.changeIntMoney(stringMoney)
        let lottoCount = lottoGenerator.moneyToLottoCount(intMoney)
        inputMoney = intMoney
        inputView.lotteryTotalCount(lottoCount)
        lottos = lottoGenerator.generate(count: lottoCount)
    }
    
    func lottoPrinter() {
        for lotto in lottos {
            print(lotto.numbers)
        }
    }
    
    func winningNumbersSetting() throws {
        inputView.winningNumbersInputTextPrint()
        
        let winningNumbersInput = readLine()
        let splitCommaNumbers = stringConverter.split(winningNumbersInput, sepratedCharacterSet: [","])
        let numbers = try stringConverter.stringsToInts(input: splitCommaNumbers)
        try validateWinningNumbers(numbers)
        resultView.registerWinningNumbers(numbers)
        
    }
    
    func winningBonusNumberSetting() throws {
        inputView.winningBonusNumberInputTextPrint()
        let bonusNumberString = readLine()
        let bonusNumber = try stringConverter.stringToInt(input: bonusNumberString)
        try validateWinningBonusNumber(bonusNumber)
        resultView.registerBonusNumber(bonusNumber)
    }
    
    func statisticResult() {
        resultView.statisticStartPrint()
        resultView.match(my: lottos)
        resultView.winningTypeCountPrint()
        resultView.lotteryRewardPrint(inputMoney: inputMoney)
    }
    
    private func validateWinningNumbers(_ numbers: [Int]) throws {
        guard numbers.count == 6 else {
            throw InputError.invalidWinningNumberCount
        }
        guard Set(numbers).count == 6 else {
            throw InputError.duplicateWinningNumber
        }
    }
    
    private func validateWinningBonusNumber(_ bonusNumber: Int) throws {
        guard bonusNumber >= 1 , bonusNumber <= 45 else {
            throw InputError.invalidNumber
        }
    }
}
