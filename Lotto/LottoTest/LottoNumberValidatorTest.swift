//
//  LottoNumberValidatorTest.swift
//  LottoTest
//
//  Created by nylah.j on 2022/05/17.
//

import XCTest

class LottoNumberValidatorTest: XCTestCase {

    func test_validateNumbers_파라미터로_주어진_Int_array가_lotto번호규칙을_만족하면_true를_반환한다() {
        // given
        let validLottoNumbers = [1, 2, 3, 4, 5, 6]
        
        // when
        let result = LottoNumberValidator.validate(numbers: validLottoNumbers)
        
        // then
        XCTAssertTrue(result)
    }
    
    func test_validateNumberCount_파라미터로_주어진_IntArray가_lotto번호개수만큼_숫자를_가지고있지않으면_false를_반환한다() {
        // given
        let invalidLottoNumbers = [1, 2, 3, 4, 5, 5]
        
        // when
        let result = LottoNumberValidator.validate(numbers: invalidLottoNumbers)
        
        // then
        XCTAssertFalse(result)
    }
}
