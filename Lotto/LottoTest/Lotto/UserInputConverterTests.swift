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
    
    // MARK: - convertToMoney
    
    func test_convertToMoney_whenInputIsIntString_equalToOriginalInputAsInt() throws {
        //given
        let input = "1000"
        
        // when
        let result = try sut.convertToMoney(from: input)
        
        // then
        let expectation = 1000
        XCTAssertEqual(result, expectation)
    }
    
    func test_validPurchaseMoney_whenInputIsNotIntString_throwNotInt() throws {
        //given
        let input = "#$"
        
        // when
        // then
        let expectation = UserInputConverter.UserInputConverterError.PurchaseMoney.notInt
        XCTAssertThrowsError(try sut.convertToMoney(from: input)) { error in
            XCTAssertEqual(error as? UserInputConverter.UserInputConverterError.PurchaseMoney, expectation)
        }
    }
    
    func test_convertToMoney_whenInputIsNil_throwEmpty() throws {
        //given
        let input: String? = nil
        
        // when
        // then
        let expectation = UserInputConverter.UserInputConverterError.PurchaseMoney.empty
        XCTAssertThrowsError(try sut.convertToMoney(from: input)) { error in
            XCTAssertEqual(error as? UserInputConverter.UserInputConverterError.PurchaseMoney, expectation)
        }
    }
    
    func test_convertToMoney_whenInputIsEmptyString_throwEmpty() throws {
        //given
        let input = ""
        
        // when
        // then
        let expectation = UserInputConverter.UserInputConverterError.PurchaseMoney.empty
        XCTAssertThrowsError(try sut.convertToMoney(from: input)) { error in
            XCTAssertEqual(error as? UserInputConverter.UserInputConverterError.PurchaseMoney, expectation)
        }
    }
    
    // MARK: - convertToWinningNumbers
    
    func test_convertToWinningNumbers_whenNumbersAreSeparatedByComma() throws {
        //given
        let input = "1,2,3,4,5,6"
        
        // when
        let result = try sut.convertToWinningNumbers(from: input)
        
        // then
        let expectation = [1,2,3,4,5,6]
        XCTAssertEqual(result, expectation)
    }
    
    func test_convertToWinningNumbers_whenHasSpaceBetweenInput() throws {
        //given
        let input = "1, 2, 3, 4, 5, 6"
        
        // when
        let result = try sut.convertToWinningNumbers(from: input)
        
        // then
        let expectation = [1,2,3,4,5,6]
        XCTAssertEqual(result, expectation)
    }
    
    func test_convertToWinningNumbers_whenHasExtraSeparators_throwExtraInputs() throws {
        //given
        let input = ", 1, 2,, 3, 4, 5, 6,"
        
        // when
        // then
        let expectation = UserInputConverter.UserInputConverterError.WinningNumbers.extraInputs
        XCTAssertThrowsError(try sut.convertToWinningNumbers(from: input)) { error in
            XCTAssertEqual(error as? UserInputConverter.UserInputConverterError.WinningNumbers, expectation)
        }
    }
    
    func test_convertToWinningNumbers_whenHasValueExceptNumberAndComma_throwExtraInputs() throws {
        //given
        let input = "1,2,3,4,5$6"
        
        // then
        let expectation = UserInputConverter.UserInputConverterError.WinningNumbers.extraInputs
        XCTAssertThrowsError(try sut.convertToWinningNumbers(from: input)) { error in
            XCTAssertEqual(error as? UserInputConverter.UserInputConverterError.WinningNumbers, expectation)
        }
    }
    
    func test_convertToWinningNumbers_whenInputIsNil_throwEmpty() throws {
        //given
        let input: String? = nil
        
        // when
        // then
        let expectation = UserInputConverter.UserInputConverterError.WinningNumbers.empty
        XCTAssertThrowsError(try sut.convertToWinningNumbers(from: input)) { error in
            XCTAssertEqual(error as? UserInputConverter.UserInputConverterError.WinningNumbers, expectation)
        }
    }
    
    func test_convertToWinningNumbers_whenInputIsEmptyString_throwEmpty() throws {
        //given
        let input = ""
        
        // when
        // then
        let expectation = UserInputConverter.UserInputConverterError.WinningNumbers.empty
        XCTAssertThrowsError(try sut.convertToWinningNumbers(from: input)) { error in
            XCTAssertEqual(error as? UserInputConverter.UserInputConverterError.WinningNumbers, expectation)
        }
    }
    
    // MARK: - guideDescription
    
    func test_guideDescription_whenConvertToMoneyInputIsNil() throws {
        //given
        let input: String? = nil
        
        // when
        // then
        XCTAssertThrowsError(try sut.convertToMoney(from: input)) { error in
            let result = (error as? UserInputConverter.UserInputConverterError.PurchaseMoney)?.guideDescription
            let expectation = "빈 값이 들어왔습니다"
            XCTAssertEqual(result, expectation)
        }
    }
    
    func test_guideDescription_whenConvertToMoneyInputIsNotIntString() throws {
        //given
        let input = "#$"
        
        // when
        // then
        XCTAssertThrowsError(try sut.convertToMoney(from: input)) { error in
            let result = (error as? UserInputConverter.UserInputConverterError.PurchaseMoney)?.guideDescription
            let expectation = "Int 값이 아닙니다"
            XCTAssertEqual(result, expectation)
        }
    }
    
    func test_guideDescription_whenConvertToWinningNumbersInputIsNil() throws {
        //given
        let input: String? = nil
        
        // when
        // then
        XCTAssertThrowsError(try sut.convertToWinningNumbers(from: input)) { error in
            let result = (error as? UserInputConverter.UserInputConverterError.WinningNumbers)?.guideDescription
            let expectation = "빈 값이 들어왔습니다"
            XCTAssertEqual(result, expectation)
        }
    }
    
    func test_guideDescription_whenConvertToWinningNumbersInputHasExtraSeparators() throws {
        //given
        let input = ", 1, 2,, 3, 4, 5, 6,"
        
        // when
        // then
        XCTAssertThrowsError(try sut.convertToWinningNumbers(from: input)) { error in
            let result = (error as? UserInputConverter.UserInputConverterError.WinningNumbers)?.guideDescription
            let expectation = "숫자와 구분자를 위한 하나의 , 만 입력해주세요"
            XCTAssertEqual(result, expectation)
        }
    }
}
