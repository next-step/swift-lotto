//
//  InputParser.swift
//  Lotto
//
//  Created by nylah.j on 2022/05/07.
//

import Foundation

struct InputParser {
    let splitter: Splitter
    let numberGenerator: NumberGenerator.Type
    
    func parse(input: String?) throws -> [Int] {
        guard let input = input,
              input.isNotEmpty else {
            return [0]
        }
        
        let splittedInput = splitter.split(input)
        
        return try splittedInput.map({
            try numberGenerator.from($0)
        })
    }
}
