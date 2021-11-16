//
//  StringCalculator.swift
//  Lotto
//
//  Created by sangsun on 2021/11/17.
//

import Foundation

class StringCalculator {
    
    func run() {
        guard let inputs = readLine()?.components(separatedBy: [",", ":"]).compactMap({ Int($0) }) else { return }
        print(inputs)
        let result = inputs.reduce(0) { $0 + $1 }
        print(result)
    }
}
