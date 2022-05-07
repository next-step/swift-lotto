//
//  SeparatorTests.swift
//  StringAddCalculatorTests
//
//  Created by YooBin Jo on 2022/05/06.
//

import XCTest

class SeparatorTests: XCTestCase {
    
    func test_컴마_혹은_콜론이_구분자로_입력됐을_때_잘_분리가_된다1() throws {
        XCTAssertEqual(Separator.separate("1,2,3"),
                       ["1", "2", "3"],
                       "분리가 정상적으로 이뤄지지 않았습니다.")
    }
    
    func test_컴마_혹은_콜론이_구분자로_입력됐을_때_잘_분리가_된다2() throws {
        XCTAssertEqual(Separator.separate("1:2:3"),
                       ["1", "2", "3"],
                       "분리가 정상적으로 이뤄지지 않았습니다.")
    }
    
    func test_컴마_혹은_콜론이_구분자로_입력됐을_때_잘_분리가_된다3() throws {
        XCTAssertEqual(Separator.separate("1,2:3"),
                       ["1", "2", "3"],
                       "분리가 정상적으로 이뤄지지 않았습니다.")
    }
}
