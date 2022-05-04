//
//  StringSplitter.swift
//  Lotto
//
//  Created by 강수진 on 2022/05/04.
//

import Foundation

struct StringSplitter {
    func split(_ input: String, by separator: Character) -> [String] {
        let splitComponents = input.split(separator: separator)
            .map(String.init)
        return splitComponents
    }
}
