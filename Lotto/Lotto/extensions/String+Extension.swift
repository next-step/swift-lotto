//
//  String+Extension.swift
//  Lotto
//
//  Created by Mephrine on 2021/11/06.
//

import Foundation

extension String {
	func toPositiveInt() throws -> Int {
		guard let unwrappedInt = Int(self),
					unwrappedInt > 0
		else { throw ValueError.invalid }
		return unwrappedInt
	}
}
