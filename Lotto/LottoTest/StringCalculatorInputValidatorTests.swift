//
//  StringCalculatorInputValidatorTests.swift
//  LottoTest
//
//  Created by 강수진 on 2022/05/04.
//

import XCTest

class StringCalculatorInputValidatorTests: XCTestCase {

    var sut: StringCalculatorInputValidator!
    
    override func setUpWithError() throws {
        sut = StringCalculatorInputValidator()
    }
    
    override func tearDownWithError() throws {
        sut = nil
    }
    
    func test_isValidInput_whenInputIsSinglePositiveInt_beTrue() throws {
        //given
        let input = "3"
        
        // when
        let result = sut.isValid(of: input)
        
        // then
        XCTAssertTrue(result)
    }
}
