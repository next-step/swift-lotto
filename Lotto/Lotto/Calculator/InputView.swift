//
//  InputView.swift
//  Lotto
//
//  Created by 카카오VX on 2022/04/29.
//

import Foundation

struct InputView {
    static func read(with description: String) -> String {
        print(description)
        let line = readLine() ?? ""
        return line
    }
    
    static func readExpression() -> String {
        return read(with: "연산식을 입력하세요.")
    }
}
