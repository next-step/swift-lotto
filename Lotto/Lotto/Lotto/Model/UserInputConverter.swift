//
//  UserInputConverter.swift
//  Lotto
//
//  Created by 강수진 on 2022/05/06.
//

import Foundation

struct UserInputConverter {
    
    enum UserInputConverterError {
        enum PurchaseMoney: Error {
            case empty
            case notInt
        }
        
        enum WinningNumbers: Error {
            case empty
            case extraInputs
        }
    }
    
    func convertToMoney(from input: String?) throws -> Int {
        return 0
    }
    
    func convertToWinningNumbers(from input: String?) throws -> [Int] {
        return [0]
    }
}
