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
    private let lottoValidator = LottoInputValidator()
    
    func setMoney() throws -> Int {
        let stringMoney = inputView.inputMoney()
        let intMoney = try stringConverter.stringToInt(input: stringMoney)
        return intMoney
    }
    
    func setAutoLottos(lottoCount: Int) -> [Lotto] {
        inputView.printBuyingLottosCount(lottoCount)
        let lottos = lottoGenerator.generate(count: lottoCount)
        return lottos
    }
    
    func appearLottos(input lottos: [Lotto]) {
        for lotto in lottos {
            print(lotto.getNumbers())
        }
    }
    
    func setWinningNumbers() throws {
        inputView.printRecentlyWinningNumbers()
        
        let winningNumbersInput = readLine()
        let splitCommaNumbers = stringConverter.split(winningNumbersInput, sepratedCharacterSet: [","])
        let winningNumbers = try stringConverter.stringsToInts(input: splitCommaNumbers)
        try lottoValidator.validateLottoNumbersCount(winningNumbers)
        resultView.register(winningNumbers)
        
    }
    
    func setWinningBonusNumber() throws {
        inputView.printRecentlyWinningBonusNumber()
        let bonusNumberString = readLine()
        let bonusNumber = try stringConverter.stringToInt(input: bonusNumberString)
        try lottoValidator.validateNumberRange(bonusNumber)
        resultView.register(bonusNumber)
    }
    
    func printStatisticResult(money: Int, lottos: [Lotto]) {
        resultView.printStatisticStart()
        resultView.match(my: lottos)
        resultView.printWinningTypeCount()
        resultView.printLottoReward(than: money)
    }
    
    func moneyToLottoCount(input:Int) -> Int {
        return input/1000
    }
    
    
}
