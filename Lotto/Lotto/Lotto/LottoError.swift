//
//  LottoError.swift
//  Lotto
//
//  Created by 카카오VX on 2022/05/09.
//

import Foundation

enum LottoError: LocalizedError {
    case invalidAmount
    case lackOfAmount
    case invalidManualNumber
    
    var message: String? {
        switch self {
        case .invalidAmount:
            return NSLocalizedString("금액 입력 오류입니다. 숫자만 입력해주세요.", comment: "금액 입력 오류")
        case .lackOfAmount:
            return NSLocalizedString("금액 입력 오류입니다. 1000(원) 이상 입력해주세요.", comment: "금액 입력 오류")
        case .invalidManualNumber:
            return NSLocalizedString("수동번호 입력 오류입니다. (1, 2, 3, 4, 5, 6)과 같은 형식으로 입력해주세요.", comment: "수동번호 입력 오류")
        }
    }
}
