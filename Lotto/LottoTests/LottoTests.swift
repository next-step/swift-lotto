//
//  LottoTests.swift
//  LottoTests
//
//  Created by 송유찬 on 2022/05/07.
//

import XCTest

class LottoTests: XCTestCase {
    
    // MARK: - 단일 로또 번호 테스트 케이스
    func test_로또번호_0_유효성_검증() throws {
        // given
        let number = 0
        
        // when, then
        XCTAssertThrowsError(try LottoNumber(number))
    }
    
    func test_로또번호_10_유효성_검증() throws {
        // given
        let number = 10
        
        // when, then
        XCTAssertNoThrow(try LottoNumber(number))
    }
    
    func test_로또번호_46_유효성_검증() throws {
        // given
        let number = 46
        
        // when, then
        XCTAssertThrowsError(try LottoNumber(number))
    }
    
    // MARK: - 로또번호 테스트 케이스
    func test_로또번호_중복없는_여섯자리인지_검증() throws {
        // given
        let lottoNumbers = [
            try LottoNumber(1),
            try LottoNumber(2),
            try LottoNumber(3),
            try LottoNumber(4),
            try LottoNumber(5),
            try LottoNumber(6)
        ]
        
        // when, then
        XCTAssertNoThrow(try LottoNumbers(numbers: lottoNumbers))
    }
    
    func test_다섯자리_로또_에러_검증() throws {
        // given
        let number1 = try LottoNumber(1)
        let number2 = try LottoNumber(2)
        let number3 = try LottoNumber(3)
        let number4 = try LottoNumber(4)
        let number5 = try LottoNumber(5)
        
        // when, then
        XCTAssertThrowsError(try LottoNumbers(numbers: [
            number1, number2, number3, number4, number5
        ]))
    }
    
    func test_여섯자리_로또_에러_검증() throws {
        // given
        let number1 = try LottoNumber(1)
        let number2 = try LottoNumber(2)
        let number3 = try LottoNumber(3)
        let number4 = try LottoNumber(4)
        let number5 = try LottoNumber(5)
        let number6 = try LottoNumber(6)
        
        // when, then
        XCTAssertNoThrow(try LottoNumbers(numbers: [
            number1, number2, number3, number4, number5, number6
        ]))
    }
    
    func test_중복_로또_에러_검증() throws {
        // given
        let number1 = try LottoNumber(1)
        let number2 = try LottoNumber(1)
        let number3 = try LottoNumber(1)
        let number4 = try LottoNumber(1)
        let number5 = try LottoNumber(1)
        let number6 = try LottoNumber(1)
        
        // when, then
        XCTAssertThrowsError(try LottoNumbers(numbers: [
            number1, number2, number3, number4, number5, number6
        ]))
    }
    
    func test_일곱자리_로또_에러_검증() throws {
        // given
        let number1 = try LottoNumber(1)
        let number2 = try LottoNumber(2)
        let number3 = try LottoNumber(3)
        let number4 = try LottoNumber(4)
        let number5 = try LottoNumber(5)
        let number6 = try LottoNumber(6)
        let number7 = try LottoNumber(7)
        
        // when, then
        XCTAssertThrowsError(try LottoNumbers(numbers: [
            number1, number2, number3, number4, number5, number6, number7
        ]))
    }
    
    // MARK: - 로또번호 자동 생성 테스트 케이스
    func test_로또_한번_자동생성() throws {
        // given
        let targetCount = 1

        // when, then
        let generator = LottoGenerator()
        XCTAssertNoThrow(try generator.auto(n: targetCount))
    }

    func test_로또_세번_자동생성() throws {
        // given
        let targetCount = 3
        let generator = LottoGenerator()
        let lottos = try generator.auto(n: targetCount)

        // when
        let count = lottos.count

        // then
        XCTAssertEqual(targetCount, count)
    }
    
