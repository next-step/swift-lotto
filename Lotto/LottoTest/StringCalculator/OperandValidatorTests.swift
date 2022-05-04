//
//  OperandValidatorTests.swift
//  LottoTest
//
//  Created by 강수진 on 2022/05/04.
//

import XCTest

class OperandValidatorTests: XCTestCase {

    var sut: OperandValidator!
    
    override func setUpWithError() throws {
        sut = OperandValidator()
    }
    
    override func tearDownWithError() throws {
        sut = nil
    }
    
    func test_isValidOperand_whenInputIsPositiveInt_toBeTrue() throws {
        //given
        let input: Int = 1
        
        // when
        let result: Bool = sut.isValid(of: input)
        
        // then
        XCTAssertTrue(result)
    }
    
    func test_isValidOperand_whenInputIsZero_toBeTrue() throws {
        //given
        let input: Int = 0
        
        // when
        let result: Bool = sut.isValid(of: input)
        
        // then
        XCTAssertTrue(result)
    }
    
    func test_isValidOperand_whenInputIsNegativeInt_toBeFalse() throws {
        //given
        let input: Int = -1
        
        // when
        let result: Bool = sut.isValid(of: input)
        
        // then
        XCTAssertFalse(result)
    }
}
