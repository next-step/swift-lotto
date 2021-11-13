//
//  main.swift
//  StringCalculator
//
//  Created by 남기범 on 2021/11/13.
//

import Foundation

class StringCalculator {
    func plus(input: String?) -> Int {
        guard let input = input,
              !input.isEmpty
        else {
            return 0
        }
        
        if let number = Int(input) {
            return number
        }
        
        return 1
    }
    
}
