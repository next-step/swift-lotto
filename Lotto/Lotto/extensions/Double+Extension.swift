//
//  Double+Extension.swift
//  Lotto
//
//  Created by Mephrine on 2021/11/08.
//

import Foundation

extension Double {
	var floorTwoDecimalPlaces: Double {
		(floor(self * 100)) / 100
	}
}
