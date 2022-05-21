//
//  LottoGeneratorTests.swift
//  LottoTest
//
//  Created by 강수진 on 2022/05/06.
//

import XCTest

class LottoGeneratorTests: XCTestCase {

    var sut: LottoGenerator!
    
    override func setUpWithError() throws {
        sut = LottoGenerator()
    }
    
    override func tearDownWithError() throws {
        sut = nil
    }
    
    func test_lottoNumberCount_eqaulToSix() throws {
        //given
        
        // when
        let lotto: Lotto = try sut.generate()
        
        // then
        let expectation: Int = 6
        XCTAssertEqual(lotto.numbers.count, expectation)
    }
    
    func test_lottoNumbers_hasNoDuplicate() throws {
        //given
        
        // when
        let lotto: Lotto = try sut.generate()
        
        // then
        XCTAssertEqual(lotto.numbers.count, Set(lotto.numbers).count)
    }
    
    func test_lottoNumbers_isInRange() throws {
        //given
        
        // when
        let lotto: Lotto = try sut.generate()
        
        
        // then
        let lottoNumberRange = 1...45
        let isAllNumbersInRange = lotto.numbers.map { $0.value }.allSatisfy { lottoNumber in
            lottoNumberRange ~= lottoNumber
        }
        
        XCTAssertTrue(isAllNumbersInRange)
    }
}
