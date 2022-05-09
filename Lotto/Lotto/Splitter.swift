//
//  Splitter.swift
//  Lotto
//
//  Created by nylah.j on 2022/05/07.
//

import Foundation

struct Splitter {
    private let emptyString = ""
    let separaters: Separators
    
    func split(_ input: String) -> [String] {
        return input.components(separatedBy: separaters.set)
            .filter { $0 != emptyString }
    }
}
