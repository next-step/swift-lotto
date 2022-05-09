//
//  Splitter.swift
//  Lotto
//
//  Created by nylah.j on 2022/05/07.
//

import Foundation

struct Splitter {
    private let separaters = ",:"
    private var separaterSet: CharacterSet {
        return CharacterSet(charactersIn: separaters)
    }
    private let emptyString = ""
    
    func split(_ input: String) -> [String] {
        return input.components(separatedBy: separaterSet)
            .filter { $0 != emptyString }
    }
}
