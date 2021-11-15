//
//  ResultView.swift
//  Lotto
//
//  Created by Mephrine on 2021/11/10.
//

import Foundation

protocol Presentable {
	func printOut(purchasedLottos: [Lotto])
	func printOut(winningStatistics: WinningStatistics)
	func printOut(error: InputError)
}

struct ResultView: Presentable {
	func printOut(purchasedLottos: [Lotto]) {
		printOut(numberOfPurchasedLottos: purchasedLottos.count)
		purchasedLottos.forEach { lotto in
			print("[\(convertToPresentableString(from: lotto))]")
		}
		printNewLine()
	}

	func printOut(winningStatistics: WinningStatistics) {
		print("\n당첨통계\n---------")
		self.printOutMatchingNumber(of: Winnings.fourthPlace, winningStatistics: winningStatistics)
		self.printOutMatchingNumber(of: Winnings.thirdPlace, winningStatistics: winningStatistics)
		self.printOutMatchingNumber(of: Winnings.secondPlace, winningStatistics: winningStatistics)
		self.printOutMatchingNumber(of: Winnings.firstPlace, winningStatistics: winningStatistics)
		self.printOut(rateOfReturn: winningStatistics.rateOfReturn)
	}
	
	func printOut(error: InputError) {
		switch error {
		case .invalid:
			print("유효하지 않은 입력입니다.")
		case .unableToPurchase:
			print("로또는 1000원부터 구매할 수 있습니다.")
		case .negativeNumber:
			print("음수는 입력하실 수 없습니다.")
		case .duplicatedNumber:
			print("중복되는 숫자는 입력하실 수 없습니다.")
		case .mismatchedNumber:
			print("로또 숫자는 6자리만 입력 가능합니다.")
		case .outOfRange:
			print("로또 숫자는 1~45 사이의 숫자만 입력 가능합니다.")
		}
	}
	
	private func printOut(numberOfPurchasedLottos: Int) {
		print("\(numberOfPurchasedLottos)개를 구매했습니다.")
	}
	
	private func printNewLine() {
		print("")
	}
	
	private func convertToPresentableString(from lotto: Lotto) -> String {
		lotto.numbers
			.map(String.init)
			.joined(separator: ", ")
	}
	
	private func printOutMatchingNumber(of winnigs: Winnings, winningStatistics: WinningStatistics) {
		let matchingNumber = winnigs.matchCount()
		let matchingBonusNumberText = winnigs.isMatchingBonusNumber() ? ", 보너스 번호 일치" : " "
		let prize = winnigs.prize()
		let numberOfMatchingNumbers = winningStatistics.numberOfWinnings(by: winnigs)
		print("\(matchingNumber)개 일치\(matchingBonusNumberText)(\(prize)원)- \(numberOfMatchingNumbers)개")
	}
	
	private func printOut(rateOfReturn: Double) {
		print("총 수익률은 \(rateOfReturn)입니다.")
	}
}
