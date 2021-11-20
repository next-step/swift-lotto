//
//  ResultView.swift
//  Lotto
//
//  Created by Mephrine on 2021/11/10.
//

import Foundation

protocol Presentable {
	func printOut(purchasedLottos: [Lotto], numberOfHandOperated: Int, numberOfAutoPicks: Int)
	func printOut(winningStatistics: WinningStatistics)
	func printOut(error: InputError)
}

struct ResultView: Presentable {
	func printOut(purchasedLottos: [Lotto], numberOfHandOperated: Int, numberOfAutoPicks: Int) {
		printOut(numberOfHandOperated: numberOfHandOperated, numberOfAutoPicks: numberOfAutoPicks)
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
		guard let errorMessage = error.errorDescription else { return }
		print(errorMessage)
	}
	
	private func printOut(numberOfHandOperated: Int, numberOfAutoPicks: Int) {
		print("\n수동으로 \(numberOfHandOperated)장, 자동으로 \(numberOfAutoPicks)장을 구매했습니다.")
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
		let matchingNumber = winnigs.matchCount
		let matchingBonusNumberText = winnigs.isMatchingBonusNumber ? ", 보너스 번호 일치" : " "
		let prize = winnigs.prize
		let numberOfMatchingNumbers = winningStatistics.numberOfWinnings(by: winnigs)
		print("\(matchingNumber)개 일치\(matchingBonusNumberText)(\(prize)원)- \(numberOfMatchingNumbers)개")
	}
	
	private func printOut(rateOfReturn: Double) {
		print("총 수익률은 \(rateOfReturn)입니다.")
	}
}
