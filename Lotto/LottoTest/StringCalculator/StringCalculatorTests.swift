//
//  StringCalculatorTests.swift
//  LottoTest
//
//  Created by 강수진 on 2022/05/04.
//

import XCTest

class StringCalculatorTests: XCTestCase {

    var sut: StringCalculator!
    
    override func setUpWithError() throws {
        sut = StringCalculator()
    }
    
    override func tearDownWithError() throws {
        sut = nil
    }
    
    func test_calculate_whenInputIsSinglePositiveInt_eqaulToInput() throws {
        //given
        let input: String = "3"
        
        // when
        let result: Int = try sut.calculate(of: input)
        
        // then
        let expectation: Int = 3
        XCTAssertEqual(result, expectation)
    }

    func test_calculate_whenPositiveIntsAreJoinedWithComma_addAllInts() throws {
        //given
        let input: String = "1,2,3"

        // when
        let result: Int = try sut.calculate(of: input)
        
        // then
        let expectation: Int = 6
        XCTAssertEqual(result, expectation)
    }

    func test_calculate_whenPositiveIntsAreJoinedWithColon_addAllInts() throws {
        //given
        let input: String = "1:2:3"

        // when
        let result: Int = try sut.calculate(of: input)
        
        // then
        let expectation: Int = 6
        XCTAssertEqual(result, expectation)
    }

    func test_calculate_whenPositiveIntsAreJoinedWithCommaAndColon_addAllInts() throws {
        //given
        let input: String = "1,2:3"

        // when
        let result: Int = try sut.calculate(of: input)
        
        // then
        let expectation: Int = 6
        XCTAssertEqual(result, expectation)
    }
    
    func test_calculate_whenInputIsEmpty_equalToZero() throws {
        //given
        let input: String = ""
        
        // when
        let result: Int = try sut.calculate(of: input)
        
        // then
        let expectation: Int = 0
        XCTAssertEqual(result, expectation)
    }
    
    func test_calculate_whenInputIsNil_equalToZero() throws {
        //given
        let input: String? = nil
        
        // when
        let result: Int = try sut.calculate(of: input)
        
        // then
        let expectation: Int = 0
        XCTAssertEqual(result, expectation)
    }
    
    func test_isValidInput_whenInputIsSpace_throwError() throws {
        //given
        let input: String = " "
        
        // when
        // then
        XCTAssertThrowsError(try sut.calculate(of: input))
    }
    
    func test_isValidInput_whenInputIsSingleNegativeInt_throwError() throws {
        //given
        let input: String = "-3"
        
        // when
        // then
        XCTAssertThrowsError(try sut.calculate(of: input))
    }
    
    func test_isValidInput_whenInputIsDouble_throwError() throws {
        //given
        let input: String = "3.2"
        
        // when
        // then
        XCTAssertThrowsError(try sut.calculate(of: input))
    }
    
    func test_isValidInput_whenInputHasSameSuccessivieSeparators_throwError() throws {
        //given
        let input: String = "1,2,,3"
        
        // when
        // then
        XCTAssertThrowsError(try sut.calculate(of: input))
    }
    
    func test_isValidInput_whenInputHasDifferentSuccessivieSeparators_throwError() throws {
        //given
        let input: String = "1,2,:3"
        
        // when
        // then
        XCTAssertThrowsError(try sut.calculate(of: input))
    }
    
    func test_isValidInput_whenInputContainsNegativeInt_throwError() throws {
        //given
        let input: String = "1,2,-3"
        
        // when
        // then
        XCTAssertThrowsError(try sut.calculate(of: input))
    }
    
    func test_isValidInput_whenInputContainsNeitherIntNorSeparator_throwError() throws {
        //given
        let input: String = "1,2#3"
        
        // when
        // then
        XCTAssertThrowsError(try sut.calculate(of: input))
    }
    
    func test_isValidInput_whenInputDoesNotEndWithInt_throwError() throws {
        //given
        let input: String = "1,2,"
        
        // when
        // then
        XCTAssertThrowsError(try sut.calculate(of: input))
    }
    
    func test_isValidInput_whenInputEndsWithSpace_throwError() throws {
        //given
        let input: String = "1,2 "
        
        // when
        // then
        XCTAssertThrowsError(try sut.calculate(of: input))
    }
    
    func test_isValidInput_whenInputContainsSpace_throwError() throws {
        //given
        let input: String = "1, 2"
        
        // when
        // then
        XCTAssertThrowsError(try sut.calculate(of: input))
    }
}
