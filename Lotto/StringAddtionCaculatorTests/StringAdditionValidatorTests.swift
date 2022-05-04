//
//  StringAdditionValidatorTests.swift
//  StringAdditionCaculator
//
//  Created by jinho jeong on 2022/05/04.
//

import XCTest
@testable import Lotto

class StringAdditionValidatorTests: XCTestCase {

    let sut: StringAdditionValidator = StringAdditionValidator()
    
    func test_givenNil_or_빈문자열_when유효성검사_then숫자0반환() {
        
    }

    func test_given비어져있지않은_문자열_when유효성검사_then숫자반환() {
        
    }
    
    func test_given음수문자열_when유효성검사_then에러반환() throws {
        
    }
}
