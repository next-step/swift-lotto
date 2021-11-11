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
        
        let result = split(input: input)
        
        XCTAssertEqual(result, ["1", "2", "3"])
    }
    
    func test_split된_문자열_더하기() throws {
        let input = split(input: "1,2:3")
        
        let result = add(input: input)
        
        XCTAssertEqual(result, 6)
    }
}
