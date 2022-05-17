//
//  UserInputConverter.swift
//  Lotto
//
//  Created by 강수진 on 2022/05/06.
//

import Foundation

struct UserInputConverter {
    
    enum UserInputConverterError {
        enum WinningNumbers: LocalizedError {
            case extraInputs
            
            var errorDescription: String? {
                switch self {
                case .extraInputs:
                    return "숫자와 구분자를 위한 하나의 , 만 입력해주세요"
                }
            }
        }
    }
    
    private let stringConverter = StringConverter()
    private let splitter = Splitter(separators: [","])
    
    func convertToInt(from input: String) throws -> Int {
        let result = try stringConverter.convertToInt(from: input)
        return result
    }
    
    func convertToWinningNumbers(from input: String) throws -> [Int] {        
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
