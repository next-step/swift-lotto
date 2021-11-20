//
//  HandOperatedLotto.swift
//  Lotto
//
//  Created by Mephrine on 2021/11/18.
//

import Foundation

struct HandOperatedLotto {
	let lottos : [Lotto]
	
	init(inputLotto: [InputLotto]) {
		self.lottos = inputLotto.map { $0.lotto }
	}
}
