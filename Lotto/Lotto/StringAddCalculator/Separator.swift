//
//  Separator.swift
//  Lotto
//
//  Created by YooBin Jo on 2022/05/07.
//

import Foundation

final class Separator {
    
    static func separate(_ numbers: String?) -> [String] {
        guard let numbers = numbers else {
            return ["0"]
        }

        return numbers.components(separatedBy: [",", ":"])
    }
}

fileprivate extension String {
    func components(separatedBy separators: [String]) -> [String] {
        var output: [String] = [self]
        for separator in separators {
            output = output.flatMap { $0.components(separatedBy: separator) }
        }
        return output.map { $0.trimmingCharacters(in: .whitespaces)}
    }
}
