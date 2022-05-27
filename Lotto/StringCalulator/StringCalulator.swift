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
        let result = inputView.convertToIntegerArray(receivedText: receivedText)
        
        //then
        XCTAssertEqual(result[0], 1)
    }
    
    func test_컴마_콜론_섞인_1_2_3_4_5배열_숫자배열로_반환하는지(){
        //given
        let receivedText: String = "1,2:3,4:5"
        let inputView = InputView()
        
        //when
        let result = inputView.convertToIntegerArray(receivedText: receivedText)
        
        //then
        XCTAssertEqual(result, [1,2,3,4,5])
    }

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        measure {
            // Put the code you want to measure the time of here.
        }
    }

}
