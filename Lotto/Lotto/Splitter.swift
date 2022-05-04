//
//  Splitter.swift
//  Lotto
//
//  Created by 강수진 on 2022/05/04.
//

import Foundation

struct Splitter {
    
    func splitToIntComponents(from input: String, by separators: CharacterSet) throws -> [Int] {
        let splitComponents: [String] = input.components(separatedBy: separators)
        let stringConverter = StringConverter()
        let result: [Int] = try splitComponents.map(stringConverter.convertToInt)
        return result
    }
}
