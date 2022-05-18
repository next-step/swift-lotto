//
//  ArrayExtensionTest.swift
//  LottoTest
//
//  Created by nylah.j on 2022/05/17.
//

import XCTest

class ArrayExtensionTest: XCTestCase {

    func test_canBeLottoNumbers_IntArray가_로또번호_규칙을_만족하면_true를_반환한다() {
        // given
        let validLottoNumbers = [1, 2, 3, 4, 5, 6]
        
        // when
        let result = validLottoNumbers.canBeLottoNumbers()
        
        // then
        XCTAssertTrue(result)
    }
}
