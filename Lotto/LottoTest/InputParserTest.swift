//
//  InputParserTest.swift
//  LottoTest
//
//  Created by nylah.j on 2022/05/07.
//

import XCTest

class InputParserTest: XCTestCase {
    var inputParser: InputParser!
    
    override func setUpWithError() throws {
        let separators = Separators(value: [Comma(), Colon()])
        let splitter = Splitter(separaters: separators)
        inputParser = InputParser(splitter: splitter, numberGenerator: PositiveNumberGenerator.self)
    }
    
    override func tearDownWithError() throws {
        inputParser = nil
    }

    func test_parse_nil이_입력되면_0이담긴배열이_반환된다() {
        // given
        let nilString: String? = nil
        
        // when
        let result = try! inputParser.parse(input: nilString)
        
        // then
        XCTAssertEqual(result, [0])
    }
    
    func test_parse_빈문자열이_입력되면_0이담긴배열이_반환된다() {
        // given
        let emptyString = ""
        
        // when
        let result = try! inputParser.parse(input: emptyString)
        
        // then
        XCTAssertEqual(result, [0])
    }
    
    func test_parse_콜론과_콤마를_기준으로_입력을_분리한후_Int배열로반환한다() {
        // given
        let input = "1,:2,3:4,,,5:::6"
        // when
        
        let result = try! inputParser.parse(input: input)
        
        // then
        XCTAssertEqual(result, [1,2,3,4,5,6])
    }
    
    func test_parse_콜론_콤마_숫자_이외의_값이_입력될경우_error를_throw한다() {
        // given
        let input = "1!;2,!3,:!4"
        
        // when
        // then
        XCTAssertThrowsError(try inputParser.parse(input: input), "콜론,콤마,숫자 이외의 값이 입력될 경우 error를throw한다") { error in
            XCTAssert(error is PositiveNumberGenerator.Error)
            XCTAssertEqual(error.localizedDescription, PositiveNumberGenerator.Error.isNotNumber("1!;2").localizedDescription)
        }
    }
    
    func test_parse_음수가_들어있을경우_error를_throw한다() {
        // given
        let input = "1,:-2,3:4,,,5:::6"
        
        // when
        // then
        XCTAssertThrowsError(try inputParser.parse(input: input), "음수가 들어잇을 경우 error를 throw한다") { error in
            XCTAssert(error is PositiveNumberGenerator.Error)
            XCTAssertEqual(error.localizedDescription, PositiveNumberGenerator.Error.isNegativeNumber(-2).localizedDescription)
        }
    }
}
