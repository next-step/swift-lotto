//
//  StubInputView.swift
//  LottoTest
//
//  Created by Mephrine on 2021/11/09.
//

import Foundation

struct StubInputView: Inputable {
	private let inputtedAmount: String?
	
	init(input: String?) {
		self.inputtedAmount = input
	}
	
	func makeAmount() throws -> Amount {
		try Amount(input: inputtedAmount)
	}
}
