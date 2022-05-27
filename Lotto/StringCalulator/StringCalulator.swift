//
//  StringCalulator.swift
//  StringCalulator
//
//  Created by 김성준 on 2022/05/27.
//

import XCTest

class StringCalulator: XCTestCase {
    
    func test_inputString_nil일때_0반환하는지() {
        //given
        let receivedText: String? = nil
        let inputView = InputView()
        
        //when
        let result = inputView.validation(receivedText)
        
        //then
        XCTAssertEqual(result, 0)
    }
    
    func test_InputString_nil아닐때_1반환하는지() {
        //given
        let receivedText: String? = "1"
        let inputView = InputView()
        
        //when
        let result = inputView.validation(receivedText)
        
        //then
        XCTAssertEqual(result, 1)
    }
    
    func test_숫자하나_1를_문자열로_입력한_경우_해당숫자_1을_반환하는지() {
        //given
        let receivedText: String = "1"
        let inputView = InputView()
        
        //when
        let result = try! inputView.convertToIntegerArray(receivedText: receivedText)
        
        //then
        XCTAssertEqual(result[0], 1)
    }
    
    func test_컴마_콜론_섞인_1_2_3_4_5배열_숫자배열로_반환하는지(){
        //given
        let receivedText: String = "1,2:3,4:5"
        let inputView = InputView()
        
        //when
        let result = try! inputView.convertToIntegerArray(receivedText: receivedText)
        
        //then
        XCTAssertEqual(result, [1,2,3,4,5])
    }
    
    
    func test_음수_섞여있을때_error_unacceptableNumbers_발생하는지(){
        //given
        let receivedText: String = "1,2:3,4:-5"
        let inputView = InputView()

        //when / then
        XCTAssertThrowsError(try inputView.convertToIntegerArray(receivedText: receivedText)) { error in
            XCTAssertEqual(error as! InputError, InputError.unacceptableNumbers)
        }
    }
}
