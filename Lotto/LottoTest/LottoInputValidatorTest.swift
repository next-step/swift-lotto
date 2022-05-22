//
//  LottoInputValidatorTest.swift
//  LottoTest
//
//  Created by brian은석 on 2022/05/22.
//

import XCTest

class LottoInputValidatorTest: XCTestCase {
    private let validator = LottoInputValidator()
    
    func test_로또구입갯수_음수_에러() {
        let expected = InputError.negativeNumber
        do {
            let _ = try validator.validatePositive(-3)
        } catch {
            XCTAssert(error as? InputError == expected, "로또는 음수 불가능 합니다")
        }
        
    }
    
    func test_로또번호_1미만숫자포함_에러()  {
        let expected = InputError.lottoOutOfRange
        do {
            let _ = try validator.validateNumbersRange([0,1,2,3,4,5])
        } catch {
            XCTAssert(error as? InputError == expected, "로또번호 범위는 1~45 입니다")
        }
    }
    
    func test_로또번호_45초과숫자포함_에러()  {
        let expected = InputError.lottoOutOfRange
        do {
            let _ = try validator.validateNumbersRange([11,1,2,3,4,55])
        } catch {
            XCTAssert(error as? InputError == expected, "로또번호 범위는 1~45 입니다")
        }
    }
    
    func test_로또_중복숫자포함_에러() {
        let expected = InputError.duplicateNumber
        do {
            let _ = try validator.validateNumbersRange([1,1,2,3,4,35])
        } catch {
            XCTAssert(error as? InputError == expected, "로또번호는 중복이 불가능합니다")
        }
    }
    
    func test_로또번호_5개_에러() {
        let expected = InputError.invalidNumberCount
        do {
            let _ = try validator.validateLottoNumbersCount([1,2,3,4,5])
        } catch {
            XCTAssert(error as? InputError == expected, "로또번호는 6개가 규칙입니다")
        }
    }

}
