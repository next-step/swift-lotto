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
	case outOfRangeInLotto
}
