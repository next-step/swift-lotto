//
//  StringSplitter.swift
//  Lotto
//
//  Created by 이우섭 on 2022/05/08.
//

import Foundation

struct StringSplitter {
    
    private let seperators: [String]
    
    init(validSeperators: [String]) {
        self.seperators = validSeperators
    }
    
    func split(target: String) -> [String] {
        let componentSeperator = CharacterSet(charactersIn: seperators.joined())
        return target.components(separatedBy: componentSeperator)
    }
}
