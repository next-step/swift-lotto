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
}
