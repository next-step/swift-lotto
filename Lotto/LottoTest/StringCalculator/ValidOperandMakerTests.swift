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
    
    func test_validOperand_whenInputIsPositiveIntString_equalToOriginalInputAsInt() throws {
        //given
        let input: String = "1"
        
        // when
        let result: Int = try sut.operand(from: input)
        
        // then
        let expectation: Int = 1
        XCTAssertEqual(result, expectation)
    }
    
    func test_validOperand_whenInputIsZeroString_equalToOriginalInputAsInt() throws {
        //given
        let input: String = "0"
        
        // when
        let result: Int = try sut.operand(from: input)
        
        // then
        let expectation: Int = 0
        XCTAssertEqual(result, expectation)
    }
    
    func test_validOperand_whenInputIsNegativeIntString_throwError() throws {
        //given
        let input: String = "-1"
        
        // when
        // then
        XCTAssertThrowsError(try sut.operand(from: input))
    }
    
    func test_validOperand_whenInputIsEmpty_throwError() throws {
        //given
        let input: String = ""
        
        // when
        // then
        XCTAssertThrowsError(try sut.operand(from: input))
    }
    
    func test_validOperand_whenInputIsNotIntString_throwError() throws {
        //given
        let input: String = "+"
        
        // when
        // then
        XCTAssertThrowsError(try sut.operand(from: input))
    }
}
