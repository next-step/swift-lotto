//
//  Splitter.swift
//  Lotto
//
//  Created by 강수진 on 2022/05/05.
//

import Foundation

struct Splitter {
    
    private let separators: CharacterSet
    
    init(separators: [String]) {
        self.separators = CharacterSet(charactersIn: separators.joined())
    }
    
    func components(of input: String) -> [String] {
        let components: [String] = input.components(separatedBy: separators)
        return components
    }
}
