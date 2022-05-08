//
//  StringConverterTests.swift
//  LottoTest
//
//  Created by 강수진 on 2022/05/05.
//

import XCTest

class StringConverterTests: XCTestCase {

    var sut: StringConverter!
    
    override func setUpWithError() throws {
        sut = StringConverter()
    }

    override func tearDownWithError() throws {
        sut = nil
    }
    
    // MARK: - unwrapOptional
    
    func test_unwrapOptional_whenInputIsNil_throwNilValue() throws {
        //given
        let input: String? = nil
        
        // when
        // then
        let expectation = StringConverter.StringConverterError.nilValue
        XCTAssertThrowsError(try sut.unwrapOptional(from: input)) { error in
            XCTAssertEqual(error as? StringConverter.StringConverterError, expectation)
        }
    }

    
    // MARK: - convertToInt
    
    func test_convertToInt_whenInputIsIntString_equalToOriginalInputAsInt() throws {
        // given
        let input = "1"
        
        // when
        let result = try sut.convertToInt(from: input)
        
        // then
        let expectation = 1
        XCTAssertEqual(result, expectation)
    }
    
    func test_convertToInt_whenInputIsDoubleString_throwError() throws {
        // given
        let input = "1.1"

        // when
        // then
        XCTAssertThrowsError(try sut.convertToInt(from: input))
    }
    
    func test_convertToInt_inputIsNotNumberString_throwError() throws {
        // given
        let input = "+"

        // when
        // then
        XCTAssertThrowsError(try sut.convertToInt(from: input))
    }
    
    // MARK: -  guideDescription
    
    func test_guideDescription_whenUnwrapOptionalInputIsNil() throws {
        //given
        let input: String? = nil
        
        // when
        // then
        XCTAssertThrowsError(try sut.unwrapOptional(from: input)) { error in
            let result = (error as? StringConverter.StringConverterError)?.guideDescription
            let expectation = "빈 값이 들어왔습니다"
            XCTAssertEqual(result, expectation)
        }
    }
    
    func test_guideDescription_whenConvertToIntInputIsEmpty() throws {
        //given
        let input: String = ""
        
        // when
        // then
        XCTAssertThrowsError(try sut.convertToInt(from: input)) { error in
            let result = (error as? StringConverter.StringConverterError)?.guideDescription
            let expectation = "Int 로 변환에 실패했습니다. 정수를 입력해주세요"
            XCTAssertEqual(result, expectation)
        }
    }
}