    // MARK: - 당첨 복권 생성 테스트 케이스
    func test_보너스번호가_중복되는_당첨_복권_생성() throws {
        // given
        let winningNumbers = try LottoNumbers(numbers: [
            try LottoNumber(1),
            try LottoNumber(2),
            try LottoNumber(3),
            try LottoNumber(4),
            try LottoNumber(5),
            try LottoNumber(6)
        ])
        
        let bonusNumber = try LottoNumber(6)
        XCTAssertThrowsError(try WinnerLotto(winningNumbers, bonus: bonusNumber))
    }
    
    func test_당첨_복권_생성() throws {
        // given
        let winningNumbers = try LottoNumbers(numbers: [
            try LottoNumber(1),
            try LottoNumber(2),
            try LottoNumber(3),
            try LottoNumber(4),
            try LottoNumber(5),
            try LottoNumber(6)
        ])
        
        let bonusNumber = try LottoNumber(7)
        XCTAssertNoThrow(try WinnerLotto(winningNumbers, bonus: bonusNumber))
    }

    // MARK: - 로또 당첨(매치) 테스트 케이스
    func test_로또_1등_매치() throws {
        // given
        let lottoNumbers = try LottoNumbers(numbers: [
            try LottoNumber(1),
            try LottoNumber(2),
            try LottoNumber(3),
            try LottoNumber(4),
            try LottoNumber(5),
            try LottoNumber(6)
        ])

        let userLotto = Lotto(lottoNumbers)

        let winningNumbers = try LottoNumbers(numbers: [
            try LottoNumber(1),
            try LottoNumber(2),
            try LottoNumber(3),
            try LottoNumber(4),
            try LottoNumber(5),
            try LottoNumber(6)
        ])

        let bonusNumber = try LottoNumber(7)
        let winnerLotto = try WinnerLotto(winningNumbers, bonus: bonusNumber)
        
        // when
        let first: Match.Rank = .first
        
        // then
        XCTAssertTrue(userLotto.match(from: winnerLotto).rank == first)
    }
    
    func test_로또_2등_매치() throws {
        // given
        let lottoNumbers = try LottoNumbers(numbers: [
            try LottoNumber(1),
            try LottoNumber(2),
            try LottoNumber(3),
            try LottoNumber(4),
            try LottoNumber(5),
            try LottoNumber(6)
        ])

        let userLotto = Lotto(lottoNumbers)

        let winningNumbers = try LottoNumbers(numbers: [
            try LottoNumber(1),
            try LottoNumber(2),
            try LottoNumber(3),
            try LottoNumber(4),
            try LottoNumber(5),
            try LottoNumber(16)
        ])

        let bonusNumber = try LottoNumber(6)
        let winnerLotto = try WinnerLotto(winningNumbers, bonus: bonusNumber)
        
        // when
        let second: Match.Rank = .second
        
        // then
        XCTAssertTrue(userLotto.match(from: winnerLotto).rank == second)
    }
    
    func test_로또_3등_매치() throws {
        // given
        let lottoNumbers = try LottoNumbers(numbers: [
            try LottoNumber(1),
            try LottoNumber(2),
            try LottoNumber(3),
            try LottoNumber(4),
            try LottoNumber(5),
            try LottoNumber(6)
        ])

        let userLotto = Lotto(lottoNumbers)

        let winningNumbers = try LottoNumbers(numbers: [
            try LottoNumber(1),
            try LottoNumber(2),
            try LottoNumber(3),
            try LottoNumber(4),
            try LottoNumber(5),
            try LottoNumber(16)
        ])

        let bonusNumber = try LottoNumber(10)
        let winnerLotto = try WinnerLotto(winningNumbers, bonus: bonusNumber)
        
        // when
        let third: Match.Rank = .third
        
        // then
        XCTAssertTrue(userLotto.match(from: winnerLotto).rank == third)
    }
    
