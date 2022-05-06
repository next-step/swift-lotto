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
    
    static func readPrevWinningNumber() throws -> [Int] {
        print("\n지난 주 당첨 번호를 입력해 주세요.")
        
        if let input: String = readLine() {
            let splited: [String] = input.components(separatedBy: ",")
            
            let prevNumbers: [Int] = try splited.map {
                if let v = Int($0.trimmingCharacters(in: .whitespaces)) {
                    return v
                }
                throw LottoError.invalidInput
            }
            
            if prevNumbers.count == Constants.defaultLottoCount {
                return prevNumbers
            }
            
            throw LottoError.invalidInput
        }
        throw LottoError.invalidInput
    }
}
