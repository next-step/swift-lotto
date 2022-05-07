//
//  Splitter.swift
//  Lotto
//
//  Created by nylah.j on 2022/05/07.
//

import Foundation

struct Splitter {
    private static let emptyString = ""
    let separaters: Separators
    
    func split(_ input: String?) -> [String]? {
        guard let input = input,
              input.isEmpty == false else {
            return nil
        }

        return input.components(separatedBy: separaters.set)
            .filter { $0 != Self.emptyString }
    }
}

