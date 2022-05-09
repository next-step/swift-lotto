//
//  InputView.swift
//  Lotto
//
//  Created by nylah.j on 2022/05/08.
//

import Foundation

struct InputView {
    static func readInput() -> String? {
        print("덧셈할 숫자를 구분자를 기준으로 입력하세요. 구분자는 콜론(:)과 콤마(,)입니다.")
        return readLine()
    }
}
