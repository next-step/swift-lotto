//
//  InputView.swift
//  Lotto
//
//  Created by 김성준 on 2022/05/27.
//

import Foundation

struct InputView {
    func validation(_ receivedString: String?) -> Int {
        guard let input: String = receivedString,
              input.isEmpty == false else {
            return 0
        }
        return 1
    }
}
