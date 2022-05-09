//
//  Lotto - main.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import Foundation


let caculator = StringAdditionCaculator()
let printer = StringAdditionPrinter()

do  {
    let total = try caculator.caculate(input: "1,3:3,5")
    printer.printResult(total)
} catch let error {
    printer.printError(error)
}




