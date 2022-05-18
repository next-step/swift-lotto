//
//  LottoError.swift
//  Lotto
//
//  Created by ycsong on 2022/05/19.
//

import Foundation

enum LottoError: LocalizedError {
    case invalidLottoNumber
    case digitError
    case winnerNumberError
    case invalidInput
    case duplicateNumber
    case invalidManualCount
    
    var errorDescription: String {
        switch self {
        case .invalidLottoNumber: return "잘못된 로또 번호"
        case .digitError: return "로또 번호 자릿수 오류"
        case .winnerNumberError: return  "잘못된 당첨 번호"
        case .invalidInput: return "사용자 입력 오류"
        case .duplicateNumber: return "중복 당첨 번호"
        case .invalidManualCount: return "초과 수동 구매"
        }
    }
}