    func test_로또_4등_매치() throws {
        // given
        let lottoNumbers = try LottoNumbers(numbers: [
            try LottoNumber(1),
            try LottoNumber(2),
            try LottoNumber(3),
            try LottoNumber(4),
            try LottoNumber(5),
            try LottoNumber(6)
        ])

        let userLotto = Lotto(lottoNumbers)

        let winningNumbers = try LottoNumbers(numbers: [
            try LottoNumber(1),
            try LottoNumber(2),
            try LottoNumber(3),
            try LottoNumber(4),
            try LottoNumber(15),
            try LottoNumber(16)
        ])

        let bonusNumber = try LottoNumber(10)
        let winnerLotto = try WinnerLotto(winningNumbers, bonus: bonusNumber)
        
        // when
        let fourth: Match.Rank = .fourth
        
        // then
        XCTAssertTrue(userLotto.match(from: winnerLotto).rank == fourth)
    }
    
    func test_로또_5등_매치() throws {
        // given
        let lottoNumbers = try LottoNumbers(numbers: [
            try LottoNumber(1),
            try LottoNumber(2),
            try LottoNumber(3),
            try LottoNumber(4),
            try LottoNumber(5),
            try LottoNumber(6)
        ])

        let userLotto = Lotto(lottoNumbers)

        let winningNumbers = try LottoNumbers(numbers: [
            try LottoNumber(1),
            try LottoNumber(2),
            try LottoNumber(3),
            try LottoNumber(14),
            try LottoNumber(15),
            try LottoNumber(16)
        ])

        let bonusNumber = try LottoNumber(10)
        let winnerLotto = try WinnerLotto(winningNumbers, bonus: bonusNumber)
        
        // when
        let fifth: Match.Rank = .fifth
        
        // then
        XCTAssertTrue(userLotto.match(from: winnerLotto).rank == fifth)
    }
    
    func test_로또_1등_수_카운트() throws {
        // given
        let lottoNumbers1 = try LottoNumbers(numbers: [
            try LottoNumber(1),
            try LottoNumber(2),
            try LottoNumber(3),
            try LottoNumber(4),
            try LottoNumber(5),
            try LottoNumber(6)
        ])
        
        let lottoNumbers2 = try LottoNumbers(numbers: [
            try LottoNumber(11),
            try LottoNumber(22),
            try LottoNumber(33),
            try LottoNumber(44),
            try LottoNumber(15),
            try LottoNumber(16)
        ])

        let userLotto1 = Lotto(lottoNumbers1)
        let userLotto2 = Lotto(lottoNumbers2)
        let lottos = Lottos([userLotto1, userLotto2])

        let winningNumbers = try LottoNumbers(numbers: [
            try LottoNumber(1),
            try LottoNumber(2),
            try LottoNumber(3),
            try LottoNumber(4),
            try LottoNumber(5),
            try LottoNumber(6)
        ])

        let bonusNumber = try LottoNumber(10)
        let winnerLotto = try WinnerLotto(winningNumbers, bonus: bonusNumber)
        
        // when
        let first: Match.Rank = .first
        let count = 1
        
        // then
        XCTAssertTrue(lottos.placeCount(of: first, from: winnerLotto) == count)
    }
    
    func test_로또_2등_수_카운트() throws {
        // given
        let lottoNumbers1 = try LottoNumbers(numbers: [
            try LottoNumber(1),
            try LottoNumber(2),
            try LottoNumber(3),
            try LottoNumber(4),
            try LottoNumber(5),
            try LottoNumber(6)
        ])
        
        let lottoNumbers2 = try LottoNumbers(numbers: [
            try LottoNumber(11),
            try LottoNumber(22),
            try LottoNumber(33),
            try LottoNumber(44),
            try LottoNumber(15),
            try LottoNumber(16)
        ])

        let userLotto1 = Lotto(lottoNumbers1)
        let userLotto2 = Lotto(lottoNumbers2)
        let lottos = Lottos([userLotto1, userLotto2])

        let winningNumbers = try LottoNumbers(numbers: [
            try LottoNumber(1),
            try LottoNumber(2),
            try LottoNumber(3),
            try LottoNumber(4),
            try LottoNumber(5),
            try LottoNumber(7)
        ])

        let bonusNumber = try LottoNumber(6)
        let winnerLotto = try WinnerLotto(winningNumbers, bonus: bonusNumber)
        
        // when
        let second: Match.Rank = .second
        let count = 1
        
        // then
        XCTAssertTrue(lottos.placeCount(of: second, from: winnerLotto) == count)
    }
    
