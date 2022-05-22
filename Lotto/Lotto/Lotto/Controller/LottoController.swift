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
    
    func setMoneyAndValidPositive() throws -> Int {
        let stringMoney = inputView.inputMoney()
        let intMoney = try stringConverter.stringToInt(input: stringMoney)
        try lottoValidator.validatePositive(intMoney)
        return intMoney
    }
    
    func setTotalLottos(lottoCount: Int, manualSetLotto: [Lotto]) -> [Lotto] {
        let manualCount = manualSetLotto.count
        let autoCount = lottoCount - manualCount
        inputView.printBuyingLottosCount(autoCount: autoCount, manualCount: manualCount)
        let lottos = manualSetLotto + lottoGenerator.generate(count: autoCount)
        return lottos
    }
    
    func setInputLottoCountAndValidPositive() throws -> Int {
        inputView.printManualLottoCountInput()
        let input = readLine()
        let count = try stringConverter.stringToInt(input: input)
        try lottoValidator.validatePositive(count)
        return count
    }
    
    func setMutualLottos(inputCount: Int) throws -> [Lotto] {
        guard inputCount > 0 else { return [] }
        inputView.printManualLottoInput()
        var lottos = [Lotto]()
        for _ in 0..<inputCount {
            let input = stringConverter.split(readLine(),sepratedCharacterSet: [","])
            let lottoNumbers = try stringConverter.stringsToInts(input: input)
            try lottoValidator.validateLottoNumbersCount(lottoNumbers)
            lottos.append(Lotto.init(numbers: lottoNumbers))
        }
        return lottos
    }
    
    func appearLottos(input lottos: [Lotto]) {
        for lotto in lottos {
            print(lotto.getNumbers())
        }
    }
    
    func checkLottoRange(lottos: [Lotto]) throws {
        for lotto in lottos {
            try lottoValidator.validateNumbersRange(lotto.getNumbers())
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
