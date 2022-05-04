//
//  ValidOperandMakerTests.swift
//  LottoTest
//
//  Created by 강수진 on 2022/05/04.
//

import XCTest

class ValidOperandMakerTests: XCTestCase {

    var sut: ValidOperandMaker!
    
    override func setUpWithError() throws {
        sut = ValidOperandMaker()
    }
    
    override func tearDownWithError() throws {
        sut = nil
    }
    
    func test_filteredOperands_whenHasSingleSeparator() throws {
        //given
        let input: String = "1"
        
        // when
        let result: Int = try sut.operand(from: input)
        
        // then
        let expectation: Int = 1
        XCTAssertEqual(result, expectation)
    }
    
    func test_filteredOperands_whenHasSingleSeparator2() throws {
        //given
        let input: String = "0"
        
        // when
        let result: Int = try sut.operand(from: input)
        
        // then
        let expectation: Int = 0
        XCTAssertEqual(result, expectation)
    }
    
    func test_filteredOperands_whenHasSingleSeparator1() throws {
        //given
        let input: String = "-1"
        
        // when
        // then
        XCTAssertThrowsError(try sut.operand(from: input))
    }
    
    func test_filteredOperands_whenHasSingleSeparator12() throws {
        //given
        let input: String = ""
        
        // when
        // then
        XCTAssertThrowsError(try sut.operand(from: input))
    }
    
    func test_filteredOperands_whenHasSingleSeparator31() throws {
        //given
        let input: String = "+"
        
        // when
        // then
        XCTAssertThrowsError(try sut.operand(from: input))
    }
}
