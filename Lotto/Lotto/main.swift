//
//  Lotto - main.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import Foundation

do {
    let stringArray = Separator.separate(readLine())
    let intArray = try Converter.convert(stringArray)
    let result = Calculator.add(intArray)
    
    print(result)
} catch {
    dump(error.localizedDescription)
}
