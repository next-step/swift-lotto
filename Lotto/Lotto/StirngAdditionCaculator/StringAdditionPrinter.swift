//
//  StringAdditionPrinter.swift
//  Lotto
//
//  Created by jinho jeong on 2022/05/04.
//

import Foundation

final class StringAdditionPrinter {
    
    func printError(_ error: Error) {
        guard let error = error as? StringAdditionError else {
            print(error.localizedDescription)
            return
        }
        print("\(error.errorDescription ?? "") ")
    }
    
    func printResult(_ result: Int) {
        print("입력값에 대한 합은 \(result)입니다.")
    }
}
