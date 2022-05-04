//
//  StringSplitter.swift
//  Lotto
//
//  Created by 강수진 on 2022/05/04.
//

import Foundation

struct StringSplitter {
    func split(_ input: String, by separators: CharacterSet) -> [String] {
        let splitComponents = input.components(separatedBy: separators)
        return splitComponents
    }
}