    func test_로또_3등_수_카운트() throws {
        // given
        let lottoNumbers1 = try LottoNumbers(numbers: [
            try LottoNumber(1),
            try LottoNumber(2),
            try LottoNumber(3),
            try LottoNumber(4),
            try LottoNumber(5),
            try LottoNumber(6)
        ])
        
        let lottoNumbers2 = try LottoNumbers(numbers: [
            try LottoNumber(11),
            try LottoNumber(22),
            try LottoNumber(33),
            try LottoNumber(44),
            try LottoNumber(15),
            try LottoNumber(16)
        ])

        let userLotto1 = Lotto(lottoNumbers1)
        let userLotto2 = Lotto(lottoNumbers2)
        let lottos = Lottos([userLotto1, userLotto2])

        let winningNumbers = try LottoNumbers(numbers: [
            try LottoNumber(1),
            try LottoNumber(2),
            try LottoNumber(3),
            try LottoNumber(4),
            try LottoNumber(5),
            try LottoNumber(17)
        ])

        let bonusNumber = try LottoNumber(16)
        let winnerLotto = try WinnerLotto(winningNumbers, bonus: bonusNumber)
        
        // when
        let third: Match.Rank = .third
        let count = 1
        
        // then
        XCTAssertTrue(lottos.placeCount(of: third, from: winnerLotto) == count)
    }
    
    func test_로또_4등_수_카운트() throws {
        // given
        let lottoNumbers1 = try LottoNumbers(numbers: [
            try LottoNumber(1),
            try LottoNumber(2),
            try LottoNumber(3),
            try LottoNumber(4),
            try LottoNumber(5),
            try LottoNumber(6)
        ])
        
        let lottoNumbers2 = try LottoNumbers(numbers: [
            try LottoNumber(11),
            try LottoNumber(22),
            try LottoNumber(33),
            try LottoNumber(44),
            try LottoNumber(15),
            try LottoNumber(16)
        ])

        let userLotto1 = Lotto(lottoNumbers1)
        let userLotto2 = Lotto(lottoNumbers2)
        let lottos = Lottos([userLotto1, userLotto2])

        let winningNumbers = try LottoNumbers(numbers: [
            try LottoNumber(1),
            try LottoNumber(2),
            try LottoNumber(3),
            try LottoNumber(4),
            try LottoNumber(15),
            try LottoNumber(17)
        ])

        let bonusNumber = try LottoNumber(16)
        let winnerLotto = try WinnerLotto(winningNumbers, bonus: bonusNumber)
        
        // when
        let fourth: Match.Rank = .fourth
        let count = 1
        
        // then
        XCTAssertTrue(lottos.placeCount(of: fourth, from: winnerLotto) == count)
    }
    
    func test_로또_5등_수_카운트() throws {
        // given
        let lottoNumbers1 = try LottoNumbers(numbers: [
            try LottoNumber(1),
            try LottoNumber(2),
            try LottoNumber(3),
            try LottoNumber(4),
            try LottoNumber(5),
            try LottoNumber(6)
        ])
        
        let lottoNumbers2 = try LottoNumbers(numbers: [
            try LottoNumber(11),
            try LottoNumber(22),
            try LottoNumber(33),
            try LottoNumber(44),
            try LottoNumber(15),
            try LottoNumber(16)
        ])

        let userLotto1 = Lotto(lottoNumbers1)
        let userLotto2 = Lotto(lottoNumbers2)
        let lottos = Lottos([userLotto1, userLotto2])

        let winningNumbers = try LottoNumbers(numbers: [
            try LottoNumber(1),
            try LottoNumber(2),
            try LottoNumber(3),
            try LottoNumber(14),
            try LottoNumber(15),
            try LottoNumber(17)
        ])

        let bonusNumber = try LottoNumber(16)
        let winnerLotto = try WinnerLotto(winningNumbers, bonus: bonusNumber)
        
        // when
        let fifth: Match.Rank = .fifth
        let count = 1
        
        // then
        XCTAssertTrue(lottos.placeCount(of: fifth, from: winnerLotto) == count)
    }
    
