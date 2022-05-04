//
//  Splitter.swift
//  Lotto
//
//  Created by 강수진 on 2022/05/04.
//

import Foundation

struct OperandFilter {
    
    func filter(from input: String, separatedBy separators: CharacterSet) throws -> [Int] {
        let components: [String] = input.components(separatedBy: separators)
        return try convertToIntComponents(of: components)
    }
    
    private func convertToIntComponents(of components: [String]) throws -> [Int] {
        let stringConverter = StringConverter()
        let result: [Int] = try components.map(stringConverter.convertToInt)
        return result
    }
}
