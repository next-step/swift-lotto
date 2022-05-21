//
//  UserInputConverterTests.swift
//  LottoTest
//
//  Created by 강수진 on 2022/05/06.
//

import XCTest

class UserInputConverterTests: XCTestCase {

    var sut: UserInputConverter!
    
    override func setUpWithError() throws {
        sut = UserInputConverter()
    }
    
    override func tearDownWithError() throws {
        sut = nil
    }
    
    // MARK: - convertToInt
    
    func test_convertToInt_whenInputIsIntString_equalToOriginalInputAsInt() throws {
        //given
        let input = "1000"
        
        // when
        let result = try sut.convertToInt(from: input)
        
        // then
        let expectation = 1000
        XCTAssertEqual(result, expectation)
    }

    
    // MARK: - convertToWinningNumbers
    
    func test_convertToWinningNumbers_whenNumbersAreSeparatedByComma() throws {
        //given
        let input = "1,2,3,4,5,6"
        
        // when
        let result = try sut.convertToLottoNumbers(from: input)
        
        // then
        let expectation = [1,2,3,4,5,6].map(LottoNumber.init)
        XCTAssertEqual(result, expectation)
    }
    
    func test_convertToWinningNumbers_whenHasSpaceBetweenInput() throws {
        //given
        let input = "1, 2, 3, 4, 5, 6"
        
        // when
        let result = try sut.convertToLottoNumbers(from: input)
        
        // then
        let expectation = [1,2,3,4,5,6].map(LottoNumber.init)
        XCTAssertEqual(result, expectation)
    }
    
    func test_convertToWinningNumbers_whenHasExtraSeparators_throwExtraInputs() throws {
        //given
        let input = ", 1, 2,, 3, 4, 5, 6,"
        
        // when
        // then
        let expectation = UserInputConverter.UserInputConverterError.WinningNumbers.extraInputs
        XCTAssertThrowsError(try sut.convertToLottoNumbers(from: input)) { error in
            XCTAssertEqual(error as? UserInputConverter.UserInputConverterError.WinningNumbers, expectation)
        }
    }
    
    func test_convertToWinningNumbers_whenHasValueExceptNumberAndComma_throwExtraInputs() throws {
        //given
        let input = "1,2,3,4,5$6"
        
        // then
        let expectation = UserInputConverter.UserInputConverterError.WinningNumbers.extraInputs
        XCTAssertThrowsError(try sut.convertToLottoNumbers(from: input)) { error in
            XCTAssertEqual(error as? UserInputConverter.UserInputConverterError.WinningNumbers, expectation)
        }
    }
    
    // MARK: - errorDescription
    
    func test_errorDescription_whenConvertToWinningNumbersInputHasExtraSeparators() throws {
        //given
        let input = ", 1, 2,, 3, 4, 5, 6,"
        
        // when
        // then
        XCTAssertThrowsError(try sut.convertToLottoNumbers(from: input)) { error in
            let result = error.localizedDescription
            let expectation = "숫자와 구분자를 위한 하나의 , 만 입력해주세요"
            XCTAssertEqual(result, expectation)
        }
    }
}
