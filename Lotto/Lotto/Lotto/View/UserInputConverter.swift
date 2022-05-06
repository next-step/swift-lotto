//
//  UserInputConverter.swift
//  Lotto
//
//  Created by 강수진 on 2022/05/06.
//

import Foundation

struct UserInputConverter {
    
    enum UserInputConverterError {
        enum PurchaseMoney: Error, UserInformable {
            case empty
            case notInt
            
            var guideDescription: String {
                switch self {
                case .empty:
                    return "빈 값이 들어왔습니다"
                case .notInt:
                    return "Int 값이 아닙니다"
                }
            }
        }
        
        enum WinningNumbers: Error, UserInformable {
            case empty
            case extraInputs
            
            var guideDescription: String {
                switch self {
                case .empty:
                    return "빈 값이 들어왔습니다"
                case .extraInputs:
                    return "숫자와 구분자를 위한 하나의 , 만 입력해주세요"
                }
            }
        }
    }
    
    private let stringConverter = StringConverter()
    private let splitter = Splitter(separators: [","])
    
    func convertToMoney(from input: String?) throws -> Int {
        guard let input = input,
              !input.isEmpty else {
            throw UserInputConverterError.PurchaseMoney.empty
        }
        
        do {
            let money = try stringConverter.convertToInt(from: input)
            return money
        } catch {
            throw UserInputConverterError.PurchaseMoney.notInt
        }
    }
    
    func convertToWinningNumbers(from input: String?) throws -> [Int] {
        guard let input = input,
              !input.isEmpty else {
            throw UserInputConverterError.WinningNumbers.empty
        }
        
        do {
            let components = splitter.components(of: removeSpace(of: input))
            let winningNumbers = try components.map(stringConverter.convertToInt)
            return winningNumbers
        } catch {
            throw UserInputConverterError.WinningNumbers.extraInputs
        }
    }
    
    private func removeSpace(of input: String) -> String {
        return input.replacingOccurrences(of: " ", with: "")
    }
}
