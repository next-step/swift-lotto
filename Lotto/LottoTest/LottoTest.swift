//
//  LottoTest.swift
//  LottoTest
//
//  Created by 조민호 on 2021/11/11.
//

import XCTest

class LottoTest: XCTestCase {
    
    func test_입력받은_문자열_Split_잘되는지() {
        let input = "1,2:3"
        
        let result = Calculator().split(input: input)
        
        XCTAssertEqual(result, ["1", "2", "3"])
    }
    
    func test_문자열_덧셈() {
        let input = ["1", "2", "3"]

        let result = Calculator().add(input: input)

        XCTAssertEqual(result, 6)
    }
    
    func test_split된_문자열_더하기() {
        let input = "1,2:3"
        
        let result = Calculator().calculate(input: input)
        
        XCTAssertEqual(result, 6)
    }
    
    
}
