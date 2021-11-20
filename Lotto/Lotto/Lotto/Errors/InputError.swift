//
//  InputError.swift
//  Lotto
//
//  Created by Mephrine on 2021/11/13.
//

import Foundation

enum InputError: Error {
	case invalid
	case negativeNumber
	case unableToPurchase
	case duplicatedNumber
	case mismatchedNumber
	case outOfRange
	case moreThanTheAmount
}


extension InputError: LocalizedError {
	var errorDescription: String? {
		switch self {
		case .invalid:
			return "유효하지 않은 입력입니다."
		case .negativeNumber:
			return "로또는 1000원부터 구매할 수 있습니다."
		case .unableToPurchase:
			return "음수는 입력하실 수 없습니다."
		case .duplicatedNumber:
			return "중복되는 숫자는 입력하실 수 없습니다."
		case .mismatchedNumber:
			return "로또 숫자는 6자리만 입력 가능합니다."
		case .outOfRange:
			return "로또 숫자는 1~45 사이의 숫자만 입력 가능합니다."
		case .moreThanTheAmount:
			return "금액보다 많은 로또를 구매하실 수 없습니다."
		}
	}
}
