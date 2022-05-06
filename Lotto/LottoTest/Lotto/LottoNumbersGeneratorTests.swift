//
//  LottoNumbersGeneratorTests.swift
//  LottoTest
//
//  Created by 강수진 on 2022/05/06.
//

import XCTest

class LottoNumberGeneratorTests: XCTestCase {

    var sut: LottoNumbersGenerator!
    
    override func setUpWithError() throws {
        sut = LottoNumbersGenerator()
    }
    
    override func tearDownWithError() throws {
        sut = nil
    }
    
    func test_lottoNumberCount_eqaulToSix() throws {
        //given
        
        // when
        let lottoNumbers: [Int] = sut.generate()
        
        // then
        let expectation: Int = 6
        XCTAssertEqual(lottoNumbers.count, expectation)
    }
    
    func test_lottoNumbers_hasNoDuplicate() throws {
        //given
        
        // when
        //todo_ 변인 통제가 안돼.
        let lottoNumbers: [Int] = sut.generate()
        
        // then
        XCTAssertEqual(lottoNumbers.count, Set(lottoNumbers).count)
    }
    
    func test_lottoNumbers_isInRange() throws {
        //given
        
        // when
        let lottoNumbers: [Int] = sut.generate()
        
        // then
        let lottoNumberRange = 1...45
        let isAllNumbersInRange = lottoNumbers.allSatisfy { lottoNumber in
            lottoNumberRange ~= lottoNumber
        }
        
        XCTAssertTrue(isAllNumbersInRange)
    }
}
