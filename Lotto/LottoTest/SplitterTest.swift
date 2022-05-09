//
//  SplitterTest.swift
//  LottoTest
//
//  Created by nylah.j on 2022/05/07.
//

import XCTest
@testable import Lotto

class SplitterTest: XCTestCase {
    var splitter: Splitter!
    
    override func setUpWithError() throws {
        let separators = Separators(value: [Comma(), Colon()])
        splitter = Splitter(separaters: separators)
    }
    
    override func tearDownWithError() throws {
        splitter = nil
    }
    
    func test_split_Splitter가_가진_separator를_기준으로_나누어진다() {
        // given
        let input = "1,,2::3,:4,5:6-7"
        let expectedResult = ["1","2","3","4","5","6-7"]
        
        // when
        let result = splitter.split(input)
        
        // then
        XCTAssertEqual(result, expectedResult)
    }
}
