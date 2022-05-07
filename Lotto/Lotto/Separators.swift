//
//  File.swift
//  Lotto
//
//  Created by nylah.j on 2022/05/07.
//

import Foundation

protocol Separator {
    var value: String { get }
}

struct Comma: Separator {
    let value = ","
}

struct Colon: Separator {
    let value = ";"
}

struct Separators {
    let value: [Separator]
    
    var set: CharacterSet {
        let concattedSeparater = value.reduce(into: "") { partialResult, separator in
            partialResult += separator.value
        }
        return CharacterSet(charactersIn: concattedSeparater)
    }
    
    init(value: [Separator]) {
        self.value = value
    }
}
