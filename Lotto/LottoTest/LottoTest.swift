//
//  LottoTest.swift
//  LottoTest
//
//  Created by 조민호 on 2021/11/11.
//

import XCTest

class LottoTest: XCTestCase {
    
    func test_입력받은_문자열이_쉽표와_콜론을_기준으로_Split_잘되는지() {
        let input = "1,2:3"
        
        let result = Calculator().split(input: input)
        
        XCTAssertEqual(result, ["1", "2", "3"])
    }
    
    func test_입력받은_문자열이_쉼표를_기준으로_Split_잘되는지() {
        let input = "1,2"
        
        let result = Calculator().split(input: input)
        
        XCTAssertEqual(result, ["1", "2"])
    }
    
    func test_입력받은_문자열이_콜론을_기준으로_Split_잘되는지() {
        let input = "1:2"
        
        let result = Calculator().split(input: input)
        
        XCTAssertEqual(result, ["1", "2"])
    }
    
    func test_입력받은_문자열이_하나일경우_Split_잘되는지() {
        let input = "1"
        
        let result = Calculator().split(input: input)
        
        XCTAssertEqual(result, ["1"])
    }
    
    func test_문자열_덧셈() {
        let input = ["1", "2", "3"]
        
        let result = try? Calculator().add(input: input)
        
        XCTAssertEqual(result, 6)
    }
    
    func test_split된_문자열_더하기() {
        let input = "1,2:3"
        
        let result = try? Calculator().calculate(input: input)
        
        XCTAssertEqual(result, 6)
    }
    
    func test_입력값이_음수인경우() {
        let input = "-1,2:3"
        
        XCTAssertThrowsError(try Calculator().calculate(input: input)) { error in
            XCTAssertEqual(error as! InputError, InputError.valueIsInvalid)
        }
    }
    
    func test_입력값이_특수문자인경우() {
        let input = "-1,#:3"
        
        XCTAssertThrowsError(try Calculator().calculate(input: input)) { error in
            XCTAssertEqual(error as! InputError, InputError.valueIsInvalid)
        }
    }
    
    func test_입력값이_공백인경우() {
        let input = ""
        
        let result = try? Calculator().calculate(input: input)
        
        XCTAssertEqual(result, 0)
    }

}
