//
//  StringCalculator.swift
//  Lotto
//
//  Created by sangsun on 2021/11/17.
//

import Foundation

class StringCalculator {
    
    // 도메인 지식 습득용 막구현 함수
//    func run() {
//        guard let inputs = readLine()?.components(separatedBy: [",", ":"]).compactMap({ Int($0) }) else { return }
//        print(inputs)
//        let result = inputs.reduce(0) { $0 + $1 }
//        print(result)
//    }
    
    /// 사용자로부터 입력받은 문자열을 가공한다
    func processingString(by inputs: String?) -> Int {
        guard let inputs = inputs, inputs.isEmpty == false else { return 0 }
        return 1
    }
}
