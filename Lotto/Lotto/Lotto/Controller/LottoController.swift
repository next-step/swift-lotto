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
        let intMoney = try stringConverter.stringToInt(input: stringMoney)
        let lottoCount = lottoGenerator.changeMoneyToLottoCount(input: intMoney)
        inputMoney = intMoney
        inputView.printBuyingLottosCount(lottoCount)
        lottos = lottoGenerator.generate(count: lottoCount)
    }
    
    func lottoPrinter() {
        for lotto in lottos {
            print(lotto.getNumbers())
        }
    }
    
    func setWinningNumbers() throws {
        inputView.printRecentlyWinningNumbers()
        
        let winningNumbersInput = readLine()
        let splitCommaNumbers = stringConverter.split(winningNumbersInput, sepratedCharacterSet: [","])
        let numbers = try stringConverter.stringsToInts(input: splitCommaNumbers)
        try validateWinningNumbers(numbers)
        resultView.registerWinningNumbers(numbers)
        
    }
    
    func setWinningBonusNumber() throws {
        inputView.printRecentlyWinningBonusNumber()
        let bonusNumberString = readLine()
        let bonusNumber = try stringConverter.stringToInt(input: bonusNumberString)
        try validateWinningBonusNumber(bonusNumber)
        resultView.registerBonusNumber(bonusNumber)
    }
    
    func printStatisticResult() {
        resultView.printStatisticStart()
        resultView.match(my: lottos)
        resultView.printWinningTypeCount()
        resultView.printLottoReward(than: inputMoney)
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
