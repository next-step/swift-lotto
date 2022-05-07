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
        let splittedInput = splitter.split(input)
        
        guard let splittedInput = splittedInput,
              splittedInput.isEmpty else {
            return [0]
        }
        
        return try splittedInput.map({
            try numberGenerator.from($0)
        })
    }
}
