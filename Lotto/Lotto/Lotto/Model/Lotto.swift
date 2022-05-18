//
//  Lotto.swift
//  Lotto
//
//  Created by brian은석 on 2022/05/11.
//

import Foundation

struct Lotto {
    private let numbers: [Int]
    
    init() {
        var numbers: Set<Int> = []
        let randomRange = 1...45
        
        while numbers.count < 6 {
            let number = Int.random(in: randomRange)
            numbers.insert(number)
        }
        self.numbers = Array(numbers).sorted(by: <)
    }
    
    func max() -> Int {
        return numbers.max() ?? 45
    }
    
    func min() -> Int {
        return numbers.min() ?? 1
    }
    
    func getNumbers() -> [Int] {
        return numbers
    }

}
