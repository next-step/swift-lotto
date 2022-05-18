//
//  InputView.swift
//  Lotto
//
//  Created by ycsong on 2022/05/06.
//

import Foundation

struct InputView {
    static func readPurchasePrice() throws -> Int {
        print("구입금액을 입력해 주세요.")
        
        if let input: String = readLine(),
           let price: Int = Int(input) {
            let count = price / Constants.lottoPrice
            if count < 1 { throw LottoError.invalidInput }
            return count
        }
        
        throw LottoError.invalidInput
    }
    
    static func readManualCount(purchaseCount: Int) throws -> Int {
        print("\n수동으로 구매할 로또 수를 입력해 주세요.")
        
        if let input: String = readLine(),
           let count: Int = Int(input) {
            if count > purchaseCount {
                throw LottoError.invalidManualCount
            }
            return count
        }
        throw LottoError.invalidInput
    }
    
    static func readManualNumbers(count: Int) throws -> Lottos {
        print("\n수동으로 구매할 번호를 입력해 주세요.")
        
        let lottos: [Lotto] = try (0..<count).map { _ in
            if let input: String = readLine() {
                let splited: [String] = input.components(separatedBy: ",")
                
                let numbers: [LottoNumber] = try splited.map {
                    if let number = Int($0.trimmingCharacters(in: .whitespaces)) {
                        return try LottoNumber(number)
                    }
                    throw LottoError.winnerNumberError
                }
                let lottoNumbers = try LottoNumbers(numbers: numbers)
                return Lotto(lottoNumbers)
            }
            throw LottoError.invalidInput
        }
        
        return Lottos(lottos)
    }
    
    static func readPrevWinningNumber() throws -> LottoNumbers {
        print("\n지난 주 당첨 번호를 입력해 주세요.")
        
        if let input: String = readLine() {
            let splited: [String] = input.components(separatedBy: ",")
            
            let numbers: [LottoNumber] = try splited.map {
                if let number = Int($0.trimmingCharacters(in: .whitespaces)) {
                    return try LottoNumber(number)
                }
                throw LottoError.winnerNumberError
            }
            return try LottoNumbers(numbers: numbers)
        }
        throw LottoError.invalidInput
    }
    
    static func readBonusNumber(winningNumbers: LottoNumbers) throws -> LottoNumber {
        print("\n보너스 번호를 입력해 주세요.")
        
        guard let input: String = readLine(),
              let number: Int = Int(input) else {
            throw LottoError.invalidInput
        }
        
        let lottoNumber = try LottoNumber(number)
        
        if winningNumbers.contains(lottoNumber) {
            throw LottoError.duplicateNumber
        }
        
        return lottoNumber
    }
}
