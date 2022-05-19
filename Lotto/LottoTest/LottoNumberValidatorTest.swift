//
//  LottoNumberValidatorTest.swift
//  LottoTest
//
//  Created by nylah.j on 2022/05/17.
//

import XCTest

class LottoNumberValidatorTest: XCTestCase {

    func test_validateNumbers_파라미터로_주어진_Int_array가_lotto번호규칙을_만족하면_error를_던지지_않는다() {
        // given
        let validLottoNumbers = [1, 2, 3, 4, 5, 6]
        
        // when
        // then
        XCTAssertNoThrow(try LottoNumberValidator.validateNumberRange(of: validLottoNumbers))
    }
    
    func test_validateNumberCount_파라미터로_주어진_IntArray가_lotto번호개수만큼_숫자를_가지고있지않으면_에러를_던진다() {
        // given
        let invalidLottoNumbers = [1, 2, 3, 4, 5, 5]
        
        // when
        // then
        XCTAssertThrowsError(try LottoNumberValidator.validateNumberCount(of: invalidLottoNumbers))
g    }
}
