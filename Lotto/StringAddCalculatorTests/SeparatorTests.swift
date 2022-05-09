//
//  SeparatorTests.swift
//  StringAddCalculatorTests
//
//  Created by YooBin Jo on 2022/05/06.
//

import XCTest

class SeparatorTests: XCTestCase {
    
    func test_빈_문자가_입력이_되면_0을_반환한다() {
        let input: String? = nil
        let operate: [String] = Separator.separate(input)
        let output: [String] = ["0"]
        XCTAssertEqual(operate,
                       output,
                       "0이 반환되지 않았습니다.")
    }
    
    func test_컴마가_구분자로_입력됐을_때_잘_분리가_된다() {
        let input: String? = "1,2,3"
        let operate: [String] = Separator.separate(input)
        let output: [String] = ["1", "2", "3"]
        XCTAssertEqual(operate,
                       output,
                       "분리가 정상적으로 이뤄지지 않았습니다.")
    }
    
    func test_콜론이_구분자로_입력됐을_때_잘_분리가_된다() {
        let input: String? = "1:2:3"
        let operate: [String] = Separator.separate(input)
        let output: [String] = ["1", "2", "3"]
        XCTAssertEqual(operate,
                       output,
                       "분리가 정상적으로 이뤄지지 않았습니다.")
    }
    
    func test_컴마_혹은_콜론이_구분자로_입력됐을_때_잘_분리가_된다() {
        let input: String? = "1,2:3"
        let operate: [String] = Separator.separate(input)
        let output: [String] = ["1", "2", "3"]
        XCTAssertEqual(operate,
                       output,
                       "분리가 정상적으로 이뤄지지 않았습니다.")
    }
}
