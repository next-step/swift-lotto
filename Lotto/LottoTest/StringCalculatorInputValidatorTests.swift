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
    
    func test_isValidInput_whenInputIsSinglePositiveInt_toBeTrue() throws {
        //given
        let input: String = "3"
        
        // when
        let result: Bool = sut.isValid(of: input)
        
        // then
        XCTAssertTrue(result)
    }
    
    func test_isValidInput_whenUseSeparatorsAsComma_toBeTrue() throws {
        //given
        let input: String = "1,2,3"
        
        // when
        let result: Bool = sut.isValid(of: input)
        
        // then
        XCTAssertTrue(result)
    }
    
    func test_isValidInput_whenUseSeparatorsAsColon_toBeTrue() throws {
        //given
        let input: String = "1:2:3"
        
        // when
        let result: Bool = sut.isValid(of: input)
        
        // then
        XCTAssertTrue(result)
    }
    
    func test_isValidInput_whenUseSeparatorsAsCommaOrColon_toBeTrue() throws {
        //given
        let input: String = "1,2:3"
        
        // when
        let result: Bool = sut.isValid(of: input)
        
        // then
        XCTAssertTrue(result)
    }
    
    func test_isValidInput_whenInputIsEmpty_toBeFalse() throws {
        //given
        let input: String = ""
        
        // when
        let result: Bool = sut.isValid(of: input)
        
        // then
        XCTAssertFalse(result)
    }
    
    func test_isValidInput_whenInputIsSpace_toBeFalse() throws {
        //given
        let input: String = " "
        
        // when
        let result: Bool = sut.isValid(of: input)
        
        // then
        XCTAssertFalse(result)
    }
    
    func test_isValidInput_whenInputIsNil_toBeFalse() throws {
        //given
        let input: String? = nil
        
        // when
        let result: Bool = sut.isValid(of: input)
        
        // then
        XCTAssertFalse(result)
    }
    
    func test_isValidInput_whenInputIsSingleNegativeInt_toBeFalse() throws {
        //given
        let input: String = "-3"
        
        // when
        let result: Bool = sut.isValid(of: input)
        
        // then
        XCTAssertFalse(result)
    }
    
    func test_isValidInput_whenInputIsDouble_toBeFalse() throws {
        //given
        let input: String = "3.2"
        
        // when
        let result: Bool = sut.isValid(of: input)
        
        // then
        XCTAssertFalse(result)
    }
    
    func test_isValidInput_whenInputHasSameSuccessivieSeparators_toBeFalse() throws {
        //given
        let input: String = "1,2,,3"
        
        // when
        let result: Bool = sut.isValid(of: input)
        
        // then
        XCTAssertFalse(result)
    }
    
    func test_isValidInput_whenInputHasDifferentSuccessivieSeparators_toBeFalse() throws {
        //given
        let input: String = "1,2,:3"
        
        // when
        let result: Bool = sut.isValid(of: input)
        
        // then
        XCTAssertFalse(result)
    }
    
    func test_isValidInput_whenInputContainsNegativeInt_toBeFalse() throws {
        //given
        let input: String = "1,2,-3"
        
        // when
        let result: Bool = sut.isValid(of: input)
        
        // then
        XCTAssertFalse(result)
    }
    
    func test_isValidInput_whenInputContainsNeitherNumberNorSeparator_toBeFalse() throws {
        //given
        let input: String = "1,2#3"
        
        // when
        let result: Bool = sut.isValid(of: input)
        
        // then
        XCTAssertFalse(result)
    }
    
    func test_isValidInput_whenInputDoesNotEndWithNumber_toBeFalse() throws {
        //given
        let input: String = "1,2,"
        
        // when
        let result: Bool = sut.isValid(of: input)
        
        // then
        XCTAssertFalse(result)
    }
    
    func test_isValidInput_whenInputEndsWithSpace_toBeFalse() throws {
        //given
        let input: String = "1,2 "
        
        // when
        let result: Bool = sut.isValid(of: input)
        
        // then
        XCTAssertFalse(result)
    }
    
    func test_isValidInput_whenInputContainsSpace_toBeFalse() throws {
        //given
        let input: String = "1, 2"
        
        // when
        let result: Bool = sut.isValid(of: input)
        
        // then
        XCTAssertFalse(result)
    }
}
