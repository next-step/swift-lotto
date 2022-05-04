//
//  StringAdditionPrinter.swift
//  Lotto
//
//  Created by jinho jeong on 2022/05/04.
//

import Foundation

final class StringAdditionPrinter {
    
    func printError(error: StringAdditionError) {
        print("\(error.errorDescription ?? "") ")
    }
    
    func printResult(sum: Int) {
        print("입력값에 대한 합은 \(sum)입니다.")
    }
    
}