    // MARK: - 수익률 테스트 케이스
    func test_수익률_검증() throws {
        // given
        let lottoNumbers1 = try LottoNumbers(numbers: [
            try LottoNumber(1),
            try LottoNumber(2),
            try LottoNumber(3),
            try LottoNumber(4),
            try LottoNumber(5),
            try LottoNumber(6)
        ])
        
        let lottoNumbers2 = try LottoNumbers(numbers: [
            try LottoNumber(11),
            try LottoNumber(22),
            try LottoNumber(33),
            try LottoNumber(44),
            try LottoNumber(15),
            try LottoNumber(16)
        ])
        
        let lottoNumbers3 = try LottoNumbers(numbers: [
            try LottoNumber(11),
            try LottoNumber(22),
            try LottoNumber(33),
            try LottoNumber(44),
            try LottoNumber(15),
            try LottoNumber(16)
        ])
        
        let lottoNumbers4 = try LottoNumbers(numbers: [
            try LottoNumber(11),
            try LottoNumber(22),
            try LottoNumber(33),
            try LottoNumber(44),
            try LottoNumber(15),
            try LottoNumber(16)
        ])
        
        let lottoNumbers5 = try LottoNumbers(numbers: [
            try LottoNumber(11),
            try LottoNumber(22),
            try LottoNumber(33),
            try LottoNumber(44),
            try LottoNumber(15),
            try LottoNumber(16)
        ])

        let userLotto1 = Lotto(lottoNumbers1)
        let userLotto2 = Lotto(lottoNumbers2)
        let userLotto3 = Lotto(lottoNumbers3)
        let userLotto4 = Lotto(lottoNumbers4)
        let userLotto5 = Lotto(lottoNumbers5)
        
        let lottos = Lottos([userLotto1, userLotto2, userLotto3, userLotto4, userLotto5])

        let winningNumbers = try LottoNumbers(numbers: [
            try LottoNumber(1),
            try LottoNumber(2),
            try LottoNumber(3),
            try LottoNumber(14),
            try LottoNumber(15),
            try LottoNumber(17)
        ])

        let bonusNumber = try LottoNumber(16)
        let winnerLotto = try WinnerLotto(winningNumbers, bonus: bonusNumber)
        
        // when
        let profit = 1.0
        
        // then
        XCTAssertTrue(lottos.profit(from: winnerLotto) == profit)
    }
    
    func test_로또_수동2개_자동3개_총5개_구매_검증() throws {
        // given
        let generator = LottoGenerator()
        
        let manualLotto1 = Lotto(
            try LottoNumbers(numbers: [
                try LottoNumber(11),
                try LottoNumber(22),
                try LottoNumber(33),
                try LottoNumber(44),
                try LottoNumber(15),
                try LottoNumber(16)
            ])
        )
        
        let manualLotto2 = Lotto(
            try LottoNumbers(numbers: [
                try LottoNumber(11),
                try LottoNumber(22),
                try LottoNumber(33),
                try LottoNumber(44),
                try LottoNumber(15),
                try LottoNumber(16)
            ])
        )
        
        let manualLottos = Lottos([manualLotto1, manualLotto2])
        
        // when
        let purchaseCount = 5
        let purchaseLottos = try generator.purchase(manualLottos: manualLottos, autoCount: 3)
        
        // then
        XCTAssertTrue(purchaseLottos.count == purchaseCount)
    }
    
}
